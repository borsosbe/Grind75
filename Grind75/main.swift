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
    
    // 20. Valid Parentheses https://leetcode.com/problems/valid-parentheses/
    func isValid(_ s: String) -> Bool {
        guard !s.isEmpty else { return true }
        var stack = [Character]()
        let sCharArray = Array(s)
        for s in sCharArray {
            switch s {
            case ")":
                if stack.last == "(" {
                    stack.removeLast()
                } else {
                    return false
                }
                break
            case "}":
                if stack.last == "{" {
                    stack.removeLast()
                } else {
                    return false
                }
                break
            case "]":
                if stack.last == "[" {
                    stack.removeLast()
                } else {
                    return false
                }
                break
            default:
                stack.append(s)
                break
            }
        }
        return stack.isEmpty ? true : false
    }
}

let solution = Solution()

// 1. Two Sum Test Cases
assert(solution.twoSum([2,7,11,15], 9) == [0,1])
assert(solution.twoSum([3,2,4], 6) == [1,2])
assert(solution.twoSum([3,3], 6) == [0,1])

// 20. Valid Parentheses
assert(solution.isValid("()") == true)
assert(solution.isValid("()[]{}") == true)
assert(solution.isValid("(]") == false)
assert(solution.isValid("{[]}") == true)
