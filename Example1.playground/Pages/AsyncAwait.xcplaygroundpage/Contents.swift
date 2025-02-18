//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

//asyc await --  its the new for of concurency introduced by apple in 2019
//this is also called as structured concurency
/*
 Async/await in Swift simplifies asynchronous programming by letting you write async code in a linear, easy-to-follow way.
 */

//func fetchData1(url: String) async -> String{
//    print("fetch data from 1")
//    try? await Task.sleep(nanoseconds: 2 * 1_000_000_000)
//    
//    return "test data1"
//}
//func fetchData2(url: String) async -> String{
//    print("fetch data from 2")
//    try? await Task.sleep(nanoseconds: 2 * 1_000_000_000)
//    
//    return "test data2"
//}
//func fetchData3(url: String) async -> String{
//    print("fetch data from 3")
//    try? await Task.sleep(nanoseconds: 2 * 1_000_000_000)
//    
//    return "test data3"
//}
//
//Task{
//    let result1 = await fetchData1(url: "testurl")
//    print(result1)
//    let result2 = await fetchData2(url: "testurl")
//    print(result2)
//    let result3 = await fetchData3(url: "testurl")
//    print(result3)
//
//}


//async let
/*
 Swift allows running multiple async tasks concurrently using async let. This can improve performance if tasks don’t depend on each other.*/

func fetchPost() async -> String {
    try? await Task.sleep(nanoseconds: 1 * 1_000_000_000)
    print("i am running")
    return "Post data"
}

func fetchComments() async -> String {
    try? await Task.sleep(nanoseconds: 1 * 1_000_000_000)
    print("i am running2")
    return "Comments data"
}

Task {
    async let post = fetchPost()
    async let comments = fetchComments()
    
    let (postData, commentsData) = await (post, comments)
//    let  = await
    
    print("Post:", postData)
    print("Comments:", commentsData)
}


