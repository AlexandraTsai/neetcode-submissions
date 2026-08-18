class Solution {
    func islandsAndTreasure(_ grid: inout [[Int]]) {
        typealias Queue = (row: Int, col: Int)

        let rowCount = grid.count
        let columnCount = grid[0].count
        var queue: [Queue] = []
        let INF = 2147483647

        for row in 0 ..< rowCount {
            for col in 0 ..< columnCount {
                let isTreasure = grid[row][col] == 0 
                if isTreasure {
                    queue.append((row: row, col: col)) // set 1st layer
                }
            }
        }
        var index: Int = 0

        while index < queue.count {
            let (row, col) = queue[index]
            index += 1

            for direction in Direction.allCases {
                let newRow = row + direction.row
                let newCol = col + direction.column
                
                guard 
                    newRow >= 0, newRow < rowCount,
                    newCol >= 0, newCol < columnCount,
                    grid[newRow][newCol] == INF else {
                    continue
                }

                grid[newRow][newCol] = grid[row][col] + 1
                queue.append((row: newRow, col: newCol))
            }    
        }
    }

    enum Direction: CaseIterable {
        case up
        case down
        case left
        case right

        var column: Int {
            switch self {
                case .up, .down: return 0
                case .left: return -1
                case .right: return +1
            }
        }
        
        var row: Int {
            switch self {
                case .left, .right: return 0
                case .up: return -1
                case .down: return +1
            }
        }
    }
}
