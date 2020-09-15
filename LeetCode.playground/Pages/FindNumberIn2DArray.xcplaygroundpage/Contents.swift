import UIKit

var str = "Hello, playground"
"""
剑指 Offer 04. 二维数组中的查找
在一个 n * m 的二维数组中，每一行都按照从左到右递增的顺序排序，每一列都按照从上到下递增的顺序排序。请完成一个函数，输入这样的一个二维数组和一个整数，判断数组中是否含有该整数。
示例:
现有矩阵 matrix 如下：

[
  [1,   4,  7, 11, 15],
  [2,   5,  8, 12, 19],
  [3,   6,  9, 16, 22],
  [10, 13, 14, 17, 24],
  [18, 21, 23, 26, 30]
  [31, 31, 33, 34, 35]

]
给定 target = 5，返回 true。

给定 target = 20，返回 false。

 

限制：

0 <= n <= 1000

0 <= m <= 1000
"""

let matrix = [
  [1,   4,  7, 11, 15], // (0, m)
  [2,   5,  8, 12, 19],
  [3,   6,  9, 16, 22],
  [10, 13, 14, 17, 24],
  [18, 21, 23, 26, 30]
  //(n,0)
]

class Solution {
    func findNumberIn2DArray(_ matrix: [[Int]], _ target: Int) -> Bool {
        guard (matrix.count > 0 && matrix[0].count > 0) else {
            return false
        }
        var n = matrix.count
        var m = matrix[0].count

        let max = matrix[n-1][m-1]
        let min = matrix[0][0]

        if (target > max) || (min > target) {return false}
        let row = n/2
        let com = m/2
        let center = matrix[row][com]
        // 如果中心值等于目标值返回true
        if center == target {
            return true
        }
        // 右下角开始二分查找
        else if center < target {
            while (n-1 > row) || (m-1 > com) {
                if binarySreach(matrix, target, startPoint: (n-1, m-1), isRow: true, isLeft: false) {return true}
                if binarySreach(matrix, target, startPoint: (n-1, m-1), isRow: false, isLeft: false) {return true}
                n = n-1
                m = m-1
            }
        }
        // 左上角开始二分查找
        else {
            n = 0
            m = 0
            while (n < row) || (m < com) {
                if binarySreach(matrix, target, startPoint: (n, m), isRow: true, isLeft: true) {return true}
                if binarySreach(matrix, target, startPoint: (n, m), isRow: false, isLeft: true) {return true}
                n = n+1
                m = m+1
            }
        }

        
        return false
    }
    func binarySreach(_ matrix: [[Int]], _ target: Int, startPoint: (n: Int,m: Int), isRow: Bool,isLeft: Bool) -> Bool {
        var lowerBound = 0
        var upperBound = 0
        // 从右下脚开始二分查找 并且是行
        if (!isLeft && isRow) {
            lowerBound = 0
            upperBound = startPoint.m
        }
        // 从左上角开始二分查找 并且是列
        else if (!isLeft && !isRow) {
            lowerBound = 0
            upperBound = startPoint.n
        }
        // 从左上角开始二分查找 并且是行
        else if (isLeft && isRow){
            lowerBound = startPoint.m
            upperBound = matrix[0].count - 1
        }
        // 从左上角开始二分查找 并且是列
        else if (isLeft && !isRow){
            //(0,m)
            lowerBound = startPoint.n
            upperBound = matrix.count - 1
        }
        // 是行
        if (isRow) {
            while lowerBound <= upperBound {
                let midIndex = (upperBound + lowerBound) / 2
                let temp = matrix[startPoint.n][midIndex]
                print("lowerBound = ",lowerBound,"   upperBound = ",upperBound,"   midIndex = ", midIndex)
                print("row------------",temp)
                if let _ = compare(lowerBound: &lowerBound, upperBound: &upperBound, target: target, midIndex: midIndex, temp: temp) {
                    return true
                }
            }
        }
        //是列
        else {
            while lowerBound <= upperBound {
                let midIndex = (upperBound + lowerBound) / 2
                let temp = matrix[midIndex][startPoint.m]
                print("lowerBound = ",lowerBound,"   upperBound = ",upperBound,"   midIndex = ", midIndex)
                print("com------------",temp)
                if let _ = compare(lowerBound: &lowerBound, upperBound: &upperBound, target: target, midIndex: midIndex, temp: temp) {
                    return true
                }
            }
        }
        return false
    }
    func compare(lowerBound: inout Int, upperBound: inout Int, target: Int, midIndex: Int, temp: Int) -> Bool?{
        // 等于返回找到结果
        if temp == target {
            return true
        }
        // 大于目标值将midIndex+1 复制给lowBound
        else if temp < target {
            lowerBound = midIndex + 1
        }
        // 小于于目标值将midIndex-1 复制给upperBound
        else if temp > target {
            upperBound = midIndex - 1
        }
        return nil
    }

}
class Solution1 {
    func findNumberIn2DArray(_ matrix: [[Int]], _ target: Int) -> Bool {
        var i = matrix.count - 1
        var j = 0
        while(i >= 0 && j < matrix[0].count) {
            if(matrix[i][j] > target) {
                i = i - 1
            }
            else if(matrix[i][j] < target) {
                j = j + 1
            }
            else {
                return true
            }
         }
         return false
    }
}
var array = [
    [1,4],
    [2,5],
    [3,6],
    [7,8],
    [9,10],
    [11,12],
    [13,14],
    [15,30],
    [16,31],


]

//var array1 = [[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]]

print(Solution1().findNumberIn2DArray(matrix, 5))

