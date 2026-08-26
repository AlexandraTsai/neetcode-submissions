class Solution {
    func hasDuplicate(_ nums: [Int]) -> Bool {
        typealias Count = Int
        typealias Num = Int
        var dic: [Num: Count] = [:]

        for num in nums {
            var value = dic[num, default: 0] + 1
            dic[num] = value
            if value > 1 {
                return true
            }
        }
        return false
    }
}
