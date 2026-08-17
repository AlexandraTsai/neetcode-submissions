/*
Definition for a Node.
class Node {
    var val: Int
    var neighbors: [Node?]
    init(_ val: Int) {
        self.val = val
        self.neighbors = []
    }
}
*/

class Solution {
    func cloneGraph(_ node: Node?) -> Node? {
        typealias NewNode = Node
        typealias NodeValue = Int
        
        guard let node else { return nil }
        var dic: [NodeValue: NewNode?] = [:]
        
        func dfs(_ node: Node) -> Node? {
            if let cloned = dic[node.val] {
                return cloned
            }
            let newNode = NewNode(node.val)
            
            dic[node.val] = newNode
            for neighbor in node.neighbors {
                if let neighbor {
                    newNode.neighbors.append(dfs(neighbor))
                }
            }
            
            return newNode
        }
        
        return dfs(node)
    }
}
