class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        
        for row in matrix {
            if let last = row.last,
                let first = row.first,
                last >= target,
                first <= target
              {
                return row.contains(target)
            }
        }

        return false
    }
}
