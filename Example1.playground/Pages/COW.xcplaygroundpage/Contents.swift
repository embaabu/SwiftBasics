//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)
//COW copy on write -- its a memory optimization techique by swift which works for value types. untill you modify a copied element it refersrs to the same internal momory location

//classes are refrence types
//structs and primetive data types are value types


var originalArray = [1,2,3,4,5]

var copyArray = originalArray

print(originalArray)

print(copyArray)

originalArray.append(12)

print(originalArray)
print(copyArray)



