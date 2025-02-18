//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

// concurency / Multithreading

/*
 thread is a single unit of execution within the process. thread will allow us to perform multiple task consurrently
Multithreading - doing multiple tasks simultaneously
 
 1. GCD - GRAND CENTRAL DISPATCH
 2. OPERATION AND OPERATION QUEUE
 3. ASYNC AWAIT - swift concurency
 4. DISPATCH GROUP
 5. DISPATCH BARRIER
 6. THREAD
 7. SEAMPHORES
*/

let t1 = Thread{
    print("This task wll run in the background")
}

t1.start()
t1.isMainThread
t1.cancel()

//GCD(GRAND CENTRAL DISPATCH) - FIFO - first in first out- this is an API which is build on top of thread which is given by apple to simplify multithreading -- GCD allows devs to write concurent/ asynchronus code without having to del with complexity of the thread management
//DispatchQueue is used for GDC
/*
 3Types of queues
 1. Main Queues- any realated UI should be done on Main queue
 2. Custom Queue
 3. Global Queus -- These are concurrent queues that are shared by the system and are available to all applications.
 
 1.MAIN QUEUE
    - updating UI elements
    - Loading Images
    - Handling notification
    - Coredata Fetching
 */
DispatchQueue.main.async {
    print("this task will be performed on main thread")
}

DispatchQueue.main.asyncAfter(deadline: .now() + 5.0, qos: .background){
    print("task is being done after 5 second delay")
}

//1. Updating UI Elements
DispatchQueue.main.async {
//    self.tableview.reloadview()
    print("This is a UI task") //perform UI task here, such as upating a label or btn
}

//loading images asycnchronus

// Perform background task here, like fetching data from server or images 
DispatchQueue.global().async { 
    
    print("This is a global background task")
    
}

//user Defined Dispatch queue

/*
 Serial Dispatch Queues: These queues execute one task at a time, in the order they are added. Tasks are guaranteed to run in the order they were added to the queue.
 */

let serialQueue = DispatchQueue(label: "https//uffgvf")

//having asyncronus task
serialQueue.async {
    print("perform this task first")
        
}
serialQueue.async {
    print("perform this task next")
}

