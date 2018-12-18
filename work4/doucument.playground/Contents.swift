//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
let fileManager=FileManager.default
if var docPath=fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
{
     docPath.appendPathComponent("3.jpg")
    if !fileManager.fileExists(atPath: docPath.path){
        let imageUrl=URL(string: "http://img.zcool.cn/community/01f09e577b85450000012e7e182cf0.jpg@1280w_1l_2o_100sh.jpg")
        let imageData=try Data(contentsOf: imageUrl!)
        _=UIImage(data: imageData)
        docPath.appendPathComponent("3.jpg")
        try imageData.write(to:docPath)
    }else{
        let imageData=try Data(contentsOf: docPath)
        _=UIImage(data: imageData)
    }
}
