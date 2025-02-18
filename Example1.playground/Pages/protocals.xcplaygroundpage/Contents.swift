
protocol Vehicle {
    func start()
    
}
//inheritance of the protocals
//CAR AND JET INHERIT FROM THE PROTOCAL VEHICLE
protocol Car: Vehicle{
    func drive()
}

protocol Jet: Vehicle{
    func fly()
    
}

struct BMW: Car{
    func start() {
        print("BMW engine is starting")
    }
    
    func drive() {
        print("BMW is driving to Mexico")
    }
    
}

struct Airbus: Jet{
    func start() {
        print("Airbus engine is starting")
    }
    
    func fly() {
        print("Airbus is flying to Kenya")
    }
}

let bmw = BMW()
bmw.start()
bmw.drive()

let airbus = Airbus()
airbus.start()
airbus.fly()


//PROTOCAL COMPOSITION

/*Protocol composition allows a type to conform to multiple protocols simultaneously without creating an entirely new protocol.*/


protocol Drivable {
    func drive()
}

protocol Flyable {
    func fly()
}

// Function that takes a type conforming to both Drivable and Flyable
typealias Movable = Drivable & Flyable

func travel(vehicle: Movable ) {
    vehicle.drive()
    vehicle.fly()
}

struct FlyingCar: Drivable, Flyable {
    func drive() {
        print("Driving on the road")
    }
    
    func fly() {
        print("Flying in the air")
    }
}

let myFlyingCar = FlyingCar()
travel(vehicle: myFlyingCar)


