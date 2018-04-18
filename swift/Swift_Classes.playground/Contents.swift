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
/**
 *  swift有两种类型属性
 *      1.存储属性: 用var或let声明，并给定初始值
 *      2.计算属性: 用var声明，不给定初始值而是提供一个 getter 和一个可选的 setter，
 *                来间接获取和设置其他属性或变量的值。
 */

class Circle {
    var radius = 1.0 //存储属性
    //只有只读计算值，不需要特别声明get、set
    var area : Double{ //计算属性
        return (radius * radius * 3.14)
    }
}

var c = Circle()

c.area // 3.14
c.radius = 2.5
c.area // 19.625

//定义一个类，包含get、set方法的计算属性
class Circle2 {
    var radius = 1.0;
    //计算属性：包含set、get
    var area : Double {
        set(new_area){
            radius = sqrt(new_area/3.14)
        }
        get{
            return (radius * radius * 3.14)
        }
    }
}

var c2 = Circle2()

c2.area // 3.14
c2.radius = 2.5
c2.area // 19.625
c2.area = 9 * 3.14
c2.radius

//12.4 Lazy stored properties 延迟存储属性
/**
 *  延迟存储属性是指当第一次被调用的时候才会计算其初始值的属性。
 *  在属性声明前使用 lazy 来标示一个延迟存储属性。
 *
 *  注意
 *      必须将延迟存储属性声明成变量（使用 var 关键字），因为属性的初始值可能在实例构造完成之后才会
 *      得到。而常量属性在构造过程完成之前必须要有初始值，因此无法声明成延迟属性。
 */

//12.5 Property callbacks
/**
 *  属性值发生变化时，是可以监测到的,下面两个方法会被调用
 *      willSet
 *      didSet
 */

class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        
        didSet {
            if totalSteps > oldValue  { //didSet没有为旧值提供自定义名称，所以默认值 
                                        //oldValue 表示旧值的参数名。
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
// About to set totalSteps to 200
// Added 200 steps
stepCounter.totalSteps = 360
// About to set totalSteps to 360
// Added 160 steps
stepCounter.totalSteps = 896
// About to set totalSteps to 896
// Added 536 steps

//12.6 Subscripts
/**
 *  下标 （subscripts）可以定义在类（class）、结构体（structure）和枚举（enumeration）中
 *  ，是访问集合（collection），列表（list）或序列（sequence）中元素的快捷方式。
 *  可以使用下标的索引，设置和获取值，而不需要再调用对应的存取方法。
 */

class Hand{
    var cards = ["Ah", "Ad", "Ac", "As", "7c"]
    subscript(index: Int) -> String{
         return cards[index]
        }
}
var h = Hand()
h[3] // "As"

//12.7 Object Initialization 构造过程
/**
 *  定义类的时候，可以通过构造方法设置default值
 *  init:声明构造方法
 */

class InitializedCircle {
    var radius : Float
    //构造函数
    init(initialRadius:Float) {
        radius = initialRadius
    }
    
    var area : Float{
        return (3.14 * radius * radius)
    }
}

//var circle3 = InitializedCircle() //error
var circle3 = InitializedCircle(initialRadius: 2.5)

circle3.area //19.625
circle3.radius//2.5

//12.8 Deinitialization 析构过程
/**
 *  可在对象被销毁之前，执行一些代码
 *  deinit function,只对类有效
 */
import Foundation

class MelancholicCircle{
    var radius = 1.0
    var area:Double {
        return(3.14 * radius * radius)
    }
    deinit{
        print("Goodbye Cruel World")
    }
}
var mc: MelancholicCircle?
mc = MelancholicCircle()
print("Radius is \(mc!.radius)")
mc = nil

//12.9 Inheritance 和oc类似









