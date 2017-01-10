//: Playground - noun: a place where people can play

import Cocoa

/*
 Chapter 4
 Constants and Variables
 */

//常量和变量
//1.必须声明常量和变量的类型，或者指定初始值，swift会推测出类型
//2.常量值和类型声明以后不能再改变，变量类型不再变量

//Variables are mutable - you can change their values (but not their type)
var x = 10 // var 变量
    x = 20

//Constants are immutable. Once you’ve declared them, they cannot be changed again. Attempting to modify a constant in any way will result in an error
let y = 5 //let 常量
    //y = 6

//unicode也可作变量名
let π = 3.14
let r = 2.5
print(π * r * r)

/*
 Chapter 5
 Static Typing and Type Inference
 
 Swift is statically, strongly typed and uses type inference to determine the initial 
 type of all your variables and constants.
 
 swift 是静态的，强类型语言，会推断所以常量和变量的类型
 
 5.1 Statically typed
 所谓静态类型是指所有的常量、变量和函数都必须先声明类型，否则编译不过
 
 */

//5.2 Type inference
/*
 swift 会去推断变量、常量的类型，所以声明一个变量时，
 1.给它一个初始化的值，或
 2.指定类型
 */

var s:String
var s1 = "s1"
//var s2 //error

//5.3 Strongly typed
/*
 swift 是强类型语言，无论什么时候，你使用变量或传值给方法，swift都会检查
 类型是否正确，在编译的时候。
 */

func adder(x:Int, y:Int) -> Int{
    print("Adding Int")
    return (x + y)
}

adder(x: 1, y: 1)
//adder(x: 1.0, y: 1.0)//尼玛，这都会错,类型不对

//5.4 Type Safety
/*
 Swift is a type-safe language.
 
 swift 使用类型签名，保证方法、函数能被正确调用，
 可以声明多个同名函数，但是参数类型不一样。
 */

func adder(x:Float, y:Float) -> Float{
    print("Adding Floats")
    return x + y
}

adder(x: 1, y: 10)
adder(x: 1.0, y: 10.0)
adder(x: 1.0, y: 10)
adder(x: 1, y: 10.0)





