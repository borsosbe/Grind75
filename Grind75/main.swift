//
//  main.swift
//  Grind75
//
//  Created by Bence Borsos on 2023. 01. 08..
//

import Foundation

class Solution {
    // 1. Two Sum https://leetcode.com/problems/two-sum/description/
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int: Int]()
        for (i, num) in nums.enumerated() {
            if let index = dict[target-num] {
                if i != index {
                    return [index, i]
                }
            }
            dict[num] = i
        }
        return [0]
    }
}

let solution = Solution()
// 1. Two Sum Test Cases
assert(solution.twoSum([2,7,11,15], 9) == [0,1])
assert(solution.twoSum([3,2,4], 6) == [1,2])
assert(solution.twoSum([3,3], 6) == [0,1])
