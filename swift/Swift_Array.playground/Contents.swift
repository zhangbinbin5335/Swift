//: Playground - noun: a place where people can play

import Cocoa
/*
 Chapter 6
 Arrays
 */
var arrayOfInts:[Int] = [1, 2]
var arrayOfString = ["a", "b"]

//isEmpty : 判断数组是否为空
arrayOfInts.count
arrayOfInts.isEmpty

//append : 增加新的元素
arrayOfInts.append(3)

//+= : 添加数组
arrayOfInts += [4]
arrayOfInts += [5, 6]
arrayOfInts[2...4]

//insert : 插入指定位置
arrayOfInts.insert(0, at: 2)

//removeAtIndex : 删除指定位置元素
arrayOfInts.remove(at: 1)

//removeLast : 删除最后一位
arrayOfInts.removeLast()

//for-in遍历数组
for i in arrayOfInts {
    // i 为数组元素
    print(i * i)
}

//枚举遍历，可以拿到索引值和元素
for (index, value) in arrayOfInts.enumerated() {
    //arrayOfInts.enumerated() 返回EnumeratedSequence
    print("index = ", index,",value = ",value)
}

//创建空数组，并初始化值
var cells = [String](repeating: "xx", count: 5)

// 字典
var info:Dictionary<String, Int> = Dictionary()
info["Jack"] = 4
info["Tom"] = 3

info.isEmpty
info.count
info

//遍历
for key in info.keys{
    print("key",key)
}

for value in info.values {
    print("value=",value)
}

for (key, value) in info {
    print("key =",key,"value =",value)
}

info.removeValue(forKey: "Tom")

//元组 Tuples
//一组有序的元素，可以通过名字或位置访问

//():用来定义一个元组
var coordinates = (54.2667, 8.4833)

let (lat, lon) = coordinates //lat = 54.2667,lon = 8.4833

//_ to indicate fields that we don’t care about
let (latt, _) = coordinates //_:用来指明我们不在乎这块
print("Lattitude is \(lat)")
print("Lattitude is \(latt)")

//元组可以是不同类型的元素
var response = (code: 502, message: "Bad Gateway")//(Int, String)类型

//通过位置访问元素
response.0
response.1

//通过名字访问元素
response.code
response.message







