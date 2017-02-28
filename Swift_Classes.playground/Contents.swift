//: Playground - noun: a place where people can play

import Cocoa

/**
 * Chapter 12
 *  Classes
 */

//12.1 Defining a class

/**
 * class:定义一个类
 * （）：实例化一个对象
 */

//定义Animal类
class Animal {
    var species = ""//默认为空
    
}

//实例化对象
let dog = Animal()

dog.species //
dog.species = "dog"
dog.species

//12.2 Methods
class MethodCricle {
    var radius = 1.0
    
    func area() -> Double {
        return (3.14 * radius * radius)
    }
    
    func description() -> String {
        return ("I am a Cricle")
    }
}

var m = MethodCricle()

m.area()
m.description()

//12.3 Properties: stored and computed










