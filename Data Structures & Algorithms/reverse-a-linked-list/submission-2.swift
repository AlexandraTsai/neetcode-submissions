/**
 * Definition for singly-linked list.
 * class ListNode {
 *     var val: Int
 *     var next: ListNode?
 *     init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
            var prev: ListNode? = nil
            var curr = head
            while curr != nil {
                let next = curr?.next   // 先暫存下一個節點，因為等下要覆蓋 curr.next
                curr?.next = prev       // 反轉指標方向
                prev = curr             // prev 往前移
                curr = next             // curr 往前移
            }
            return prev
        }
}
