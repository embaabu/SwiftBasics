//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

var name: String = "swift"

let closure = { [name] in
    print(name)
    
}
closure()

print("after updating")

name = "new Obj"

closure()
//using closure that refrences a class using self we use the weak self
class Employee{
    var rollNo: Int
    var giveRollNo: (()-> Void)?
    
    init(rollNo: Int) {
        self.rollNo = rollNo
        
        giveRollNo = { [weak self] in
            print("Roll no is - \(String(describing: self?.rollNo))")
        }
    }
    deinit {
        print("roll no is \(self.rollNo) is deinitilized")
    }

    
}

//var emp: Employee? = Employee(rollNo: 123)
//emp?.giveRollNo?()
//emp = nil

//Example of Capture



class AreaTest{
    var height: Int
    var width: Int
    var area : (()-> Void)?
    init(height: Int = 10, width: Int = 20) {
        self.height = height
        self.width = width
    
        area = { [weak self] in
            guard let self = self else{return}
            
            let calculatedArea = self.height * self.width
            
            print("the area of the squre is \(calculatedArea)")
        }
    

    }
    deinit{
        print("AreaTest instance is deinitialized")
        
    }
}

var areaTest : AreaTest? = AreaTest(height: 22, width: 12)

areaTest?.area?()
areaTest = nil

areaTest?.area?()


