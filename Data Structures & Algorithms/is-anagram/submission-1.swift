class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        let sMap = getFrequencyMap(s)
        let tMap = getFrequencyMap(t)
        return sMap == tMap
    }

    func getFrequencyMap(_ string: String) -> [Character: Int] {
        var map = [Character: Int]()

        for char in string {
            map[char, default: 0] += 1
        }

        return map
    }
}
