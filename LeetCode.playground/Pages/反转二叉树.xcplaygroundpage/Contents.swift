//226. 翻转二叉树
//翻转一棵二叉树。
//
//示例：
//
//输入：
//
//     4
//   /   \
//  2     7
// / \   / \
//1   3 6   9
//输出：
//
//     4
//   /   \
//  7     2
// / \   / \
//9   6 3   1

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
    func invertTree(_ root: TreeNode?) -> TreeNode? {

        if root == nil {return root}
        // 交换
        let temp = root?.left
        root?.left = root?.right
        root?.right = temp
        invertTree(root?.right)
        invertTree(root?.left)
        return root
    }
    // 迭代
    func invertTree2(_ root: TreeNode?) -> TreeNode? {

        if root == nil {return root}
   
        var queue = [TreeNode]()
        
        queue.append(root!)
        
        while queue.count != 0 {
            let head = queue.removeFirst()
            let temp = head.left
            head.left = head.right
            head.right = temp
            if head.left != nil {
                queue.append(head.left!)
            }
            if head.right != nil {
                queue.append(head.right!)
            }
        }
        
        return root
    }

}


