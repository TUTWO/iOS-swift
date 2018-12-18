//
//  Person.swift
//  eighth
//
//  Created by student on 2018/12/15.
//  Copyright © 2018年 at. All rights reserved.
//

import Foundation

//性别枚举
enum Gender: Int {
    case male
    case female
    static func >(lhs: Gender, rhs:Gender) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}

//school协议
protocol SchoolProtocol {
    var department: Int { get set }
    func lendBook()
}


//Person类
class Person {
    var firstName: String
    var lastName: String
    var age: Int
    var gender: Gender
    
    var fullName: String {
        get {
            return firstName + lastName
        }
    }
    init(firstName: String, lastName: String, age: Int, gender: Gender) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.gender = gender
    }
    convenience init(firstName: String, age: Int, gender: Gender) {
        self.init(firstName: firstName, lastName: "", age: age, gender: gender)
    }
    
    //重载==
    static func ==(lhs: Person, rhs: Person) -> Bool {
        return lhs.fullName == rhs.fullName && lhs.age == rhs.age && lhs.gender == rhs.gender
    }
    
    //重载!=
    static func !=(lhs: Person, rhs: Person) -> Bool {
        return !(lhs == rhs)
    }
    
    //实现CustomStringConvertible协议中的计算属性，可以使用print直接输出对象内容
    var description: String {
        return "fullName: \(self.fullName), age: \(self.age), gender: \(self.gender)"
    }
    
    //输出Person XXX is running
    func run() {
        print("Person \(self.fullName) is running")
    }
    
}

//Teacher类
class Teacher: Person, SchoolProtocol {
    var title: String  //标题
    var department: Int  //公寓
    //构造方法
    init(title: String, firstName: String, lastName: String, age: Int, gender: Gender, department: Int ) {
        self.title = title
        self.department = department
        super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)
    }
    
    
    //重写父类的计算属性
    override var description: String {
        return "title: \(self.title), fullName: \(self.fullName), age: \(self.age), gender: \(self.gender), department: \(self.department)"
    }
    
    //重载父类run方法
    override func run() {
        print("Teacher \(self.fullName) is running")
    }
    
    //遵循协议的方法
    func lendBook() {
        print("Teacher \(self.fullName) lend a book")
    }
}

//Student类
class Student: Person, SchoolProtocol {
    var stuNo: Int  //学号
    var department: Int  //公寓
    
    //构造方法
    init(stuNo: Int, firstName: String, lastName: String, age: Int, gender: Gender, department: Int) {
        self.stuNo = stuNo
        self.department = department
        super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)
    }
    //重写父类的计算属性
    override var description: String {
        return "stuNo: \(self.stuNo), fullName: \(self.fullName), age: \(self.age), gender: \(self.gender), department: \(self.department)"
    }
    
    //重载父类run方法
    override func run() {
        print("Student \(self.fullName) is running")
    }
    
    //遵循协议的方法
    func lendBook() {
        print("Teacher \(self.fullName) lend a book")
    }
}

