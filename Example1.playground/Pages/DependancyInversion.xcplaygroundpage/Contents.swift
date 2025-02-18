//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

// dependancy injection -- whatever the class needs to perform to perform the functionality, we should be able to pass it from outside insted of hard coding

//1. constructor injection
//2
protocol dataManager{
    func callApi(urlString: String)
}
class WebServiceManager: dataManager {
    func callApi(urlString: String){
        print("getting data from the webservice")
        
    }
}
class DataBaseManager: dataManager{
    func callApi(urlString: String){
        print("getting data from the database")
        
    }
    
}
class ViewControler{
    let webServiceMangaer: dataManager
    var apiURL: String = ""
    
    init(webServiceMangaer: dataManager) {
        self.webServiceMangaer = webServiceMangaer
    }
    func clickBtn() {
        self.webServiceMangaer.callApi(urlString: apiURL)
    }
    
    func callAppi(myUrl: String, productId: Int) {
        self.webServiceMangaer.callApi(urlString: "\(myUrl)\(productId)")
    }
}

let viewControler = ViewControler(webServiceMangaer: WebServiceManager()) // constructor injection

viewControler.apiURL = "https//horfdh" //property injection

viewControler.clickBtn()


viewControler.callAppi(myUrl: "https/jrf", productId: 12) // method injection


