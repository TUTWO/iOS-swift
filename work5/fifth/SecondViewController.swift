//
//  SecondViewController.swift
//  fifth
//
//  Created by student on 2018/11/24.
//  Copyright © 2018年 tmt. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.purple
        self.title = "second"
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 120, width: 400, height: 400))
        imageView.image = UIImage(named: "hotdog")
        imageView.center = view.center
        view.addSubview(imageView)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
