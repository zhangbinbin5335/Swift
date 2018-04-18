//: Playground - noun: a place where people can play

import Cocoa

/*
 Chapter 11
 Functions and Closures
 */

//function:用func声明

//x:参数类型，y：参数类型 -> Int 返回值类型
func intAdder(x:Int, y:Int)->Int{
    return (x + y)
}

//无参无返回值
func printHelloWorld() ->Void{
    print("Hello World")
}

//call intAdder
intAdder(x: 3, y: 4) // 7
printHelloWorld()

/*Local and external parameters:局部参数和外部参数
intAdder中x，y为局部参数，在方法内部使用
有时候为了增加代码可读性，需要使用外部参数*/

func intAdder2(firstNum x:Int, SecondNum y:Int) -> Int{
    return(x + y)
}

intAdder2(firstNum: 3, SecondNum: 4)

/*
 * 貌似这段有问题？？
 *
 *
 *  有时候对内和对外的名字是一样的，可以通过#快速标记
 *  func intAdder3(x:Int, y:Int)->Int{
 *      return (x + y)
 *  }
 */

//Variadic parameters:可变参数
//函数个数可变时，再参数列表加"..."
func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}

sumOf(numbers: 2,3,4,5)

//还可以将其它方法作为参数
func hasAnyMatches(list:[Int], condition:(Int)->Bool)->Void{
    for item in list {
        if condition(item) {
            print("\(item)")
        }
    }
}

func lessThenTen(number:Int)->Bool{
    return number < 10
}

var list = [1,10,23,5,20]
hasAnyMatches(list: list, condition: lessThenTen)
//Returning functions from functions
func makeLog()->((String) ->String){
    func log(Str:String) -> String{
        print("console log \(Str)")
        return Str
    }
    return log
}

let log = makeLog()
log("Hello Swift")

//Returning optionals
func evenAdder(x:Int, y:Int) -> Int? {
    let even = (x % 2 == 0, y % 2 == 0)
    switch even{
    case (true, true):
        return (x + y)
    default:
        return nil
    }
}
evenAdder(x: 2, y: 4) // {Some 6}
evenAdder(x: 2, y: 3) // nil

//Returning multiple values
func getMail()->(code:Int, message:String){
    return(200,"ok")
}

getMail()

typealias Response = (code:Int, message:String)
func getMail2()->Response{
    return(200,"ok")
}

var result = getMail2();
result.code


//Closures:闭包,匿名函数，block

//{ (params) -> return_type in statements }
let nums = [1, 3, 5, 7]

func doubler(x:Int) -> Int{
    return(x * 2)
}

//.map 会将数组每个元素都执行这个方法
let fnDoubledNums = nums.map(doubler) // [2, 6, 10, 14]
let cloDoubledNums = nums.map({(num:Int) -> Int in return(2 * num)})
cloDoubledNums
//简写(swift强类型语言,会推测类型)
//因为数组为Int类型，所以参数类型可以省略
//因为就一行代码，swift会指定return单行的result，return也可以省略
//因为 num*2就是Int类型，也可以省略.
let cloDoubledNums2 = nums.map({ num in num * 2 })
cloDoubledNums2

//swift允许使用$0,$1，还可以简写
let cloDoubledNums3 = nums.map({ $0 * 2 })
cloDoubledNums3

//Trailing closures
//When the closure is being passed as the final argument to a function we can pass it as a trailing closure
let nums2 = [1, 3, 5, 7]
let trailingClosureDoubledNums2 = nums.map() {
    (num:Int) -> Int in
    return(num * 2)
}
trailingClosureDoubledNums2 // [2, 6, 10, 14]

//Using a closure to close over a value
//Another use of a closure is to “close over” the value of something at a particular point in time. A closure can store some state when it is created and save it until it is called at some future point in time
let array = [2,3,4,5]
func makeMultiplier(mult:Int)->(Int)->Int{
    return {
        (num:Int) -> Int in
        return num * mult
    }
}

let doubler2 = makeMultiplier(mult: 2)
doubler2(10)
let tripler = makeMultiplier(mult: 3) //匿名函数,闭包
tripler(10)
array.map(doubler2)
array.map(tripler)






