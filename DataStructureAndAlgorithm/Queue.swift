//
//  Queue.swift
//  DataStructureAndAlgorithm
//
//  Created by Neil Zhang on 2018/2/24.
//  Copyright © 2018年 inspur. All rights reserved.
//

import Foundation

/*
 ADT 队列（Queue）
 
 Data
   linked list:持有的线性表
 
 Operation
   init:初始化
   count:栈的元素个数
   isEmpty:是否为空
   front:获取队列头元素
   enqueue:入队
   dequeue:出队
 
 endADT
 */

public struct Queue<T> {
    //inner array
    fileprivate var queueArray = [T]()
    
    //is empty
    public var isEmpty: Bool {
        return queueArray.isEmpty
    }
    
    //count
    public var count: Int {
        return queueArray.count
    }
    
    //front
    public var front: T? {
        return queueArray.first
    }
    
    //enqueue
    public mutating func enqueue(element: T) {
        queueArray.append(element)
    }
    
    //dequeue
    public mutating func dequeue() -> T? {
        guard !isEmpty else{
            return nil
        }
        return queueArray.removeFirst()
    }
    
    //print all elements
    public mutating func printAllElements() {
        guard !isEmpty else {
            return
        }
        for (index, value) in queueArray.enumerated() {
            print("index = \(index) value = \(value)")
        }
    }
}

public func testQueue() {
    var queue = Queue<String>()
    queue.enqueue(element: "Hello")
    queue.enqueue(element: "Swift")
    queue.enqueue(element: "How are you?")
    queue.printAllElements()
    queue.dequeue()
    queue.printAllElements()
    print("queue front = \(String(describing: queue.front!))")
    print("queue count = \(queue.count)")
}
