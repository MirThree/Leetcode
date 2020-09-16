import UIKit

/**
 *
 将两个升序链表合并为一个新的 升序 链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。

  

 示例：

 输入：1->2->4, 1->3->4
 输出：1->1->2->3->4->4

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/merge-two-sorted-lists
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


public class ListNode {
  
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
func printListNode(_ head: ListNode?) {
    var tmp = head;
    print("😁😁😁😁😁😁😁😁😁😁😁")
    while  tmp != nil {
        print(tmp?.val)
        tmp = tmp?.next
    }
    print("😁😁😁😁😁😁😁😁😁😁😁")
}


/// 迭代
class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var node1: ListNode? = l1
        var node2: ListNode? = l2
        var cur: ListNode? = ListNode.init()
        let pre: ListNode? = cur

//        输入：a: 1->2->4, b: 1->3->4
//        输出：1->1->2->3->4->4
        while node1 != nil && node2 != nil {
            if node1!.val >= node2!.val {
                cur?.next = node2
                node2 = node2?.next
            }else {
                cur?.next = node1
                node1 = node1?.next
            }
            cur = cur?.next
            
        }
        cur?.next = (node1 != nil) ? node1 : node2
        return pre?.next
    }
}
//递归
class Solution1 {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let node1 = l1 else {
            return l2
        }
        guard let node2 = l2 else {
            return l1
        }
        if node1.val >= node2.val {
            node2.next = mergeTwoLists(node1, node2.next)
            return node2
        }else {
            node1.next = mergeTwoLists(node1.next, node2)
            return node1
        }
    }
    
    func createNodes(values: [Int])-> ListNode {
        var node: ListNode? = ListNode.init(values[0])
        let q = node;
        for index in 1..<values.count {
            let val = values[index]
            node?.next = ListNode.init(val)
            node = node?.next
            
        }
        
        return q!;
    }
}
var nodeVals1 = [1,2,4,8,14,15,19]
var nodeVals2 = [1,3,5,9,10]
var s1 = Solution1()
var nodeA: ListNode = s1.createNodes(values: nodeVals1)
var nodeB: ListNode = s1.createNodes(values: nodeVals2)
//printListNode(nodeA)
//printListNode(nodeB)
//
//var nodeC = s1.mergeTwoLists(nodeA, nodeB)
//
//printListNode(nodeC)


var s2 = Solution()

var nodeD = s2.mergeTwoLists(nodeA, nodeB)
print("ddsadada")
printListNode(nodeD)

