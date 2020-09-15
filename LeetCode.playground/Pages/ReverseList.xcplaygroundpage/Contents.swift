import UIKit

/**
 * Definition for singly-linked list.
 反转一个单链表。

 示例:

 输入: 1->2->3->4->5->NULL
 输出: 5->4->3->2->1->NULL
 进阶:
 你可以迭代或递归地反转链表。你能否用两种方法解决这道题？

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/reverse-linked-list
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

 
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
     self.val = val
     self.next = nil
    }
}
//输入: 1->2->3->4->5->NULL
//输出: 5->4->3->2->1->NULL
func printListNode(_ head: ListNode?) {
    var tmp = head;
    print("😁😁😁😁😁😁😁😁😁😁😁")
    while  tmp != nil {
        print(tmp?.val)
        tmp = tmp?.next
    }
    print("😁😁😁😁😁😁😁😁😁😁😁")
}
class Solution {
    // 链表A: 1->2->3->4->5->6->7->8->null
    // 链表B: 8->nil
    // 2. 将8指向7
    // 链表B: 8->nil
    // 链表A: 1->2->3->4->5->6->7->8->nil
    // A，B两个链表共同指向8
    // 将A的nil换成7，相当于B的链表变成了8->7,然后再将7的next变成nil, 断开循环
    // 链表B: 8->7->nil
    // 链表A: 1->2->3->4->5->6->7->nil

    // 3. 将7指向6
    // 链表B: 8->7->nil
    // 链表A: 1->2->3->4->5->6->7->nil
    // A，B两个链表共同指向7
    // 将A的nil换成6，相当于B的链表也变成了8->7->6,然后再将6的next变成nil, 断开循环
    // 链表B: 8->7->6->nil
    // 链表A: 1->2->3->4->5->6->nil

    // 递归写法
    func reverseList(_ head: ListNode?) -> ListNode? {
        guard let _ = head else {
            return head
        }
        guard let _ = head?.next else {
            return head
        }
        let cur = reverseList(head?.next)

        head?.next?.next = head
        head?.next = nil

        return cur
    }


}
class Solution1 {
    // 双指针迭代
    //假设存在链表 1 → 2 → 3 → Ø，我们想要把它改成 Ø ← 1 ← 2 ← 3。
    //在遍历列表时，将当前节点的next指针改为指向前一个元素。由于节点没有引用其上一个节点，因此必须事先存储其前一个元素。在更改引用之前，还需要另一个指针来存储下一个节点。不要忘记在最后返回新的头引用！

    func reverseList(_ head: ListNode?) -> ListNode? {
        var pre: ListNode? = nil
        var cur: ListNode? = head
        
        while cur != nil {
            let tmp = cur?.next
            cur?.next = pre
            pre = cur
            cur = tmp
        }
        return pre
    }
}

var listNode = ListNode.init(1);
var listNode1 = ListNode.init(2);
var listNode2 = ListNode.init(3);
var listNode3 = ListNode.init(4);
var listNode4 = ListNode.init(5);

listNode.next = listNode1;
listNode1.next = listNode2
listNode2.next = listNode3
listNode3.next = listNode4

printListNode(Solution1.init().reverseList(listNode))

