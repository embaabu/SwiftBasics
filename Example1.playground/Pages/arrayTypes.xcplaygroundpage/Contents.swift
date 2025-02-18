//collections

//1. Array
/*
 An array is an ordered collection of values of the same type. Elements in an array are accessed by their index, starting from 0.
 
 */

//creating a empty array
var newFruits: [String] = []
//addding elements to the new empty array
newFruits.append("banana")
    //printing the array at the first index
//print(newFruits[0])

var fruits = ["apples", "bananas", "cantelope", "pinapples"]

fruits.append("kiwi")
//getting the length of the array
print(fruits.count)

//print(fruits[1])

//an array with repeting values

let newDigits = Array(repeating: 0, count: 10 )

//print(newDigits)


//accessing array values

for fruit in fruits{
//    print("I love to eat \(fruit)")
}

//accessing the first and the last element in the array
if let firstFruit = fruits.first, let lastFruit = fruits.last
{
    print(firstFruit, lastFruit, separator: ", " )
}

//adding another array to the current array

fruits.append(contentsOf: ["tomatoe", "grapes"])

//print(fruits)

//insert an element at a specific index
fruits.insert("powpow", at: 3)
//print(fruits)

//removing an element using the index

fruits.remove(at: 0)

print(fruits)

//removing the last element in the array
fruits.removeLast()
print(fruits)


