//
//  FindTwoSum.swift
//  DataStructureAndAlgorithm
//
//  Created by Neil Zhang on 2018/2/24.
//  Copyright © 2018年 inspur. All rights reserved.
//

import Foundation

public func findTwoSum(array: [Int], target: Int) -> (Int, Int)? {
    guard array.count > 1 else {
        print("array is empty")
        return nil
    }
    for firstIndex in 0..<array.count {
        let first = array[firstIndex]
        for secondIndex in (firstIndex + 1)..<array.count {
            if array[secondIndex] == (target - first) {
                return (firstIndex,secondIndex)
            }
        }
    }
    return nil
}

public func findTwoSum2(array: [Int], target: Int) -> (Int, Int)? {
    guard array.count > 1 else {
        print("array is empty")
        return nil
    }
    var i = 0,j = array.count - 1
    while array[i] + array[j] != target {
        if i >= j {
            return nil
        }
        if array[i] + array[j] < target {
            i+=1
        }else{
            j-=1
        }
    }
    return (i,j)
}

public func testFindTwoSum() {
    let array = [1,2,3,4,5]
    let (firstIndex,secondIndex) = findTwoSum2(array: array, target: 7)!
    print("firstIndex = \(firstIndex) secondIndex = \(secondIndex)")
}
