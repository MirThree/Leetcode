import UIKit

"""
二叉树的层平均值
给定一个非空二叉树, 返回一个由每层节点平均值组成的数组。

 

示例 1：

输入：
    3
   / \
  9  20
    /  \
   15   7
输出：[3, 14.5, 11]
解释：
第 0 层的平均值是 3 ,  第1层是 14.5 , 第2层是 11 。因此返回 [3, 14.5, 11] 。
 

提示：

节点值的范围在32位有符号整数范围内。

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/average-of-levels-in-binary-tree
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
"""
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
 }
}
class Solution {
    // 深度优先
    func averageOfLevels(_ root: TreeNode?) -> [Double] {
        guard let tree = root else {
            return [0]
        }
        var sums: [Int] = []
        var counts: [Int] = []
        var averages: [Double] = []

        dfs(tree, level: 0, counts: &counts, sums: &sums)

        for i in 0 ..< sums.count {
            averages.append((Double(sums[i])/Double(counts[i])))
        }

        return averages
    }
    // 深度优先
    func dfs(_ root: TreeNode?, level: Int, counts: inout [Int], sums: inout [Int]) {
        guard let tree = root else {
            return
        }
        if level < sums.count {
            sums[level] = sums[level] + tree.val
            counts[level] = counts[level] + 1
        }else {
            sums.append(tree.val)
            counts.append(1)
        }
        dfs(root?.left, level: level + 1, counts: &counts, sums: &sums)
        dfs(root?.right, level: level + 1, counts: &counts, sums: &sums)

    }
}
class Solution1 {
    // 广度优先
    func averageOfLevels(_ root: TreeNode?) -> [Double] {
        guard let tree = root else {
            return [0]
        }
        var sums: Int = 0
        var counts: Int = 0
        var averages: [Double] = [Double(tree.val)]
        var nextSubTree = [tree]
        var lastSubTree = [TreeNode]()
        
        while nextSubTree.count > 0 {
            counts = 0
            sums = 0
            lastSubTree = nextSubTree
            nextSubTree.removeAll()
            for node in lastSubTree {
                if let array = add(node, counts: &counts, sums: &sums) {
                    nextSubTree.append(contentsOf: array);
                }
            }
            if counts != 0 {
                averages.append(Double(sums)/Double(counts))
            }
        }
        return averages
    }
    // 深度优先
    func add(_ root: TreeNode?, counts: inout Int, sums: inout Int) ->[TreeNode]? {
        guard let tree = root else {
            return nil
        }
        var subTree: [TreeNode] = []

        if let left = tree.left {
            sums = sums + left.val
            counts = counts + 1
            subTree.append(left);
        }
        if let right = tree.right {
            sums = sums + right.val
            counts = counts + 1
            subTree.append(right);

        }
        return subTree

    }
}

