class WordDictionary {

    var root: TrieNode? = TrieNode()

    func addWord(_ word: String) {
        var node = root
        for char in word {
            if node?.children[char] == nil {
                node?.children[char] = TrieNode()
            }
            node = node?.children[char]
        }
        node?.isEndNode = true
    }

    func search(_ word: String) -> Bool {
        let chars = Array(word)
        guard let root else { return false }
        return dfs(chars: chars, index: 0, node: root)
    }

    func dfs(chars: [Character], index: Int, node: TrieNode) -> Bool {
        if index == chars.count {
            return node.isEndNode
        }
        
        let char = chars[index]
        let nextIndex = index + 1

        if char == "." {
            for childNode in node.children {
                if dfs(chars: chars, index: nextIndex, node: childNode.value) {
                    return true
                }
            }
            return false

        } else {
            if let node = node.children[char] {
                return dfs(chars: chars, index: nextIndex, node: node)
            } else {
                return false
            }
        }
    }
}

class TrieNode {
    var children: [Character: TrieNode] = [:]
    var isEndNode: Bool = false
}