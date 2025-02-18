

class Car {
    // properties of a car
    var make: String
    var model: String
    var year: Int
    var mileage: Double
    
    //initializer
    
    init(make: String, model: String, year: Int, mileage: Double) {
        self.make = make
        self.model = model
        self.year = year
        self.mileage = mileage
    }
    
    //function to display car details
    func displayDetails(){
        print("car details: \(year) \(make) \(model) with \(mileage) miles")
    }
    //method to drive the car
    func drive(_ miles: Double){
        mileage += miles
        print("Driving \(miles) miles...")
    }
}

//subclass inherits from car
class ElectricCar: Car{
    //additional properties
    var batteryLevel: Double
    
    init(make: String, model: String, year: Int, mileage: Double, batteryLevel: Double) {
        self.batteryLevel = batteryLevel
        
        super.init(make: make, model: model, year: year, mileage: mileage)
    }
    //overiding the drive method
    override func drive(_ miles: Double) {
        if batteryLevel > 0 {
            super.drive( miles )
            batteryLevel -= miles * 0.2
            print("Battery level is \(batteryLevel)")
        }else{
            print("Battery is empty! please recharge.")
        }
    }
    
}
// Creating an instance of Car
let myCar = Car(make: "Toyota", model: "Camry", year: 2020, mileage: 15000)
myCar.displayDetails()  // Output: Car Details: 2020 Toyota Camry with 15000.0 miles
myCar.drive( 100 ) // Output: Driving 100 miles...
myCar.displayDetails()  // Output: Car Details: 2020 Toyota Camry with 15100.0 miles

// Creating an instance of ElectricCar
let myElectricCar = ElectricCar(make: "Tesla", model: "Model 3", year: 2021, mileage: 5000, batteryLevel: 100.0)
myElectricCar.displayDetails()  // Output: Car Details: 2021 Tesla Model 3 with 5000.0 miles
myElectricCar.drive( 50 )   // Output: Driving 50 miles... Battery level: 90.0

