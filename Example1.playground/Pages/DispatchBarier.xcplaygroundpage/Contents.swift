////: [Previous](@previous)
//
import Foundation
//
//var greeting = "Hello, playground"
//
////: [Next](@next)
//
//// DispatchBarier - is used to manage concurrent read and singe write operation
//
//
/*
 A dispatch barrier is a group of functions executing in a serial queue. It helps us synchronise executing one or more tasks in a dispatch queue. Use barriers when you need a queue to be delayed.
 */
private let concurrentQueue = DispatchQueue(label: " com.dispatchBarrier", attributes: .concurrent)
concurrentQueue.async {
    
    for value in 1...5 {
        
        print(" TASK I — async \(value)")
    }
}
    
concurrentQueue.async {
    for value in 6...10 {
        print(" TASK II — sync \(value)")
    }
}

for value in 11...15 {
    
    concurrentQueue.async(flags: .barrier) {
    print("TASK III — barrier \(value)")
    }
}
concurrentQueue.async{
    for value in 16...20 {
        print("TASK VI — async \(value)")
    }
}
