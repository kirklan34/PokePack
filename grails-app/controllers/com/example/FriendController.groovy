package com.example


class FriendController {

    def index() {
        def user = User.get(session.userId)
        if (!user) {
            log.error("Usuario no encontrado en la sesión.")
            redirect(controller: "Auth", action: "index")
            return
        }

        log.info("Usuario actual: ${user.username} (ID: ${user.id})")

        def receivedRequests = FriendRequest.findAllByReceiverAndAccepted(user, false)
        log.info("Solicitudes de amistad recibidas (pendientes): ${receivedRequests*.id}")

        def sentRequests = FriendRequest.findAllBySenderAndAccepted(user, false)
        log.info("Solicitudes de amistad enviadas (pendientes): ${sentRequests*.id}")

        def friends = FriendRequest.createCriteria().list {
            or {
                and {
                    eq("sender", user)
                    eq("accepted", true)
                }
                and {
                    eq("receiver", user)
                    eq("accepted", true)
                }
            }
        }
        log.info("Amigos aceptados: ${friends*.id}")

        render(view: "friends", model: [
                receivedRequests: receivedRequests,
                sentRequests: sentRequests,
                friends: friends,
                currentUser: user
        ])
    }

    def sendRequest(String username) {
        def sender = User.get(session.userId)
        def receiver = User.findByUsername(username)

        if (!sender) {
            flash.message = "Error: Usuario no encontrado en la sesión."
            redirect(action: "index")
            return
        }

        if (!receiver) {
            flash.message = "Error: El usuario '${username}' no existe."
            redirect(action: "index")
            return
        }

        if (sender.id == receiver.id) {
            flash.message = "Error: No puedes enviarte una solicitud de amistad a ti mismo."
            redirect(action: "index")
            return
        }

        if (FriendRequest.findBySenderAndReceiver(sender, receiver) ||
                FriendRequest.findBySenderAndReceiver(receiver, sender)) {
            flash.message = "Error: Ya existe una solicitud o relación de amistad con este usuario."
            redirect(action: "index")
            return
        }

        new FriendRequest(sender: sender, receiver: receiver).save(flush: true, failOnError: true)
        flash.message = "Solicitud de amistad enviada a '${username}'."
        redirect(action: "index")
    }

    def acceptRequest(Long requestId) {
        def request = FriendRequest.get(requestId)
        if (!request || request.receiver.id != session.userId) {
            flash.message = "Solicitud no válida."
            redirect(action: "index")
            return
        }

        request.accepted = true
        request.save(flush: true, failOnError: true)
        flash.message = "Solicitud de amistad aceptada."
        redirect(action: "index")
    }

    def deleteFriend(Long friendId) {
        def user = User.get(session.userId)
        def friendRequest = FriendRequest.createCriteria().get {
            or {
                and {
                    eq("sender", user)
                    eq("receiver", User.get(friendId))
                }
                and {
                    eq("sender", User.get(friendId))
                    eq("receiver", user)
                }
            }
        }

        if (friendRequest) {
            friendRequest.delete(flush: true)
            flash.message = "Amigo eliminado correctamente."
        } else {
            flash.message = "No se pudo eliminar al amigo."
        }

        redirect(action: "index")
    }
    def deleteRequest(Long requestId) {
        def user = User.get(session.userId)
        def request = FriendRequest.findByIdAndSender(requestId, user)

        if (!request) {
            flash.message = "No se pudo encontrar la solicitud o no tienes permiso para eliminarla."
            redirect(action: "index")
            return
        }

        request.delete(flush: true)
        flash.message = "Solicitud de amistad eliminada correctamente."
        redirect(action: "index")
    }
}