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
        guard let head = head else {
            return nil
        }

        var current: ListNode? = head
        var prev: ListNode?
        while current?.next != nil {
            var newNext = current?.next
            var newPrev = current
            newPrev?.next = prev
            current = newNext
            prev = newPrev
        }
        current?.next = prev
        return current
    }
}
