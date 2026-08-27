class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        typealias Map = (num: Int, index: Int)
        
        let sorted = nums.enumerated().map {
            Map(num: $0.element, index: $0.offset)
        }
        .sorted { $0.num < $1.num }

        var rightIndex = nums.count - 1
        var leftIndex = 0

        while rightIndex > leftIndex {
            let left = sorted[leftIndex]
            let right = sorted[rightIndex]
            
            let sum = left.num + right.num
            if sum > target {
                rightIndex -= 1
            } else if sum == target {
                return [left.index, right.index].sorted()
            } else {
                leftIndex += 1
            }
        }
        return []
    }
}
