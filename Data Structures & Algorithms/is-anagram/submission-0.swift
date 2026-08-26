class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        
        guard s.count == t.count else { return false }
            
        let sortedS = s.sorted(by: <)
        let sortedT = t.sorted(by: <)
        
        for index in 0 ..< sortedS.count {
            if sortedT[index] != sortedS[index] {
                return false
            }
        }
        
        return true
    }
}
