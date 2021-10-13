//
//  SocketManager.swift
//  PhoenixClientPractice
//
//  Created by beomkey on 2021/10/12.
//

import Foundation
import SwiftPhoenixClient

class SocketManager {
    let socket = Socket("ws://localhost:4000/socket/websocket")
    lazy var lobby = socket.channel("room:lobby")
    
    func connect() {
        socket.connect()
        
        lobby.join()
            .receive("ok") { message in print("Channel Joined", message.payload) }
            .receive("error") { message in print("Failed to join", message.payload) }
        
        self.onMessage()
    }
    
    func disconnect() {
        socket.disconnect()
    }
    
    private func onMessage() {
        socket.onMessage(callback: { message in
            print(message.payload)
        })
    }
}
