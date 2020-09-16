
import UIKit

// https://leetcode-cn.com/problems/shu-zu-zhong-zhong-fu-de-shu-zi-lcof/
"""
找出数组中重复的数字。

在一个长度为 n 的数组 nums 里的所有数字都在 0～n-1的范围内。
数组中某些数字是重复的，但不知道有几个数字重复了，也不知道每个数字重复了几次。请找出数组中任意一个重复的数字。

示例 1：

输入：
[2, 3, 1, 0, 2, 5, 3]
输出：2 或 3
 
限制：

2 <= n <= 100000
"""
class Solution {
    // 时间复杂度是 O(n)
    // 空间复杂度是 O(n)
    func findRepeatNumber1(_ nums: [Int]) -> Int {
        var set: Set<Int> = []
        for num in nums {
            if set.contains(num) {
                return num;
            }else {
                set.insert(num)
            }
        }
        return -1
    }
    // [0,2,4,3,1,5,6,8,7] 对没有重复的数据进行排序
    func sort(_ nums: [Int]) {
        var numbers = nums
        for index in 0 ..< numbers.count {
            while index != numbers[index] {
                let tmp = numbers[numbers[index]]
                numbers[numbers[index]] = numbers[index];
                numbers[index] = tmp

            }
        }
    }
//    时间复杂度是 O(n)
//    空间复杂度是 O(1)
    func findRepeatNumber2(_ nums: [Int]) -> Int {
        var numbers = nums
        for index in 0 ..< numbers.count {
            // 将数组numbers[index] 和 numbers[numbers[index]] 进行交换，直到index == numbers[index]
            while index != numbers[index] {
                
                if numbers[index] == numbers[numbers[index]] {
                    return numbers[index]
                }
                // 将两个数据进行交换
                let tmp = numbers[numbers[index]]
                numbers[numbers[index]] = numbers[index];
                numbers[index] = tmp
            }
        }
        return -1
    }
}
var solution = Solution();
print(solution.findRepeatNumber2([0,2,4,3,1,5,6,8,7,6]))
