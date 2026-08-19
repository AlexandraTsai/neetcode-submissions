class Solution {
    func combinationSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        var result: [[Int]] = []

        func dfs(_ nums: [Int], _ target: Int, subset: inout [Int]) {
            guard let val = nums.first, val <= target else {
                if target == 0 {
                    result.append(subset)
                }
                return
            }
            
            subset.append(val)
            dfs(nums, target - val, subset: &subset) // select

            subset.removeLast()
            dfs(Array(nums[1..<nums.count]), target, subset: &subset) // not select

        }
        var subset: [Int] = []
        dfs(nums.sorted(), target, subset: &subset)

        return result
    }
}
