//
//  Sort.swift
//  DataStructureAndAlgorithm
//
//  Created by Neil Zhang on 2018/2/26.
//  Copyright © 2018年 inspur. All rights reserved.
//

import Foundation

extension Array {
    
    static public func randomArray(size: Int, maxValue: UInt) -> [Int] {
        var result = [Int](repeating: 0, count:size)
        
        for i in 0 ..< size {
            result[i] = Int(arc4random_uniform(UInt32(maxValue)))
        }
        
        return result
    }
}

//fileprivate var array = Array<Int>.randomArray(size: 100, maxValue: 100)
fileprivate var array = [1,6,3,2,4,7,5,8,0,9]


public func bubbleSort(array: inout [Int]) -> [Int] {
    guard array.count > 1 else {
        return array
    }
    for i in 0..<array.count {
        var isSorted = true
        for j in 0..<array.count - i - 1 {
            if array[j] > array[j + 1] {
                array.swapAt(j, j + 1)
                isSorted = false
            }
        }
        if isSorted {
            return array
        }
    }
    return array
}

public func selectSort(array: inout [Int]) -> [Int] {
    guard array.count > 1 else {
        return array
    }
    for i in 0..<array.count {
        var minIndex = i
        for j in i..<array.count {
            if array[j] < array[minIndex] {
                minIndex = j
            }
        }
        if i != minIndex {
            array.swapAt(i, minIndex)
        }
    }
    return array
}

public func insertSort(array: inout [Int]) -> [Int] {
    guard array.count > 1 else {
        return array
    }
    for i in 1..<array.count {
        var j = i
        while j > 0 && array[j] < array[j - 1] {
            array.swapAt(j, j - 1)
            j -= 1
        }
    }
    return array
}

private func merge(left:[Int],right:[Int]) -> [Int] {
    var leftIndex = 0,rightIndex = 0
    var sortedArray = [Int]()
    while leftIndex < left.count && rightIndex < right.count {
        if left[leftIndex] <= right[rightIndex] {
            sortedArray.append(left[leftIndex])
            leftIndex += 1
        }else{
            sortedArray.append(right[rightIndex])
            rightIndex += 1
        }
    }
    while leftIndex < left.count {
        sortedArray.append(left[leftIndex])
        leftIndex += 1
    }
    while rightIndex < right.count {
        sortedArray.append(right[rightIndex])
        rightIndex += 1
    }
    return sortedArray
}

public func mergeSort(array: [Int]) -> [Int] {
    guard array.count > 1 else {
        return array
    }
    let middleIndex = array.count / 2
    let left = mergeSort(array: Array(array[0..<middleIndex]))
    let right = mergeSort(array: Array(array[middleIndex..<array.count]))
    return merge(left: left, right: right)
}

public func partition(array: inout [Int], low: Int, high: Int) -> Int {
    var left = low,right = high
    let pivotValue = array[low]
    guard low < high else {
        return low
    }
    while left < right {
        while left < right && array[right] >= pivotValue {
            right -= 1
        }
        while left < right && array[left] <= pivotValue {
            left += 1
        }
        array.swapAt(left, right)
    }
    array.swapAt(low, left)
    print("pivot index = \(left)")
    return left
}

public func quickSort(array: inout [Int],low: Int,high: Int) {
    guard array.count > 1 else {
        return
    }
    if low < high {
        let pivotIndex = partition(array: &array, low: low, high: high)
        quickSort(array: &array,low: low,high: pivotIndex)
        quickSort(array: &array, low: pivotIndex + 1, high: high)
    }
}

func heapSort(_ A: inout [Int]) {
    buildHeap(A: &A)
    var size = A.count
    for i in (1...A.count - 1).reversed() {
        swap(&A, i, 0)
        size -= 1
        heapify(&A, 0, size)
    }
    print("sorted heap:\(A)")
}

public func testHeap() {
    
}

public func testBubble() {
//    print("bubble before sort:\(array)")
    let time = executionTimeInterval {
        bubbleSort(array: &array)
    }
    print("bubble sort time = \(time.formattedTime)")
//    print("bubble after sort:\(array)\ntimeinteral = \(time)")
}

public func testSelect() {
//    print("select before sort:\(array)")
    let time = executionTimeInterval {
        selectSort(array: &array)
    }
//    print("select after sort:\(array)")
    print("select sort time = \(time.formattedTime)")
}

public func testInsert() {
        print("insert before sort:\(array)")
    let time = executionTimeInterval {
        insertSort(array: &array)
    }
        print("insert after sort:\(array)")
//    print("select sort time = \(time.formattedTime)")
}

public func testMerge() {
    print("merge before sort:\(array)")
    let time = executionTimeInterval {
        array = mergeSort(array: array)
    }
    print("merge after sort:\(array)")
}

public func testQuick() {
    print("quick before sort:\(array)")
    let time = executionTimeInterval {
        quickSort(array: &array, low: 0, high: array.count - 1)
    }
    print("quick after sort:\(array)")
}

//time interval
public func executionTimeInterval(block: () -> ()) -> CFTimeInterval {
    let start = NSDate().timeIntervalSince1970
    block();
    let end = NSDate().timeIntervalSince1970
    return end - start
}
//formatted time
public extension CFTimeInterval {
    public var formattedTime: String {
        return self >= 1000 ? String(Int(self)) + "s"
            : self >= 1 ? String(format: "%.3gs", self)
            : self >= 1e-3 ? String(format: "%.3gms", self * 1e3)
            : self >= 1e-6 ? String(format: "%.3gµs", self * 1e6)
            : self < 1e-9 ? "0s"
            : String(format: "%.3gns", self * 1e9)
    }
}

