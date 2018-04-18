//: Playground - noun: a place where people can play

import Cocoa

//Chapter 9
//Control Flow

//和oc一样;需要注意的是表达式一定返回true或false
var str:String?
/*这种就不行了
if(str){
    
}
 */

//if let
//用来handle可选类型
if let n = str{
    print("有值显示 \(n)")
}else{
    print("空值显示")
}

//Loops 循环

//9.2.1 for 和 for-in

//for 和c 一样,在swift 3 去掉了
/*
let numbers = [1, 2, 3, 4, 5, 6]

for var i=0; i<numbers.count; i=i+2 {
    print("\(numbers[i])")
}
 */

//for-in
let numbers = [1, 2, 3, 4, 5, 6]
for value in numbers {
    if(value == 3){
        continue //continue, break还是一样的
    }
    print("\(value)")
}

//while
var i = 0
while i <= (numbers.count / 2) {
    print("\(numbers[i])")
    i += 1 //i++ 没了
}

//do-while 和c 一样

//swift

//常规写法
let capacity = 10
var reservations = 6

switch (capacity - reservations) {
    case 0:
        print("Sorry, the inn is full")
    case 1:
         print("Only 1 place left")
    case 2, 3, 4:
           print("Getting close to full now xxx")
          // switch must be exhaustive, default clause needed
     default:
         print("plenty or room at the inn")
    }

//还可以指定范围,和上面写法是同一个意思
switch (capacity - reservations) {
case 0:
    print("Sorry, the inn is full")
case 1:
    print("Only 1 place left")
case 2..<5:
    print("Getting close to full now")
// switch must be exhaustive, default clause needed
default:
    print("plenty or room at the inn")
}

//结合枚举和元组
let response = (501, "OK")
switch response{
case (200, _): //_:不care，匹配任何数据
    print("Looks good")
case (500, _):
    print("You got an error")
default:
    print("Unrecognized response code")
}

//结合枚举和元组再加上指定范围
switch response{
case (200..<500, _):
    print("Looks good")
case (500..<600, let temp): //let 临时数据
    print("You got an error \(temp)")
default:
    print("Unrecognized response code")
}

//where:增加where判断
switch response{
case (200..<500, _):
    print("Looks good")
case (500..<600, let temp) where (response.0 % 2) == 0:
    print("You got an error \(temp)")
case (500..<600, let temp) where (response.0 % 2) != 0:
    print("You got an error 2 \(temp)")
default:
    print("Unrecognized response code")
}

/*
 Swift has a few of ways of modifying control in a loop:
 
 break : 终止当前循环.
 continue : 跳过当前迭代,netx
 fallthrough : 用在switch中，加了后会执行当前case和紧跟着的case或default
 */

//guard 和if相反，执行false

func guardTest (num: Int) {
    guard num % 2 == 0 else {
        print("\(num) 是奇数")
        return //需要return或break
    }
}

guardTest(num: 4) //正确不执行
guardTest(num: 5) //false执行










