//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

// custom queue - creating your own queue


// by default custom queue is Serial queue

/*
 A serial queue is ideal when tasks need to be executed one after the other. This is useful, for instance, when accessing shared resources or ensuring task completion order.
 */
let serialQueue = DispatchQueue(label: "com.so.somecompany.myFirstSerial")

func logUserAction(action: String){
    serialQueue.async {
        print("Logging action performed: \(action)")
        //simulate network delay
        sleep(2)

    }
}
//logUserAction(action: "Open App")
//logUserAction(action: "Login")
//logUserAction(action: "View Profile")


/*
 A concurrent queue is useful when you want multiple tasks to run at the same time. This is effective for non-blocking tasks that don’t need to follow a strict order.
 */
let concurentQ = DispatchQueue(label: "com.so.somecompany.myFirstSerial", attributes: .concurrent)

func fetchData(from url : String){
    concurentQ.async {
        print("Fetching data from \(url)")
        //simulate a network delay
        sleep(3)
        print("Data fetched from \(url)")
        
    }
}

//fetchData(from: "https//api.example1")
//fetchData(from: "https//api.example2")
//fetchData(from: "https//api.example3")
//fetchData(from: "https//api.example4")


//Custom Queue with Quality of Service (QoS)

let userInitiatedQueue =  DispatchQueue(label: "https//api.example", qos: .userInitiated)

func performUserAction(action: String){
    userInitiatedQueue.async {
        print("performing \(action)")
        //simulate quick task
        sleep(1)
        print("\(action) completed")
    }
}

//performUserAction(action: "pull down refresh")
//performUserAction(action: "Fetch Notification")


//
/*
 Custom Concurrent Queue with Barrier for Thread-Safe Data Access
 
 When working with shared resources, you can use a concurrent queue with a barrier to ensure that only one write operation occurs at a time, while multiple read operations can run concurrently
 */

let dataQueue = DispatchQueue(label: "https//example.com", attributes: .concurrent)

var sharedData : [String] = []

func readData(){
    dataQueue.async {
        print("Reading data : \(sharedData)")
    }
}

func writeData(_ newData: String){
    dataQueue.async(flags: .barrier){
        sharedData.append(newData)
        print("Writting data: \(newData)")
    }
}

// Reading and writing data
readData()              // Can run concurrently
writeData("Entry 1")    // Writes with barrier, blocking other writes
readData()              // Can run concurrently with reads
writeData("Entry 2")    // Another write with barrier
readData()
