import Foundation
//: Array Element Check - O(1)

// Warmup
var warmupArray = Array<Int>(repeating: 0, count: 100)
let sortedTime = BenchTimer.measureBlock {
    warmupArray.sort()
}

print("Sorting took \(sortedTime.formattedTime)")
print("Average check first element execution time for an array")
print("-------------------------------------------------------")

let arraySizes = [10, 100, 1000, 10000, 100000]

// generate arrays and measure method call
for size in arraySizes {
    let array = Array<Int>(repeating: 0, count: size)

    let execTime = BenchTimer.measureBlock {
        _ = array.startsWithZero()
    }
    
    print(String(format: "Size %d -> %@", array.count, execTime.formattedTime))
}
//: Dictionary Search - O(1)
print("\nAverage element lookup time in a dictionary")
print("---------------------------------------------")

let dictSizes = [100, 1000, 100000]

// generate dictionaries and measure lookup
for size in dictSizes {
    let dictionary = Dictionary.generate(size: size)
    let randomKey = String(Int.random(in: 0..<size))
    
    let execTime = BenchTimer.measureBlock {
        _ = dictionary[randomKey]
    }
    
    print(String(format: "Size %d -> %@", dictionary.count, execTime.formattedTime))
}

