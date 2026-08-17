class Solution {
    func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
         guard let first = words.first, board.count > 0 else { return [] }
        let trie = Trie(root: TrieNode())
        
        words.forEach { trie.add(word: $0) }
        
        var board = board
        var rowCount = board.count
        var columCount = board[0].count
        var result: Set<String> = .init()
        
        func dfs(_ row: Int, _ col: Int, node: TrieNode) {
            guard row >= 0, col >= 0, row < rowCount, col < columCount else {
                return
            }
            let char = board[row][col]
            guard char != "#", let nextNode = node.children[char] else {
                return
            }
            
            if let word = nextNode.word {
                result.insert(word)
            }

            board[row][col] = "#"
            dfs(row - 1, col, node: nextNode)
            dfs(row + 1, col, node: nextNode)
            dfs(row, col - 1, node: nextNode)
            dfs(row, col + 1, node: nextNode)

            board[row][col] = char // reset

        }
        
        for row in 0..<rowCount {
            for col in 0..<columCount {
                dfs(row, col, node: trie.root)
            }
        }
        
        return Array(result)
    }

    class TrieNode {
        var children: [Character: TrieNode] = [:]
        var word: String? = nil
    }
    
    class Trie {
        var root: TrieNode
        
        init(root: TrieNode) {
            self.root = root
        }
        
        func add(word: String) {
            var node = root
            for char in word {
                
                if node.children[char] == nil {
                    let child = TrieNode()
                    node.children[char] = child
                }
                node = node.children[char]!
            }
            node.word = word
        }
    }
}
