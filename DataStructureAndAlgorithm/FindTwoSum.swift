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

public func findTowSum2(array: [Int], target: Int) -> (Int, Int)? {
    guard array.count > 1 else {
        print("array is empty")
        return nil
    }
    for index in 0..<array.count {
        
    }
}
