//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"
print(greeting)

//: [Next](@next)

//Global Queue - are system given concurent queues


DispatchQueue.global().async{
    print("Doing task in background but on system provided concurrent queue")
}

//DispatchQueue.global(qos: backgrou)


/*
 QOS - Quality of service
 
 1. User interactive
 2. User initiated
 3. Utility
 4. default
 5. Background
 6. Unspecified
 */

//1. user interactive -- for animation or UI related job which will require ui updates for tasks that interact with user and rerequired imediatly

DispatchQueue.global(qos: .userInteractive).async {
    print("any animation or user related job")
}

func playMusic(){
    let queue = DispatchQueue.global(qos: .userInteractive)
    //code to run an immediate, high priority task
    queue.async {
        print("Executing a user-interactive task")
    //For exxample updating an animation state immediately
    }
}

//2. User initiated -  For tasks initiated by the user that are not critical for UI responsiveness but should complete quickly, like loading content after a button press.

func loadImage() {
    DispatchQueue.global(qos: .userInitiated).async {
        // Simulate downloading a large image
        let imageUrl = URL(string: "https://example.com/large-image.jpg")!
        let imageData = try? Data(contentsOf: imageUrl)
        
        // After downloading, update the UI on the main queue
        DispatchQueue.main.async {
            print("check the IF image is present and display it in the UI")
        }
    }
}

//3.  Utility - For long-running tasks that don’t need to be completed immediately but provide progress information, like downloading files or syncing data.

//function to download a file from a url
func downLoadFile(url:URL){
    let task = URLSession.shared.dataTask(with: url){ data, response, error in
        guard let data = data else{
            print("recived error")
            return
        }
    }
    task.resume()
}
// Code for a utility task
DispatchQueue.global(qos: .utility).async {
    downLoadFile(url: URL(string: "https")!)
    //this task will be performed in the main thread for the UI update
    DispatchQueue.main.async {
        print("pop up alert to show file downloaded succesfully")
    }
}

//4 Default -- The default QoS is generally used when no specific priority is set. It falls between userInitiated and utility.
// For example, general tasks that don’t need specific prioritization
DispatchQueue.global(qos: .default).async{
    print("Normal api call")
}


//5. Background -- this are the tasks that are not visible to user like creating backups, indexing your database, restoring some data from seerver or sync your data to the cloud

//For tasks that the user doesn’t directly initiate or care about, like pre-fetching data or performing regular maintenance. These tasks are energy-efficient and run when resources are available.

DispatchQueue.global(qos: .background).async{
    print("Restoring backups")
}

//6. Unspecified -- this is any task that has the list priority

DispatchQueue.global(qos: .unspecified).async{
    print("file writting logic for logger class")
}
