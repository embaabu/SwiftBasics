//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

/*
 semaphores is a syncronization tools that youu can use to controll for shared resorce in concurent programming
 Semaphores give us the ability to control access to a shared resource by multiple threads
 */

let seamapho = DispatchSemaphore(value:2) //will be allowing 3 concurent operation

func fetchingData(taskId: Int){
    seamapho.wait() //requesting access
    
    print("starting my task with \(taskId)")
    sleep(5)
    print("finished my task with \(taskId)")
    seamapho.signal()
    
}
for i in 1...4{
    DispatchQueue.global().async{fetchingData(taskId: i)}
}

