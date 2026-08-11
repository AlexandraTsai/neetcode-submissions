class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        guard grid.count > 0, grid[0].count > 0 else {
            return 0
        }
        var grid = grid
        let rows = grid.count
        let cols = grid[0].count
        var numberOfIslands = 0

        func dfs(_ row: Int, _ col: Int) {
            guard row < rows, row >= 0, col >= 0, col < cols else {
                return 
            }
            guard grid[row][col] == "1" else {
                return
            }
            grid[row][col] = "0"

            dfs(row - 1, col)
            dfs(row + 1, col)
            dfs(row, col - 1)
            dfs(row, col + 1)
        }

        for row in 0..<rows {
            for c in 0..<cols {
                if grid[row][c] == "1" {
                    numberOfIslands += 1
                    dfs(row, c)
                }
            }
        }

        return numberOfIslands
    }
}
