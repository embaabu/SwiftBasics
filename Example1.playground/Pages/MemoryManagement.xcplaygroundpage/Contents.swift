//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)
/**
 Memory types
 1. Stack memory -- LIFO Used  for vaule types  .  this is also used for storing all local variables or parameter to function return types
                                Data allocated in stack momory  is automatically deallocated when usage is done by compiler itself Stack memory is fixed size memory
    
 2. Heap Memory -- this allocated at run time
    Objects like Views, array of object, complicated data will be saved
 
 MemoryManagement   in IOS
 ARC - Automatic Refrence counting
 -- weak
 - strong
 -- unowned 
 */
/*
 the Person object holds a strong reference to the Car object, and the Car object, in turn, holds a strong reference to the Person object. In this situation, both objects mutually capture each other, forming a retain cycle
 */
class Person{
    var name: String
    weak var family : Family?
    
    
    init(name: String) {
        self.name = name
        
    }
    deinit{
        print("person deinit is called")
    }
}

class Family{
    var father1: Person?
    var mother1: Person?
    
    init(father1: Person?, mother1: Person? ) {
        self.father1 = father1
        self.mother1 = mother1
    }
    deinit{
        print("fammily deinit is called")
    }
}

var father1 = Person(name: "Paul")
var mother1 = Person(name: "Mary")

// Strong references prevent the object from being deallocated.
// Therefore, the variables family.father and family.mother will remain valid until the object is deallocated.

var family: Family? = Family(father1: father1, mother1: mother1)

father1.family = family
mother1.family = family

if let fatherName = family?.father1?.name{
    print("My fathers name is \(fatherName)")
}else{
    print("I dont know my fathers name")
}
if let motherName = family?.mother1?.name{
    print("My mothers name is \(motherName)")
}else{
    print("I dont know my mothers name")
}

family = nil

//trying to delete the object to see if we can dealocate the memory
family = Family(father1: nil, mother1: nil)

//print("Father's name after changing family: \(father1.name)")
//print("Mother's name after changing family: \(mother1.name)")
print("My fathers name is still \(String(describing: family?.father1?.name))")

if let fatherName = family?.father1?.name{
    print("My fathers name is still \(fatherName)")
}else{
    print("I dont know my fathers name")
}
if let motherName = family?.mother1?.name{
    print("My mothers name is still  \(motherName)")
}else{
    print("I dont know my mothers name")
}


//Weak Refrence

class Person2 {
    var name: String
    
    init(name: String) {
        self.name = name
        print("\(name) is initialized")
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

class Family2 {
    weak var father: Person2?  // Using weak reference
    weak var mother: Person2?  // Using weak reference
    
    init(father: Person2?, mother: Person2?) {
        self.father = father
        self.mother = mother
    }
}

// Creating instances of Person
var father: Person2? = Person2(name: "Paul")
var mother: Person2? = Person2(name: "Mary")

// Creating an instance of Family with weak references to father and mother
var family2 = Family2(father: father, mother: mother)

// Accessing father and mother names
if let fatherName = family2.father?.name {
    print("My father's name is \(fatherName)")
} else {
    print("I don't know my father's name")
}

if let motherName = family2.mother?.name {
    print("My mother's name is \(motherName)")
} else {
    print("I don't know my mother's name")
}

// Setting father and mother to nil
father = nil
mother = nil

// Checking the weak references in Family
if let fatherName = family2.father?.name {
    print("Father's name after setting father to nil: \(fatherName)")
} else {
    print("I don't know my father's name")
}

if let motherName = family2.mother?.name {
    print("Mother's name after setting mother to nil: \(motherName)")
} else {
    print("I don't know my mother's name")
}
