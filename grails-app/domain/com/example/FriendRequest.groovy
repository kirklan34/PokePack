package com.example

class FriendRequest {
    User sender
    User receiver
    Boolean accepted = false

    static constraints = {
        sender nullable: false
        receiver nullable: false
        accepted nullable: false
    }
}
