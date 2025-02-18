
//if-Else statement


let tempereture = 28

if tempereture > 30{
    print("its really hot out here")
}else if tempereture < 20{
    print("its warm today")
}else{
    print("its really cold out here")
}

//switch statement

let dayOfWeek = 5

switch dayOfWeek{
case 1 :
    print("Sunday")
case 2 :
    print("Monday")
case 3 :
    print("Tuesday")
case 4 :
    print("Wednesday")
case 5 :
    print("Thursday")
case 6 :
    print("Friday")
case 7 :
    print("Saturday")
default:
    print("Invalid day of the week")

}


//for in loop

let languages = ["JavaScript","python", "Swift"]

for language in languages {
    print("Ilove coding in \(language)")
}


//while loop
 var count = 3

while count > 0{
    print("the count down \(count)")
    count -= 1
    
}
print("Liftoff")


//repeat-while loop

var index = 0

repeat {
    print("the index is \(index)")
    index += 1
}while index < 5
        
        
//Guard is used for early exits when a condition is not met, improving code readability by reducing nested structures.

func checkEligibility(age: Int?) {
    guard let validAge = age, validAge >= 18 else {
        print("Not eligible")
        return
    }
    print("Eligible")
}

checkEligibility(age: 54)
checkEligibility(age: 15)








