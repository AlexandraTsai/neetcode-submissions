class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var subsets: [Int] = []
        var result: [[Int]] = []

        func dfs(_ i: Int) {
            if i >= nums.count {
                result.append(subsets)
                return 
            }
            subsets.append(nums[i])
            dfs(i + 1)
            subsets.removeLast()
            dfs(i + 1)
        }
        dfs(0)
        return result
    }
}
