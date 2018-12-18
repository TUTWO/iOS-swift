//
//  ViewController.swift
//  eighth
//
//  Created by student on 2018/12/15.
//  Copyright © 2018年 at. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView!
    var studentArr = [Student]()
    var teacherArr = [Teacher]()
    var sectionTitle = ["Teacher", "Student"]
    var rightItem: UIBarButtonItem!
    var leftItem: UIBarButtonItem!
    var alert:UIAlertController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "TableView"
        
        let student1 = Student(stuNo: 2016110301, firstName: "chen", lastName: "yating", age: 20, gender: Gender.female, department: 4)
        let student2 = Student(stuNo: 2016110302, firstName: "liu", lastName: "yawei", age: 21, gender: Gender.female, department: 4)
        studentArr.append(student1)
        studentArr.append(student2)
        
        let teacher1 = Teacher(title: "iOS", firstName: "li", lastName: "guiyang", age: 30, gender: Gender.male, department: 1)
        let teacher2 = Teacher(title: "Windows", firstName: "fan", lastName: "xaingkui", age: 32, gender: Gender.male, department: 1)
        
        teacherArr.append(teacher1)
        teacherArr.append(teacher2)
        
        studentArr.sort { (a, b) -> Bool in
            return a.fullName < b.fullName
        }
        
        teacherArr.sort { (a, b) -> Bool in
            return a.fullName < b.fullName
        }
        
        rightItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(edit))
        self.navigationItem.rightBarButtonItem = rightItem
        
        leftItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addStudent))
        self.navigationItem.leftBarButtonItem = leftItem
        
        tableView  = UITableView(frame: self.view.bounds)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        
        
    }
    
    @objc func edit() {
        if tableView.isEditing {
            rightItem.title = "Edit"
            tableView.isEditing = false;
        } else {
            rightItem.title = "Finish"
            tableView.isEditing = true
        }
    }
    
    @objc func addStudent() {
        alert = UIAlertController(title: "add student", message: "please input", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "studentID"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "first name"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "last name"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "male/female"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "age"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "department"
        }
        let addButton = UIAlertAction(title: "add", style: .default) { (UIAlertAction) in
            self.add()
        }
        let cancelButton = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        
        alert.addAction(addButton)
        alert.addAction(cancelButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    func add() {
        let id = Int(alert.textFields![0].text!)
        let firstName = alert.textFields![1].text!
        let lastName = alert.textFields![2].text!
        let gender: Gender
        print(alert.textFields!)
        switch alert.textFields![3].text! {
        case "male":
            gender = .male
        default:
            gender = .female
        }
        let age = Int(alert.textFields![4].text!)
        let department = Int(alert.textFields![5].text!)
        
        let student = Student(stuNo: id!, firstName: firstName, lastName: lastName, age: age!, gender: gender, department:department!)
        studentArr.append(student)
        
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return teacherArr.count
        } else {
            return studentArr.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = sectionTitle[indexPath.section]
        
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        
        if cell == nil {
//            let style : UITableViewCell.CellStyle = (identifier == "Teacher") ?  .subtitle : .default
            let style : UITableViewCell.CellStyle = .subtitle
            cell = UITableViewCell.init(style: style, reuseIdentifier: identifier)
        }
        
        switch identifier {
        case "Teacher":
            cell?.textLabel?.text = teacherArr[indexPath.row].fullName
            cell?.detailTextLabel?.text = teacherArr[indexPath.row].description
            cell?.accessoryType = .disclosureIndicator // 为每个cell添加 > 图标
            cell?.backgroundColor = UIColor.yellow
            
        case "Student":
            cell?.textLabel?.text = studentArr[indexPath.row].fullName
            cell?.detailTextLabel?.text = studentArr[indexPath.row].description
            cell?.accessoryType = .disclosureIndicator // 为每个cell添加 > 图标
            cell?.backgroundColor = UIColor.gray
        default:
            break
        }
        return cell!
    }
    
    // 修改每个section的头
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitle[section]
    }
    
    // 指明section的个数
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitle.count
    }
    
    // 实现删除
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCell.EditingStyle.delete {
            if indexPath.section == 0 {
                teacherArr.remove(at: indexPath.row)
            } else {
                studentArr.remove(at: indexPath.row)
            }
            
            tableView.deleteRows(at: [indexPath], with: .left)
        }
        
    }
    
    // 实现移动
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        if sourceIndexPath.section != destinationIndexPath.section {
            tableView.reloadData()
        } else {
            if sourceIndexPath.section == 0 {
                teacherArr.insert(teacherArr.remove(at: sourceIndexPath.row), at: destinationIndexPath.row)
            } else {
                studentArr.insert(studentArr.remove(at: sourceIndexPath.row), at: destinationIndexPath.row)
            }
        }
    }
    
    // 实现显示选择
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectTch: Teacher!
        let selectStu: Student!
        let alert: UIAlertController!
        
        if indexPath.section == 0 {
            selectTch = teacherArr[indexPath.row]
            alert = UIAlertController(title: "More Information", message: selectTch.description, preferredStyle: .alert)
        } else {
            selectStu = studentArr[indexPath.row]
            alert = UIAlertController(title: "More Information", message: selectStu.description, preferredStyle: .alert)
        }
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    

}

