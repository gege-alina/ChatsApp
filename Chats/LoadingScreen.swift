//
//  ViewController.swift
//  Chats
//
//  Created by Gege on 08/10/2017.
//  Copyright © 2017 georgiana. All rights reserved.
//

import UIKit

class LoadingScreen: UIViewController {

    @IBOutlet var loadingImageView: UIImageView!
    
    var loading_1: UIImage!
    var loading_2: UIImage!
    var loading_3: UIImage!
    var loading_4: UIImage!
    var loading_5: UIImage!
    var loading_6: UIImage!
    
    var images: [UIImage]!
    var animatedImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loading_1 = UIImage(named: "act1")
        loading_2 = UIImage(named: "act2")
        loading_3 = UIImage(named: "act3")
        loading_4 = UIImage(named: "act4")
        loading_5 = UIImage(named: "act5")
        loading_6 = UIImage(named: "act6")
        
        images = [loading_1, loading_2, loading_3, loading_4, loading_5, loading_6]
        animatedImage = UIImage.animatedImage(with: images, duration: 1.0)
        loadingImageView.image = animatedImage
        self.perform(#selector(stopAnimation), with: nil, afterDelay: 2.0)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc private func stopAnimation() {
        loadingImageView.image = nil
        self.performSegue(withIdentifier: Constants.showChatsSegue, sender: nil)
    }


}

