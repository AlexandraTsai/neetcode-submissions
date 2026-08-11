class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        guard matrix.count > 0, (matrix.first?.count ?? 0) > 0 else {
            return false
        }
        let rows = matrix.count
        var r = 0
        var c = matrix[0].count  - 1

        while r < rows, c >= 0 {
            let value = matrix[r][c]
            if value == target {
                return true
            } else if target < value {
                c -= 1
            } else {
                r += 1
            }
        }
        return false
    }
}
