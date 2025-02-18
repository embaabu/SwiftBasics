//: [Previous](@previous)

import Foundation


let greet = {(s1: String, s2: String ) -> String in
    
    return s1 + s2
    
}
let result = greet("Hello", " World")

print(result)


//TRY NUMBER2

func adOoperation(_ num1: Int, _ num2: Int, operation: (Int, Int) -> Int) {
    print("Result is \(operation( num1, num2))")
}

adOoperation(21, 22) { $0 + $1 }

let names = ["Edwin", "Mbaabu", "Ali", "Chris", "Zara"]

let sortedNames = names.sorted {$0.count < $1.count}

print(sortedNames)
