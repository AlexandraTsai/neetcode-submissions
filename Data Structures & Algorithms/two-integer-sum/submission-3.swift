class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        typealias Num = Int
        typealias Index = Int
        var seen = [Num: Index]()

        for (index, num) in nums.enumerated() {
            let diff = target - num
            if let seenIndex = seen[diff] {
                return [index, seenIndex].sorted()
            }
            seen[num] = index
        }
        return []
    }
}
