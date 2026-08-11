class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var maxProfit = 0
        guard prices.count > 1 else { return maxProfit }
        var buy = 0
        var sell = 1

        for (day, buyPrice) in prices.enumerated() {

            for sellPrice in prices[(day+1)...] {
                maxProfit = max(maxProfit, sellPrice - buyPrice)
            }
        }

        return maxProfit
    }
}
