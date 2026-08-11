class TrieNode {
    var children: [Character: TrieNode]
    var endOfWord: Bool

    init() {
        children = [:]
        endOfWord = false
    }
}

class PrefixTree {

    private let root: TrieNode = .init()

    func insert(_ word: String) {
        var node: TrieNode? = root
        for char in word {
            if node?.children[char] == nil {
                node?.children[char] = TrieNode()
            }
            node = node?.children[char]
        }
        node?.endOfWord = true
    }

    func search(_ word: String) -> Bool {
        var node: TrieNode? = root
        for char in word {
            node = node?.children[char]
        }
        return node?.endOfWord == true
    }

    func startsWith(_ prefix: String) -> Bool {
        var node: TrieNode? = root
        for char in prefix {
            node = node?.children[char]
        }
        return node != nil
   }
}
