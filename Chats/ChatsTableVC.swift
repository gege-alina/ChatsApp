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
            print(chatsArray ?? [])
        }
        
//        //get the path of the plist file
//        guard let plistPath = Bundle.main.path(forResource: "data", ofType: "plist") else { return }
//        //load the plist as data in memory
//        guard let plistData = FileManager.default.contents(atPath: plistPath) else { return }
//        //use the format of a property list (xml)
//        var format = PropertyListSerialization.PropertyListFormat.xml
//        //convert the plist data to a Swift Dictionary
//        guard let  plistDict = try! PropertyListSerialization.propertyList(from: plistData, options: .mutableContainersAndLeaves, format: &format) as? [String : AnyObject] else { return }
//        //access the values in the dictionary
//        if let value = plistDict["aKey"] as? String {
//            //do something with your value
//            print(value)
//        }
//        //you can also use the coalesce operator to handle possible nil values
//        var myValue = plistDict["aKey"] ?? ""
//
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if let chats = chatsArray {
            return chats.count
        }
        return 0
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.tableViewCellIdentifier, for: indexPath)

        cell.textLabel?.text = chatsArray![indexPath.row].message

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
