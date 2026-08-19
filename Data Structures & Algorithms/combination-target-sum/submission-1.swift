class Solution {
    func combinationSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        var result: [[Int]] = []

        func dfs(_ nums: [Int], _ target: Int, subset: [Int]) {
            guard let val = nums.first, val <= target else {
                if target == 0 {
                    result.append(subset)
                }
                return
            }
            
            var newSubset = subset
            newSubset.append(val)
            dfs(nums, target - val, subset: newSubset) // select

            dfs(Array(nums[1..<nums.count]), target, subset: subset) // not select

        }
        dfs(nums.sorted(), target, subset: [])

        return result
    }
}
