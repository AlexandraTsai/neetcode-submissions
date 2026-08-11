class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        
        for row in matrix {
            if row.contains(target) {
                return true
            }
        }

        return false
    }
}
