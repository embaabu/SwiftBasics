//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"
//print(greeting)




//function to chech the password if its strong or not
enum PasswordError: Error{
    case short
    case obvious
}

func checkPassword(_ password: String) throws -> String{
    
    
    if password.count < 5 {
        throw PasswordError.short
    }
    if password == "1234" {
        throw PasswordError.obvious
    }
    if password.count >= 5 && password.count <= 8 {
        return "Pasword is ok"
    }else if password.count >= 9 && password.count <= 10{
        return "password is good"
    }else{
        return "Excellent"
    }
    
}

let password = "qwer"

do{
    let result = try checkPassword(password)
    print("Password rating: \(result)")
    
}catch{
    switch error{
    case PasswordError.short:
        print("The password is too short please use a longer password")
    case PasswordError.obvious:
        print("the password is too obvious")
    default:
        print("There was an error!!")
    }
    
}
