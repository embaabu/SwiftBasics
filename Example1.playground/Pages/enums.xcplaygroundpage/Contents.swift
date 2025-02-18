//enum
//Enums define a common type for a group of related values and enable you to work with those values in a type-safe way within your code.

enum Direction {
    case north , south, east, west

}

var newDirection = Direction.east

print(newDirection)
func getDirection(currentDirection: Direction){
    switch currentDirection{
    case .north:
        print("heading North")
        
    case .south:
        print("heading South")
    case .east:
        print("heading east")
    case .west:
        print("heading west")
    }
    
}
let direction = Direction.north

getDirection(currentDirection: direction)


//methods in enum
enum Bevarage: String{
    case coffee, tea, juice
    
    func description()-> String {
        return "You ordered a \(self.rawValue)."
        
    }
}
let drink = Bevarage.tea
//print(drink.description())


