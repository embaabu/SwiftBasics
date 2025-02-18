
//MAP
/*?
 The map function takes closure as its argument and applies it to each element in a sequence, returning a new sequence of transformed elements.
 */
let numbers = [1, 2, 3, 4, 5]

//This will return the squares of each elements in the array
let result = numbers.map{ $0 * $0}

//print(numbers)
//print(result)

let fruits = ["apple", "banana", "cherry"]
//This will return all the words in the array in capital letters
let upperCased = fruits.map{ $0.uppercased() }

//print(upperCased)


//FILTER

let nums = [1, 2,546,43,3423,24,34,24 ,3, 4, 5,10]

let evenNum = nums.filter{ $0 % 2 == 0}

print(evenNum)


//REDUCE
/**
 The reduce function takes closure as its argument and combines all the elements in a sequence to produce a single value.
 */

let sumOfNums = numbers.reduce(0, {$0 + $1} )

print(sumOfNums)


//SORTED
/**
 The sorted function returns a new, sorted array of elements from a sequence. The elements are sorted according to the provided closure, which is a function that takes two elements as its input and returns a Boolean value indicating whether the first element should come before the second element in the sorted array.
 */
let sortedNum = nums.sorted()

//print(sortedNum)

let sortedFruits = fruits.sorted{$0 < $1}

print(sortedFruits)

//flaten -- flatens a nested array



//compact

//FOR EACH
/*
 The forEach function is used to perform an action on each element of a sequence. Unlike the map function, which returns a new sequence of transformed elements, forEach does not return a value. Instead, it simply performs the specified action on each element of the sequence.
 */

// remove an element from an array that are duplicates

let arrayWithDup = [2,3,4,53,2,3,2,3,3,1,3]

let uniqueNums = Array(Set(arrayWithDup))
print(uniqueNums)


//Remove Element
/*Given an integer array nums and an integer val, remove all occurrences of val in nums in-place. */

class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var val = 3
        var k = 0
        nums.forEach{
            if $0 != val{
                nums[k] = $0
                k += 1
            }
        
        }
        return k
        
    }
}


numbers.forEach{
    if $0 > 2{
        print($0)
    }
    
        
    
}
