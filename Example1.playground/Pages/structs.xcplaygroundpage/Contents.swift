
// defining a struct

struct Book{
    //properties
    
    var title: String
    var author: String
    var pages: Int
    var isRead: Bool
    
    //method to mark the book as read
    
    mutating func markAsRead(){
        self.isRead = true
    }
    
    
    //method to display book details
    func displayDetails(){
        let readStatus = isRead ? "Read" : "Not Read"
        print("\(title) by \(author), \(pages) pages - \(readStatus)")
        
    }
}
//creating an instance of the book

var myBook = Book(title: "Swift Programming", author: "Apple Inc", pages: 400, isRead: false)

//Display initial details

myBook.displayDetails()

//mark the book as read
myBook.markAsRead()

//display the updated details
myBook.displayDetails()
