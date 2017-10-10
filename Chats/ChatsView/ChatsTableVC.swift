//
//  ChatsTableVC.swift
//  Chats
//
//  Created by Gege on 08/10/2017.
//  Copyright © 2017 georgiana. All rights reserved.
//

import UIKit

class ChatsTableVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var chatsTableView: UITableView!
    var chatsArray: [Chat]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        readChatsFromFile()
        //getChats()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let chats = chatsArray {
            return chats.count
        }
        return 0
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.tableViewCellIdentifier, for: indexPath) as! ChatTableViewCell

        cell.configureWithChat(chatsArray![indexPath.row])

        return cell
    }

    private func readChatsFromFile() {
        chatsArray = [Chat]()
        if let path = Bundle.main.path(forResource: Constants.fileName, ofType: Constants.fileExtension),
            let allChats = NSArray(contentsOfFile: path) as? [Dictionary<String, Any>] {
            for chat in allChats {
                let newChat = Chat(dict: chat)
                chatsArray?.append(newChat)

            }
        }
    }

    private func getChats() {
        let apiManager = APIManager()
        apiManager.getChats(withURL: Constants.URL) {_ in
            //save chats from server into chatsArray
        }
    }
}
