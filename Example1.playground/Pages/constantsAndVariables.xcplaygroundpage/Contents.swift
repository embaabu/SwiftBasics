//declearing constants and variables

//you declear constants using let- this means thy can not be changed in the future
let maximumNumberOfLoginAttempts: Int

//you declear variables with var- this means you can change the variable in future
var currentLoginAttempt = 0

var environment = "development"

//using conditionals if statement

if environment == "development"{
    maximumNumberOfLoginAttempts = 100
    print(maximumNumberOfLoginAttempts)
}else{
    maximumNumberOfLoginAttempts = 10
    print(maximumNumberOfLoginAttempts)
}
