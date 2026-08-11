class Solution {
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        
        guard grid.count > 0, grid[0].count > 0 else { return 0 }
        
        var grid = grid
        let row = grid.count
        let col = grid[0].count
        var maxArea = 0

        func dfs(_ r: Int, _ c: Int, area : inout Int)  {
            guard r >= 0, c >= 0, r < row, c < col, grid[r][c] == 1 else {
                return 
            }
            grid[r][c] = 0
            area += 1

            dfs(r - 1, c, area: &area)
            dfs(r + 1, c, area: &area)
            dfs(r, c - 1, area: &area)
            dfs(r, c + 1, area: &area)

        }

        for r in 0..<row {
            for c in 0..<col {
                if grid[r][c] == 1 {
                    var area = 0
                    dfs(r, c, area: &area)
                    maxArea = max(maxArea, area) 
                }                
            }
        }

        return maxArea
    }
}
