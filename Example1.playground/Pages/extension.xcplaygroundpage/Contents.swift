//EXTENSION
/*
The reduce() method iterates over all items in array, combining them together somehow until you end up with a single value.
The “somehow” is specified by a closure you provide
 */

extension String {
    var numberOfVowels: Int {
        let vowels = "aeiouAEIOU"
        return self.reduce(0) { $0 + (vowels.contains($1) ? 1 : 0)}
    }
}

let greeting = "Hello, World!"

//print(greeting.numberOfVowels)

//adding methods to convert double to a string
extension Double {
    func toString() -> String {
        return String(self)
    }
}
let value = 10.0
let newVal = value.toString()
let val = type(of: newVal)

//print(val)

print("The value of \(value) is now a \(val)")
