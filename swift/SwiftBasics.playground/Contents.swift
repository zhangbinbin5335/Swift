//: Playground - noun: a place where people can play

import Cocoa

//http://www.aidanf.net/learn-swift/basics

//1.Printing and string interpolation

var name = "Jack" //可以不需要分号，对象也不需要@开始
var age = 30 //var 变量，没有指定age的类型

//我们可以用print输出，\()插入
print("\(name) \(age) years old. ")

//2.注释
//注释和oc一样，//注释单行；/*注释多行*/

//3.基本类型

    //3.1 布尔类型 Booleans,
    /*
        Swift is strict in its treatment of boolean values. Boolean is a type that can 
        (only) be true or false. Any operator or function that expects a boolean must be 
        given a boolean or the type system will complain. Many dynamic languages have a
        much looser definition of what kind of values can be truthy (for example, in Ruby
        anything that not nil or false is truthy. So an empty string can be used to
        represent true) - if you’re coming from one of those languages you’ll have to get
        used to only using booleans in places where booleans are expected.
 
        在swift中布尔类型只能用true或false表示
    */

    if(name != nil){ //if(name) 会报错，在swift中bool只能是true或false
        print(name);
    }

    //3.2 整型 Integer
    /*
        int 是整形的基本类型，整形其它很多类型，无符号和有符号。
        通过 min 和 max属性，可以知道各整型最大最小值
    */
    Int.max //  9223372036854775807
    Int.min //  -9223372036854775808

    UInt.max // 18446744073709551615
    UInt.min // 0

    Int8.max // 127

    /*
        3.3 浮点型 Floats and Doubles
        浮点型根据你的精度需要，可以使用float或double
        Float 32位存储，精确到小数点后6位，
        Double 64位存储，精确到小数点后15位
    */
    let piFloat:Float = 3.14159265358979 //:Float 指定float类型
    let piDouble:Double = 3.14159265358979

    /*
        3.4 字符串和字符型 Strings and characters
        swift中默认双引号就是字符串，
        可以通过Character指定为字符型
        +运算符可以连结两个字符串类型
        append方法可以连结字符型和字符串型
    */

    var swift = "s" + "wif" //let 常量
    let t:Character = "t"
    swift.append(t)

    //字符串和字符都支持unicode
    let pi = "\u{03c0}"
    let r:Character = "r"
    let squared = "\u{00b2}"

    var area = pi;
    area.append(r)
    area = area + squared

    /*
        3.4 一些基本运算符
    */

    // +,-,*,/,% 和c语言一样

    10 + 5 // 15
    10 - 5 // 5
    10 * 5 // 50
    10 / 5 // 2
    10 % 5 // 0
    12 % 5 //2

    //= ：分配符
    var x = 10 // x = 10
    x += 5 // 15
    x -= 5 // 10
    x *= 5 // 50
    x /= 5 // 10
    x %= 5 // 0
    x
    //也可以通过结构分配
    var (y, z) = (20, 30)//
    y // 20
    z // 30

    //比较符也和c语言一样
    let w = 10
    w > 5 // true
    w < 5 // false
    w >= 10 // true
    w <= 10 // true
    x == 10 // true
    x == 9 // false

    //逻辑符在swift中更严格
    //每个表达式必须得到bool值
    w > 5 && w < 20 //true
    w > 20 || w <= 10 //true

    //swift有两个创建范围的符号
    1...10 //闭值域运算符;包含了10
    1..<10 //半开区间运算符;没有包含10

    //三目运算符
    w == 5 ? "true" : "false"

    /**
        3.5 命名规则
        Swift 使用驼峰命名，总结如下：
            1.所有的使用驼峰命名
            2.类名和顶级的常量名应该大写（i.e ClassName）
            3.方法名、函数名、变量名应该首字母小写（i.e methodName）
    */














