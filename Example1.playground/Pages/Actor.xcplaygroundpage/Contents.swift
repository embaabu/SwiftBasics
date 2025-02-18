//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

//Actors was introduced in 2019
//actor is a refrence type similar like classes but does not support inheritance and this is thread safe


/*
 An actor is a reference type that protects its data from concurrent access by using data isolation. This means only one thread can access an actor’s mutable state at a time, ensuring safe access in multi-threaded environments.
 
 */

/*
 
 a RACE CONDITION occurs when multiple threads simultaneously access and modify a shared resource. In a race condition, the outcome is unpredictable because it depends on the sequence and timing of certain events which are outside the control of the program.
 In concurrent programming, shared mutable state can lead to RACE CONDITION and undefined behavior
 Actors solve this by isolating the state, preventing direct access to its properties from outside. Instead, you interact with the actor asynchronously, ensuring thread safety.
 */
//actor Counter{
//    private var value = 0
//    
//    func incrementValue(){
//        value += 1
//    }
//    func getValue() -> Int{
//        return value
//    }
//}
//
//Task{
//    let counter = Counter()
//    
//    await counter.incrementValue()
//    await counter.incrementValue()
//    await counter.incrementValue()
//    
//    print(await counter.getValue())
//}


actor BankAccount{
    private var balance: Double = 0.0
    
    func depositAmt(amt: Double) async {
        balance += amt
    }
    func withDrawAmount(amt: Double) async throws {
        guard balance >= amt else {
            throw BankError.insufficientFunds
        }
        balance -= amt
        
    }
    func getTheBalance() async -> Double {
        return balance
    }
}
enum BankError: Error{
    case insufficientFunds
}

let account = BankAccount()

//Task{
//    //depositing 200 to the account
//    await account.depositAmt(amt: 200)
//    //getting balance after the deposit
//    print(await account.getTheBalance())
//    
//    do{
//        try await account.withDrawAmount(amt: 500)
//        print(await account.getTheBalance())
//    }catch{
//        print("Failed to withdraw: \(error) ")
//    }
//}
/*
 Structured concurrency in Swift allows you to organize your concurrent code in a way that makes it safer and easier to follow.
 async let allows for concurrent calls to the actor.
 */


// Testing the actor
Task {
    let account = BankAccount()
    
    // Use async let for concurrency
    async let dep1: () = account.depositAmt(amt: 200)
    async let dep2: () = account.depositAmt(amt: 100)
    async let dep3: () = account.depositAmt(amt: 500)
    async let withDraw1: () = try account.withDrawAmount(amt: 700)
    async let dep4: () = account.depositAmt(amt: 200)
    
    // Await results to ensure execution
    try await (dep1, dep2, dep3, withDraw1, dep4)
    
    // Get the balance
    let balance = await account.getTheBalance()
    print("Final balance: \(balance)")
}
/*
 Using TaskGroup, you can dynamically manage concurrent operations with actors.
 With TaskGroup, we can add tasks dynamically, making this approach powerful for actor-based concurrency.
 */

Task{
    await withTaskGroup(of: Void.self) { group in
        group.addTask { await account.depositAmt(amt: 20) }
        group.addTask { await account.depositAmt(amt: 20) }
        group.addTask { try? await account.withDrawAmount(amt: 20) }
    }
    
    print("getting balance = \(await account.getTheBalance())")
}
