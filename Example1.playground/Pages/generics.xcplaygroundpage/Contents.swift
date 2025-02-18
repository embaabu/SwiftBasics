//: [Previous](@previous)

import Foundation

//Generics -- this allows you to write code that works with any data types by defining its place holder which can contain any data type insted of specific one


func displayData<T>(data: T){
    print("displaying data \(data)")
}

displayData(data: "String")


func swapTwoNumbers<T>(a: inout T, b: inout T){
    let temp = a
    let a = b
    let b = temp
}

func addTwoNumbers<T:Numeric>(a:T, b:T)->T{
     return a + b
}

print(addTwoNumbers(a: 23, b: 43))

//generic class
class Queue<T> {
    private var elements = [T]()
    
    func enqueue(_ item: T){
        elements.append(item)
    }
    
    func dequeue() -> T?{
        elements.removeFirst()
    }
    func peek() -> T? {
        return elements.first
    }
    func isEmpty() ->Bool {
        return elements.isEmpty
    }
    
}

let intQueue = Queue<Int>()

intQueue.enqueue(15)
intQueue.enqueue(13)
intQueue.enqueue(17)
intQueue.enqueue(143)

if let firstElement = intQueue.peek(){
    print("the first element in the queue is \(firstElement)")
}else{
    print("the queue is empty")
}

if let removedElement = intQueue.dequeue(){
    print("the element removed from the queue is \(removedElement)")
}else{
    print("the queue is empty")
}


//generic struct
struct Stack <T>{
    private var elements = [T]()
    
    mutating func push(_ item: T){
        elements.append(item)
    }
    mutating func pop() -> T? {
        return elements.popLast()
    }
    
    func peek() -> T? {
        return elements.last
    }
}
var intStack = Stack<Int>()

intStack.push(1)
intStack.push(2)
intStack.push(3)
intStack.push(4)

if let topItem = intStack.peek(){
    print("the item at the top of the stack is \(topItem)")
}else{
    print("the stack is empty")
}

if let popedItem = intStack.pop(){
    print("the item that was poped was \(popedItem)")
}else{
    print("the stack is empty")
}

var stringStack = Stack<String>()

stringStack.push("Peach")
stringStack.push("mango")
stringStack.push("orange")
stringStack.push("apple")

if let topItem = stringStack.peek(){
    print("the item at the top of the stack is \(topItem)")
}else{
    print("the stack is empty")
}

if let popedItem = stringStack.pop(){
    print("the item that was poped was \(popedItem)")
}else{
    print("the stack is empty")
}





