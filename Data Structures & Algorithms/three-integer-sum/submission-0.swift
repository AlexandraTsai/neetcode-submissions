class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let sortedNums = nums.sorted()
        var result = Set<[Int]>()

        for index in 0 ..< sortedNums.count {
            let twoSumResult = twoSum(Array(sortedNums[index + 1 ..< sortedNums.count]), current: sortedNums[index])
            result.formUnion(twoSumResult)
        }

        return Array(result)
    }

    func twoSum(_ sortedNums: [Int], current: Int) -> [[Int]] {
         var leftIndex = 0
         var rightIndex = sortedNums.count - 1
         var result = Set<[Int]>()
         let target = -current

         while leftIndex < rightIndex {
            let left = sortedNums[leftIndex]
            let right = sortedNums[rightIndex]
            let sum = left + right
            if sum == target {
                leftIndex += 1
                rightIndex -= 1
                result.insert([current, left, right])
            } else if sum < target {
                leftIndex += 1
            } else {
                rightIndex -= 1
            }
         }

         return Array(result)
    }
}
