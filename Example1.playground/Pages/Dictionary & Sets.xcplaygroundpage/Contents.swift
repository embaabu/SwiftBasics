//Dictionary

//creating an empty dictionry
/*
 A dictionary is an unordered collection of key-value pairs, where each key must be unique within the dictionary
 */

var emptyDict : [String : String] = [:]


var responseMessages = ["200": "OK",
                        "403": "Access Forbidden",
                        "404": "file not found",
                        "500": "Internal server error "]

print(responseMessages["200"])


/*
 A set is an unordered collection of unique values. Sets are useful when you need to ensure that each item appears only once or perform set operations like union, intersection, and difference.
 */


let setA: Set = [1, 2, 3]
let setB: Set = [3, 4, 5]

let union = setA.union(setB)           // {1, 2, 3, 4, 5}
let intersection = setA.intersection(setB) // {3}
let difference = setA.subtracting(setB)
