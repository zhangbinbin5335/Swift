//: Playground - noun: a place where people can play

import Cocoa

/*
 Chapter 10
 Optionals:与nil和null比较类似
 */

//声明 optionals
var name1 = "Jack"

var name2:String = "Tom" //Tom

var name3:String? = nil //Optionals:加？声明，Optionals可以用nil初始化值

var name4:String? = "Lucy"

if(name3 == nil){
    print("name3 == nil")
}

//Forced unwrapping:添加！强制展开
name4! //Lucy,但是强制展开nil，会runtime error
       //所以展开时，可以增加条件判断
if(name4 == nil){
    print("name4 == nil")
}else{
    print("name4 == \(name4)")
}

if let temp = name4 {           //if let 可以取到options的值
    print("name4 == \(temp)")
}else{
    print("name4 == nil")
}

//可选类型的使用



