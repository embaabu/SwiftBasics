//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)


/*
 DispatchGroup is part of Grand Central Dispatch (GCD) and is a useful tool when you need to group multiple asynchronous tasks and be notified when they’ve all completed.
 
 */

let group = DispatchGroup()

group.enter()
DispatchQueue.global().async {
    print("task 1 started")
    sleep(2)
    print("task 1 completed")
    group.leave()
}
group.enter()
DispatchQueue.global().async {
    print("task 2 started")
    sleep(2)
    print("task 2 completed")
    group.leave()
}
group.enter()
DispatchQueue.global().async {
    print("task 3 started")
    sleep(2)
    print("task 3 completed")
    group.leave()
}
group.enter()
DispatchQueue.global().async {
    print("task 4 started")
    sleep(2)
    print("task 4 completed")
    group.leave()
}

group.notify(queue: .main){
    print("All tasks completed updating the UI")
}
