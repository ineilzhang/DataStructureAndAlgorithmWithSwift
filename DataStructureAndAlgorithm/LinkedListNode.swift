//
//  LinkedListNode.swift
//  DataStructureAndAlgorithm
//
//  Created by Neil Zhang on 2018/2/24.
//  Copyright © 2018年 inspur. All rights reserved.
//

import Foundation

public class LinkedListNode<T>{
    
    public var value: T
    
    weak var previous: LinkedListNode?
    
    var next: LinkedListNode?
    
    public init(value: T){
        self.value = value
    }
    
}
