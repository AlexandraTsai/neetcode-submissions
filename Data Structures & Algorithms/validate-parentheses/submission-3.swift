class Solution {
    func isValid(_ s: String) -> Bool {
        var stack: [Character] = []
        let dic: [Character: Character] = [
            "]": "[",
            ")": "(",
            "}": "{"
        ]
        for c in s {
            if let open = dic[c] {
                if stack.last == open {
                    stack.removeLast()
                } else {
                    return false
                }
            } else {
                stack.append(c)
            }
        }
        return stack.isEmpty
    }
}
