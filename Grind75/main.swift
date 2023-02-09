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
    
    // 21. Merge Two Sorted Lists https://leetcode.com/problems/merge-two-sorted-lists/description/
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var tempNode = ListNode(-1)
        let resultNode = tempNode
        var l1 = list1
        var l2 = list2
        
        while l1 != nil && l2 != nil {
            if l1!.val > l2!.val {
                tempNode.next = l2
                l2 = l2?.next
            } else {
                tempNode.next = l1
                l1 = l1?.next
            }
            tempNode = tempNode.next!
        }
        tempNode.next = l1 == nil ? l2 : l1
        
        return resultNode.next
    }
    
    // 121. Best Time to Buy and Sell Stock https://leetcode.com/problems/best-time-to-buy-and-sell-stock/
    func maxProfit(_ prices: [Int]) -> Int {
        var maxProfit = 0
        var left = 0
        var right = 1
        
        while right < prices.count {
            if prices[left] > prices[right] {
                left = right
            } else {
                let currentProfit = prices[right] - prices[left]
                maxProfit = maxProfit > currentProfit ? maxProfit : currentProfit
            }
            right += 1
        }
        
        return maxProfit
    }
    
    // 125. Valid Palindrome https://leetcode.com/problems/valid-palindrome/
    func isPalindrome(_ s: String) -> Bool {
        let sA = Array(s)
        var i = 0
        var j = sA.count - 1
        
        while i < j {
            if !sA[i].isLetter, !sA[i].isNumber {
                i += 1
                continue
            }
            if !sA[j].isLetter, !sA[j].isNumber {
                j -= 1
                continue
            }
            if sA[i].lowercased() != sA[j].lowercased() {
                return false
            }
            i += 1
            j -= 1
        }
        return true
    }
    
    // 226. Invert Binary Tree https://leetcode.com/problems/invert-binary-tree/
    // BFS - queue
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        var queue = [TreeNode]()
        queue.append(root)
        while !queue.isEmpty {
            let next = queue.removeFirst()
            let temp = next.left
            next.left = next.right
            next.right = temp
            if let l = next.left {
                queue.append(l)
            }
            if let r = next.right {
                queue.append(r)
            }
        }
        return root
    }
    // DFS - recursive
    func invertTreeRecursive(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        let temp = root.left
        root.left = invertTreeRecursive(root.right)
        root.right = invertTreeRecursive(temp)
        return root
    }
    
    // 242. Valid Anagram - https://leetcode.com/problems/valid-anagram/
    func isAnagram(_ s: String, _ t: String) -> Bool {
        if s.count != t.count { return false }
        var dicS = [Character : Int]()
        var dicT = [Character : Int]()
        let sA = Array(s)
        let tA = Array(t)

        for i in 0..<s.count {
            updateDic(&dicS, sA[i])
            updateDic(&dicT, tA[i])
        }

        return dicS == dicT
        
        func updateDic(_  dic: inout [Character : Int], _ char: Character) {
            if let val = dic[char] {
                dic[char] = val + 1
            } else {
                dic[char] = 1
            }
        }
    }
}

// 21. Merge Two Sorted Lists
// Given by leetCode
// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

// 226. Invert Binary Tree
// Given by leetCode
// Definition for a binary tree node.
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
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

// 121. Best Time to Buy and Sell Stock
assert(solution.maxProfit([7,1,5,3,6,4]) == 5)
assert(solution.maxProfit([7,6,4,3,1]) == 0)

// 125. Valid Palindrome
assert(solution.isPalindrome("A man, a plan, a canal: Panama") == true)
assert(solution.isPalindrome("race a car") == false)
assert(solution.isPalindrome(" ") == true)

// 125. Valid Palindrome
assert(solution.isAnagram("anagram", "nagaram") == true)
assert(solution.isAnagram("rat", "car") == false)
