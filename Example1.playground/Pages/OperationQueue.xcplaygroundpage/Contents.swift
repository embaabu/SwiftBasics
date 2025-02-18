//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)
//Operation and OperationQueue -- it is a wrapper build on top of GCD, it gives more control like we can pause, start, stop, resume and monitor tast as well
//we can set dependancies between tasks using operation queue

//operationQueue executes operation concurently
// Tasks will execute concurrently by default because OperationQueue is concurrent.
let queue = OperationQueue()

//queue.addOperation {
//    print("Task 1 Started")
//    sleep(2)
//    print("Task 1 completed")
//}
//queue.addOperation {
//    print("Task 2 Started")
//    sleep(2)
//    print("Task 2 completed")
//}
//queue.addOperation {
//    print("Task 3 Started")
//    sleep(2)
//    print("Task 3 completed")
//}
//queue.addOperation {
//    print("Task 4 Started")
//    sleep(2)
//    print("Task 4 completed")
//}

//Setting Maximum Concurrent Operations
let serialQueue = OperationQueue()
serialQueue.maxConcurrentOperationCount = 1  // Now, it acts like a serial queue

serialQueue.addOperation {
    print("Serial Task 1 started")
    sleep(1)
    print("Serial Task 1 completed")
}

serialQueue.addOperation {
    print("Serial Task 2 started")
    sleep(1)
    print("Serial Task 2 completed")
}

// These tasks will execute one after the other.



//Adding Dependencies between Operations

let task1 = BlockOperation{
    print("Task 1 - Fetch Data")
    sleep(1)
}
let task2 = BlockOperation{
    print("Task 2 - process data")
}
let task3 = BlockOperation{
    print("Task 3 - Save Data")
}


let operationQ = OperationQueue()

//setting the dependerncy
task1.addDependency(task2) //task 1 will wait for 2 to finish
task2.addDependency(task3) // task 2 will wait for 3 to finish
//order will be 1->2->3

//adding the operations to the queue
operationQ.addOperations([task1,task2, task3], waitUntilFinished: false)

operationQ.qualityOfService = .userInitiated

operationQ.progress


