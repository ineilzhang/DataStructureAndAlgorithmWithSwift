//
//  Stack.swift
//  DataStructureAndAlgorithm
//
//  Created by Neil Zhang on 2018/2/24.
//  Copyright © 2018年 inspur. All rights reserved.
//

import Foundation

/*
 ADT 栈
 
 Data
   linked list: 线性表
 
 Operation
   init:初始化
   isEmpty:是否为空
   count:元素个数
   push:压栈
   pop:出栈
   top:栈顶元素
 
 EndADT
 */

public struct Stack<T> {
    //inner array
    fileprivate var stackArray = [T]()
    
    //count
    public var count: Int {
        return stackArray.count
    }
    
    //is empty
    public var isEmpty: Bool {
        return stackArray.isEmpty
    }
    
    //top
    public var top: T? {
        return stackArray.last
    }
    
    //push
    public mutating func push(element: T) {
       stackArray.append(element)
    }
    
    //pop
    public mutating func pop() -> T?{
        guard !stackArray.isEmpty else {
            print("stack is empty")
            return nil
        }
        return stackArray.removeLast()
    }
    
    //print all elements
    public mutating func printAllElements() {
        for (index, value) in stackArray.enumerated() {
            print("index = \(index)  value = \(value)")
        }
    }
}

public func testStack() {
    var stack = Stack<String>()
    stack.push(element: "Hello")
    stack.push(element: "Swift")
    stack.printAllElements()
    print("stack is empty? \(stack.isEmpty)")
    print("stack count = \(stack.count)")
    print("stack top = \(stack.top!)")
    stack.pop()
    stack.printAllElements()
    print("stack is empty? \(stack.isEmpty)")
    print("stack count = \(stack.count)")
    print("stack top = \(stack.top!)")

}
