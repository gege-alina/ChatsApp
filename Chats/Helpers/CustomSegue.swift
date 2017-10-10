//
//  CustomSegue.swift
//  Chats
//
//  Created by Georgiana Stefan on 10/10/2017.
//  Copyright © 2017 georgiana. All rights reserved.
//

import UIKit

class CustomSegue: UIStoryboardSegue {

    override func perform() {
    let firstVCView = self.source.view as UIView!
    let secondVCView = self.destination.view as UIView!

    // Get the screen width and height.
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height

    // Specify the initial position of the destination view.
    secondVCView?.frame = CGRect(x: 0.125 * screenWidth, y: 0.125 * screenHeight, width: 0.75 * screenWidth, height: 0.75 * screenHeight)

    // Access the app's key window and insert the destination view above the current (source) one.
    let window = UIApplication.shared.keyWindow
        window?.insertSubview(secondVCView!, belowSubview: firstVCView!)

    // Animate the transition.
        UIView.animate(withDuration:1.0, animations: { () -> Void in
            firstVCView?.alpha = 0.0
            firstVCView?.frame = CGRect(x: -0.25 * screenWidth, y: -0.25 * screenHeight, width: 1.5 * screenWidth, height: 1.5 * screenHeight)
            secondVCView?.frame = CGRect(x: 0.0, y: 0.0, width: screenWidth, height: screenHeight)

        }) { (Finished) -> Void in
            self.source.present(self.destination as UIViewController, animated: false, completion: nil)
        }
    }

}
