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
        chatsArray = [Chat]()
        if let path = Bundle.main.path(forResource: "Chats", ofType: "plist"),
            let allChats = NSArray(contentsOfFile: path) as? [Dictionary<String, Any>] {
            for chat in allChats {
                let newChat = Chat(dict: chat)
                chatsArray?.append(newChat)
                
            }
        }
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
 
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
