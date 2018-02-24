//
//  LinkedList.swift
//  DataStructureAndAlgorithm
//
//  Created by Neil Zhang on 2018/2/24.
//  Copyright © 2018年 inspur. All rights reserved.
//

/*
 ADT 链表（linked list）
 
 Data
 linked list:持有的线性表
 
 Operation
 init:初始化
 count:持有节点总个数
 isEmpty:是否为空
 first:头节点
 last:尾节点
 node:传入index返回节点
 insert:插入node到指定index
 insertToHead:插入节点到表头
 appendToTail:插入节点到表尾
 removeAll:移除所有节点
 remove:移除传入的节点
 removeAt:移除传入index的节点
 
 endADT

 */

import Foundation

public func testList() {
    let list = LinkedList<String>()
    let node = LinkedListNode<String>(value: "How are you?")
    
    list.insertToHead(value: "Swift")
    
    list.insertToHead(value: "Hello")
    
    list.appendToTail(value: "I am Objective-C")
    
    list.insert(node: node, atIndex: 3)
    
    list.remove(index: 3)
    
    list.removeLast()
    
    list.appendToTail(value: "haha")
    
    list.removeAll()
    
    list.printAllNodes()
}

public class LinkedList<T>{
    
    public typealias Node = LinkedListNode<T>
    
    private var head: Node?
    
    //first node
    public var first: Node?{
        return head
    }
    
    //last node
    public var last: Node?{
        guard var node = head else {
            return nil
        }
        while let next = node.next{
            node = next
        }
        return node
    }
    
    //is Empty
    public var isEmpty: Bool {
        return head == nil
    }
    
    //count
    public var count: Int {
        guard var node = head else {
            return 0
        }
        var count = 1
        while let next = node.next {
            node = next
            count += 1
        }
        return count
    }
    
    //node of index
    public func node(atIndex index: Int) -> Node? {
        
        if index == 0 {
            return head!
        }else{
            guard index < count else {
                return nil
            }
            var node = head
            for _ in 0..<index{
                node = node?.next
                if node == nil {
                    break
                }
            }
            return node!
        }
    }
    
    //insert node to last index
    public func appendToTail(value: T) {
        let newNode = Node(value:value)
        if let lastNode = last {
            newNode.previous = lastNode
            lastNode.next = newNode
            //不需要改变尾节点的地址，遍历到尾节点
        }else{
            head = newNode
        }
    }
    
    //insert node to head
    public func insertToHead(value: T) {
        let newNode = Node(value: value)
        if let headNode = head {
            newNode.next = headNode
            headNode.previous = newNode
            //需要改变头结点的地址
            head = newNode
        }else{
            head = newNode
        }

    }
    
    //insert node at index
    public func insert(node: Node, atIndex index: Int) {
        guard index <= count && index > 0 else {
            print("invalid input index")
            return
        }
        if count == 0 {
            head = node
        }else{
            let newNode = node
            if index == 0 {
                self.insertToHead(value: newNode.value)
            }else{
                let pre = self.node(atIndex: index - 1)
                let next = self.node(atIndex: index)
                pre?.next = newNode
                newNode.previous = pre
                newNode.next = next
                next?.previous = newNode
            }
        }
    }
    
    //remove all node
    public func removeAll() {
        head = nil
    }
    
    //remove the last node
    public func removeLast() -> T? {
        guard !isEmpty else {
            return nil
        }
        return self.remove(node: last!)
//        return self.remove(index: count - 1)
    }
    
    //remove the node by reference
    public func remove(node: Node) -> T?{
        guard head != nil else {
            print("Linked list is empty")
            return nil
        }
        let prev = node.previous
        let next = node.next
        if let prev = prev {
            prev.next = next
        }else {
            head = next
        }
        node.previous = nil
        node.next = nil
        next?.previous = prev
        return node.value
    }
    
    //remove the node by index
    public func remove(index: Int) -> T? {
        guard head != nil else {
            print("The linked list is empty")
            return nil
        }
        let node = self.node(atIndex: index)
        guard node != nil else {
            print("invalid index")
            return nil
        }
        return self.remove(node: node!)
    }
    
    //print all nodes
    public func printAllNodes() {
        guard head != nil else {
            print("The linked list is empty")
            return
        }
        var node = head
        for index in 0..<count {
//            let node = self.node(atIndex: index)
//            print("node value = \(String(describing: node?.value))")
            if node == nil {
                break
            }
            print("node value = \(String(describing: node?.value)) and index = \(index)")
            node = node?.next
        }
    }
}
