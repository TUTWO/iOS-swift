//
//  SecondViewController.swift
//  eleventh-one
//
//  Created by student on 2018/12/15.
//  Copyright © 2018年 涂梦婷. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

//    var name = ""
//    var No = ""
    
    var stu: Student!
//    var delegate: StudentProtocal?
    @IBOutlet weak var tfNo: UITextField!
    @IBOutlet weak var tfName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tfNo.text = stu.no
        tfName.text = stu.name
        // Do any additional setup after loading the view.
    }
    
    @IBAction func close(_ sender: Any) {
        stu.no = tfNo.text!
        stu.name = tfName.text!
//        delegate?.change(name: name, no: No)
        
        navigationController?.popViewController(animated: true)
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
