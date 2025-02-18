import Foundation
// CLOSURE IS UN NAMED block of code which you can assingh to a variable or you can pass an agument they can be used after the function has run

//let closure = (()->())
//Basic Syntax for closure()
let names = ["Mike", "Sharon", "Alice","Jesica"]

//reversed names using closure
let reversedNames1 = names.sorted(by: {(s1:String, s2:String) -> Bool in return s1 > s2})
//
//print(reversedNames1)

//inferring types from context
let reversedNames2 = names.sorted(by: {s1,s2 in return s1 > s2})
//print(reversedNames2)

//implicit returns from single expression closures
let reversedNames3 = names.sorted(by: {s1,s2 in s1 > s2})

//print(reversedNames3)




//TRAILLING CLOSURES
/*
 When the last parameter of a function is a closure, you can use the trailing closure syntax to improve readability
 */

func fetcData(completion: () -> Void){
    //simulating getting data
    print("Fetching data...")
    completion()
}
//Using trailing closure syntax
//fetcData {
//    print("Data fetched successfully")
//}


let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

let strings = numbers.map{(number) -> String in
    var number = number
    var output = ""
    repeat{
        output = digitNames[number % 10]! + output
        number /= 10
    }while number > 0
//    print(output)
    return output
}

//ESACAPING CLOSURES

/*
 Sometimes, a closure needs to escape the scope of the function it was passed into. This typically happens when the closure is stored and executed later, like in an asynchronous task.
 */
@MainActor
func executeAsynchronously(completion: @escaping () -> Void){
    print("start of the function")
    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
        print("Executing asynchronously...")
        completion()
        
    }
    print("hello from inside the closure")
}
//executeAsynchronously(completion: {print("test completed")})
    

//AUTOCLOSURE

/*
 An @autoclosure is a special type of closure that is automatically created to wrap an expression passed as an argument to a function.
 */

func printNumber(_ number: @autoclosure () -> Int){
    print(number())
}
printNumber(5)

func birthdayWish(message: String, wishThem: @autoclosure ()->Void){
    let message = "Happy Birthday!"
    print(message)
    wishThem()
}
birthdayWish(message: "Happy Birthday!", wishThem: print("this is your wish"))
    


//




