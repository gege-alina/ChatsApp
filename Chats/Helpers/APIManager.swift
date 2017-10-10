//
//  APIManager.swift
//  Chats
//
//  Created by Georgiana Stefan on 10/10/2017.
//  Copyright © 2017 georgiana. All rights reserved.
//

import UIKit

class APIManager: NSObject {

    func getChats(withURL withUrl:String, completionHandler handler: @escaping ([Any]) -> Void) {

        if let usableUrl = URL(string: withUrl) {
            let request = URLRequest(url: usableUrl)
            let task = URLSession.shared.dataTask(with: request,
                                                  completionHandler:
                { (data, response, error) in
                    if let data = data {
                        if let stringData = String(data: data, encoding: String.Encoding.utf8) {


                            //TODO: convert data to Array
                            //call handler with Array of Chats
                        }
                    }
            })
            task.resume()
        }
    }

//    func convertToDictionary(text: String) -> [String: Any]? {
//        if let data = text.data(using: .utf8) {
//            do {
//                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
//            } catch {
//                print(error.localizedDescription)
//            }
//        }
//        return nil
//    }

//    func parseJsonFromData(_ data:Data) -> [Int] {
//        do {
//            let json = try JSONSerialization.jsonObject(with: data, options: [])
//            guard let array = json as? [Int] else {
//                return []
//            }
//            return array
//        } catch {
//            return []
//        }
//    }
}
