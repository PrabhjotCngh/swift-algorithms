

//: - Callout(Brute-force):
//: Just for demonstration purposes, *don't* use it in real code!
func sum(_ n: UInt) -> UInt {
    var result: UInt = 0
    for i in 1...n {
        result += i
    }
    return result
}

let step = 100

var execTime: Double
for i in 1...10 {
    execTime = BenchTimer.measureBlock {
        _ = sum(UInt(i*step))
    }
    print("Average sum(n) execution time for \(i*step) elements: \(execTime.formattedTime)")
}

//: - Callout(Optimized Sum):
//: Sums up the first N natural numbers using the triangle numbers formula
/// see https://en.wikipedia.org/wiki/Triangular_number
func sumOptimized(_ n: UInt) -> UInt {
    return n * (n + 1) / 2
}

//: sum(n) vs. sumOptimized(n)
print("\nsum() vs. sumOptimized()")

var sumTime, sumOptimizedTime: Double

for i in 1...10 {
    // Measure sum() function performance
    sumTime = BenchTimer.measureBlock {
        _ = sum(UInt(i*step))
    }
    // Measure sumOptimized() function performance
    sumOptimizedTime = BenchTimer.measureBlock {
        _ = sumOptimized(UInt(i*step))
    }
    print("- \(i*step) elements: \n\t sum(n) \t\t\t \(sumTime.formattedTime) \n\t sumOptimized(n) \t \(sumOptimizedTime.formattedTime)")
}
