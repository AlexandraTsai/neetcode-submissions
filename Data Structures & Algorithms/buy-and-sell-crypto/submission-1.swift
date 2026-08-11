class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 1 else { return 0 }
    
        var minPrice = prices[0]
        var maxProfit = 0

        for price in prices[1...] {
            minPrice = min(price, minPrice)
            maxProfit = max(maxProfit, price - minPrice)
        }

        return maxProfit
    }
}
