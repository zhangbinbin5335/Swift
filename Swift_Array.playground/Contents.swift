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







