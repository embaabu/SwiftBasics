import UIKit
//using chaining to unwrap the optional
class Person{
    var name: String
    var age: Int
    var car: [String]?
    init(name: String, age: Int, car: [String]?) {
        self.name = name
        self.age = age
        self.car = car
    }
    func increment (){
        self.age += 1
    }
    
}
//test

let p1 = Person(name: "Edwin", age: 12, car: ["BMW" ,"Honda", "VW"]
)
//p1.car = "BMW"
p1.increment()
print(p1.age)
// we can use optional binding to condtitionally bind the wrapped value
//if let unwrappedString = p1.car {
//    print(unwrappedString)
//    
//}else{
//    print("Optional is nil")
//}
//print(p1.car)
// we can try and use optional chaining

if let firstCar = p1.car?.first{
    print("\(p1.name) drives \(firstCar)")
}

