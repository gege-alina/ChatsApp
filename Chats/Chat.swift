//
//  Chat.swift
//  Chats
//
//  Created by Gege on 08/10/2017.
//  Copyright © 2017 georgiana. All rights reserved.
//

import UIKit

class Chat: NSObject {
    
    var id: Int
    var name: String
    var url: String
    var message: String
    var unreadMessages: Int
    var sendingDate: Date
    
    private init(id: Int, name: String, url: String, message: String, unreadMessages: Int, sendingDate: Date)
    {
        self.id = id
        self.name = name
        self.url = url
        self.message = message
        self.unreadMessages = unreadMessages
        self.sendingDate = sendingDate
        super.init()
    }
    
    convenience init(dict: Dictionary<String, Any>)
    {
        let id = dict["identifier"]
        let name = dict["fullname"]
        let url = dict["avatarURL"]
        let message = dict["message"]
        let unreadMessages = dict["unreadMessagesCount"]
        let sendingDate = dict["sendingDate"]

        self.init(id: id as! Int,
                  name: name as! String,
                  url: url as! String,
                  message: message as! String,
                  unreadMessages: unreadMessages as! Int,
                  sendingDate: sendingDate as! Date)

    }

}
