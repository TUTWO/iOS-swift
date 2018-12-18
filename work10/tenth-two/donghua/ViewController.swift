//
//  ViewController.swift
//  donghua
//
//  Created by student on 2018/11/27.
//  Copyright © 2018年 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myview: UIView!
    var timer:Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true, block: {
            (mytimer) in
            self.myview.center.x += 10
        })
    }

    @IBAction func btnClicked(_ sender: Any) {
        timer?.invalidate()
        super.didReceiveMemoryWarning()
        UIView.animate(withDuration: 3, delay: 2, options: .curveEaseOut, animations: {
            self.myview.alpha=0
            self.myview.transform = CGAffineTransform(rotationAngle:CGFloat(Double.pi))
            self.myview.transform = CGAffineTransform.identity
            self.myview.transform = CGAffineTransform(rotationAngle:CGFloat(Double.pi))
            self.myview.transform = CGAffineTransform.identity
            self.myview.transform = CGAffineTransform(rotationAngle:CGFloat(Double.pi))
            self.myview.transform = CGAffineTransform.identity
        }){(finished) in
            self.myview.removeFromSuperview()
        }
        
    }
    
    override func didReceiveMemoryWarning() {
    }


}

