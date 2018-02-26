//
//  Heap.swift
//  DataStructureAndAlgorithm
//
//  Created by Neil Zhang on 2018/2/26.
//  Copyright © 2018年 inspur. All rights reserved.
//

import Foundation

public func heapify(_ array: inout [Int],_ i: Int,_ size: Int) {
    var l = i * 2,r = l + 1
    var largest = i
    if l < size && array[l] > array[i] {
        largest = l
    }
    if r < size && array[r] > array[largest] {
        largest = r
    }
    if largest != i {
        swap(&array, i, largest)
        heapify(&array, largest, size)
    }
}

public func swap(_ array: inout [Int],_ i: Int, _ j: Int) {
    guard i != j else{
        return
    }
    let temp = array[i]
    array[i] = array[j]
    array[j] = temp
}

func buildHeap(A: inout [Int]) {
    for i in (0...A.count/2).reversed() {
        heapify(&A, i, A.count)
    }
    print("build heap:\(A)")
}


