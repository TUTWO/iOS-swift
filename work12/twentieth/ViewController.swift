//
//  ViewController.swift
//  twentieth
//
//  Created by student on 2018/12/15.
//  Copyright © 2018年 涂梦婷. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    @IBOutlet weak var tfGender: UITextField!
    @IBOutlet weak var tfAge: UITextField!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print(NSHomeDirectory())
    }

    @IBAction func Add(_ sender: Any) {
        let person = Person(context: context)
        person.name = tfName.text
        person.phone = tfPhone.text
        person.age = Int16(tfAge.text!)!
        person.gender = tfGender.text

    }
    
    @IBAction func update(_ sender: Any) {
        let fetch:NSFetchRequest<Person> = Person.fetchRequest()
        fetch.predicate = NSPredicate(format: "name=%@", tfName.text!)
        let persons = try? context.fetch(fetch)
        if let p = persons?.first {
            p.phone = tfPhone.text
            p.age = Int16(tfAge.text!)!
            p.gender = tfGender.text
        }
    }
    
    @IBAction func del(_ sender: Any) {
        let fetch:NSFetchRequest<Person> = Person.fetchRequest()
        fetch.predicate = NSPredicate(format: "name=%@", tfName.text!)
        let persons = try? context.fetch(fetch)
        if let p = persons?.first {
            context.delete(p)
        }
    }
    
    @IBAction func query(_ sender: Any) {
        let fetch:NSFetchRequest<Person> = Person.fetchRequest()
        fetch.predicate = NSPredicate(format: "name=%@", tfName.text!)
        let persons = try? context.fetch(fetch)
        if let p = persons?.first {
            tfPhone.text = p.phone
            tfAge.text = String(p.age)
            tfGender.text = p.gender
        }
    }
    
    @IBAction func done(_ sender: Any) {
        let person = Person(context: context)
        person.name = tfName.text
        person.phone = tfPhone.text
        person.age = Int16(tfAge.text!)!
        person.gender = tfGender.text
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

