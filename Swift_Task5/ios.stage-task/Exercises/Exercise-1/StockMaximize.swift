import Foundation

class StockMaximize {
    
    func countProfit(prices: [Int]) -> Int {
        var maxProfit = 0
        for i in 0..<prices.count {
            var maxValue = 0
            for j in i + 1..<prices.count {
                if (prices[j] - prices[i] > maxValue) {
                    maxValue = prices[j] - prices[i]
                }
            }
            maxProfit += maxValue
        }
        return maxProfit
    }
}
