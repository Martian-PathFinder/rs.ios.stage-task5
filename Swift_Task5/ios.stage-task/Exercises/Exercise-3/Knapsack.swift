import Foundation

public typealias Supply = (weight: Int, value: Int)

public final class Knapsack {
    let maxWeight: Int
    let drinks: [Supply]
    let foods: [Supply]
    var maxKilometers: Int {
        findMaxKilometres()
    }
    
    init(_ maxWeight: Int, _ foods: [Supply], _ drinks: [Supply]) {
        self.maxWeight = maxWeight
        self.drinks = drinks
        self.foods = foods
    }
    
    func findMaxKilometres() -> Int {
        var maxLength = 0
        guard maxWeight > 0 && maxWeight <= 2500 else {
            return 0
        }
        
        if drinks.count < 1 || drinks.count > 100 { return 0 }
        if foods.count < 1 || foods.count > 100 { return 0 }
        
        let foodsKnapsack = getKnapsack(for: foods)
        let drinksKnapsack = getKnapsack(for: drinks)
        
        for i in 0...maxWeight {
            let food = foodsKnapsack[foods.count][i]
            let drink = drinksKnapsack[drinks.count][maxWeight - i]
            
            maxLength = max(maxLength, min(food, drink))
        }
        return maxLength
    }
    
    func getKnapsack(for array: [Supply]) -> [[Int]] {
        var table: [[Int]] = Array(repeating: Array(repeating: 0, count: maxWeight + 1), count: array.count + 1)
        for i in 1 ... array.count {
            for j in 1 ... maxWeight {
                if (array[i - 1].weight > j) {
                    table[i][j] = table[i - 1][j]
                } else {
                    table[i][j] = max(table[i - 1][j], (array[i - 1].value + table[i - 1][j - array[i - 1].weight]))
                }
            }
        }
        return table
    }
}
