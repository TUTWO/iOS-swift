//
//  ViewController.swift
//  10.2
//
//  Created by student on 2018/11/21.
//  Copyright © 2018年 2016110429. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func backChange(_ sender: Any) {
        UIView.transition(with: myView, duration: 2, options: .transitionFlipFromLeft, animations: {
            self.myView.backgroundColor = UIColor.blue
        }, completion: nil)
    }
    
    @IBAction func viewChange(_ sender: Any) {
        let imageView = UIImageView(frame: CGRect(x: 66, y: 66, width: 333, height: 333))
        imageView.image = UIImage(named: "image")
        UIView.transition(from: myView, to: imageView, duration: 2, options: .transitionFlipFromRight, completion: nil)
    }
    
}

