package com.example

class TradeRequest {
    User requester
    User targetUser
    Card requesterCard
    Card targetCard
    String status // PENDING, ACCEPTED, REJECTED

    static constraints = {
        status inList: ["PENDING", "ACCEPTED", "REJECTED"]
    }
}