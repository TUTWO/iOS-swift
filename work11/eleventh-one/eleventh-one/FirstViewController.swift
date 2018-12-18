//
//  ViewController.swift
//  eleventh-one
//
//  Created by student on 2018/12/15.
//  Copyright © 2018年 涂梦婷. All rights reserved.
//

import UIKit

//protocol StudentProtocal {
//    func change(name:String,no:String)
//}

class FirstViewController: UIViewController {

    var stu = Student()
    
    func change(name: String, no: String) {
        self.name = name
        self.no = no
    }
    var no = ""
    var name = ""
    
    @IBOutlet weak var tfNo: UITextField!
    @IBOutlet weak var tfName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tfNo.text = stu.no
        tfName.text = stu.name
    }

    @IBAction func showSecondVC(_ sender: Any) {
        stu.no = tfNo.text!
        stu.name = tfName.text!
        
        let secVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondVC") as! SecondViewController

        secVC.stu = stu
//        secVC.No = stu.no
//        secVC.name = stu.name
//        secVC.delegate = self
        
        self.navigationController?.pushViewController(secVC, animated: true)
    }
    
    @IBAction func showThirdVC(_ sender: Any) {
        let thirdVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ThirdVC")
        present(thirdVC, animated: true, completion: nil)
    }
}

