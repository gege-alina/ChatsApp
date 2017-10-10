//
//  ChatTableViewCell.swift
//  Chats
//
//  Created by Georgiana Stefan on 10/10/2017.
//  Copyright © 2017 georgiana. All rights reserved.
//

import UIKit

class ChatTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var unreadMessagesLabel: UILabel!

    static var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        dateFormatter.amSymbol = "AM"
        dateFormatter.pmSymbol = "PM"
        return dateFormatter
    }
    override func awakeFromNib() {
        super.awakeFromNib()

        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureWithChat(_ chat: Chat) {
//        if let url = URL(string: chat.url) {
//            downloadImage(url: url)
//        }
        avatarImage.loadImageUsingCache(withUrl: chat.url)
        nameLabel.text = chat.name
        messageLabel.text = chat.message
        let todaysDate = ChatTableViewCell.dateFormatter.string(from: chat.sendingDate)
        timeLabel.text = todaysDate
        unreadMessagesLabel.text = chat.unreadMessages == 0 ? "0 messages" : "+ \(chat.unreadMessages) messages"
    }

    private func downloadImage(url: URL) {
        getDataFromUrl(url: url) { data, response, error in
            guard let data = data,
                error == nil else {
                    return
            }
            DispatchQueue.main.async() {
                self.avatarImage.image = UIImage(data: data)
            }
        }
    }

    private func getDataFromUrl(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            completion(data, response, error)
            }.resume()
    }

}
