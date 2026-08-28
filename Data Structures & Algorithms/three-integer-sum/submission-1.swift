class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let sortedNums = nums.sorted()
        var result: [[Int]] = []
        let n = sortedNums.count
        
        for i in 0..<n {
            // 剪枝：排序後，如果目前這個數已經 > 0，後面都更大，不可能三數和為0
            if sortedNums[i] > 0 { break }
            
            // 跳過外層重複值，避免重複的 triplet
            if i > 0, sortedNums[i] == sortedNums[i - 1] { continue }
            
            var left = i + 1
            var right = n - 1
            let target = -sortedNums[i]
            
            while left < right {
                let sum = sortedNums[left] + sortedNums[right]
                
                if sum == target {
                    result.append([sortedNums[i], sortedNums[left], sortedNums[right]])
                    left += 1
                    right -= 1
                    // 跳過內層重複值
                    while left < right, sortedNums[left] == sortedNums[left - 1] {
                        left += 1
                    }
                    while left < right, sortedNums[right] == sortedNums[right + 1] {
                        right -= 1
                    }
                } else if sum < target {
                    left += 1
                } else {
                    right -= 1
                }
            }
        }
        
        return result
    }

}
