//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

// dependancy injection -- whatever the class needs to perform to perform the functionality, we should be able to pass it from outside insted of hard coding

//1. constructor injection
//2
class WebServiceManager{
    func callApi(ursString: String){
//        print("getting data from webservice manager")
        
    }
}
//class ViewControler{
//    let webServiceMangaer: WebServiceManager
//    var apiURL: String = ""
//    
//    init(webServiceMangaer: WebServiceManager) {
//        self.webServiceMangaer = webServiceMangaer
//    }
//    func clickBtn() {
//        self.webServiceMangaer.callApi(ursString: apiURL)
//    }
//    
//    func callAppi(myUrl: String, productId: Int) {
//        self.webServiceMangaer.callApi(ursString: "\(myUrl)\(productId)")
//    }
//}
//
//let viewControler = ViewControler(webServiceMangaer: WebServiceManager()) // constructor injection
//
//viewControler.apiURL = "https//horfdh" //property injection
//
//viewControler.clickBtn()
//
//
//viewControler.callAppi(myUrl: "https/jrf", productId: 12) // method injection


//EXAMPLE 2 USING DEPENDENCY INJECTION
//Constructor injection

//CREATING A PROTOCAL DATA SERICE MANAGER
protocol DataServiceManager{
    func fetchData() -> [String]
}

//CLASS REMOTE DATA SERVICE THAT CONFORMS TO THE PROTOCAL DATA SERVICE MANAGER
// FOR A CLASS TO CONFORM WITH A PROTOCAL IT HAS TO IMPLIMENT ALL THE FUNCTIONALITY THAT THE PROTOCAL DEFINES
class RemoteDataService: DataServiceManager{
    func fetchData() -> [String] {
        return ["Data1", "Data2", "Data3"]
    }
    
}
/*
CLASS DATA VIEW CONTROLLER THAT HAS A PRIVATE PROPERTY THAT IS DEPENDENT ON DATASERVICE MANAGER PROTOCOL AND THE CONCRETE IMPLEMENTATION OF REMOTE DATA SERVICE IS INJECTED THROUGH THE CONSTRUCTOR
 */
class DataViewControler{
    private let dataService: DataServiceManager
    
    init(dataService: DataServiceManager) {
        self.dataService = dataService
    }
    
    func fetchData() -> [String] {
        return dataService.fetchData()
    }
}

let remoteDataService = RemoteDataService()

let dataViewControler = DataViewControler(dataService: remoteDataService) // CONSTRUCTOR INJECTION

let data = dataViewControler.fetchData()

//print("The data got from the remote data is \(data)")

//Example 3
//Property injection

protocol NetworkingService{
    func fetchData(completion:@Sendable  @escaping ([ String ]?) -> Void)  
}

class ApiNetworkingService : NetworkingService{
    func fetchData(completion: @Sendable @escaping ([ String ]?)-> Void ) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5){
            completion(["Result1", "Result2", "Result3"])
        }
    }
}

class DataManager{
    var networkingService: NetworkingService? //property injection
    
    func fetchAndProcessData(){
        
        networkingService?.fetchData{ [weak self] data in
            print("Fetched data: ", data ?? "No data")
            
        }
    }
}

let apiNetworkingService = ApiNetworkingService()
let dataManager = DataManager()

dataManager.networkingService = apiNetworkingService
dataManager.fetchAndProcessData()


//EXAMPLE 3 -- METHOD INJECTION


class ViewControler{
    func loadData(dataService: RemoteDataService) -> [String]{
         return dataService.fetchData()
    }
}

let viewControler = ViewControler()



//let data4 = veiwControler.loadData(dataService: RemoteDataService())

let data5 = viewControler.loadData(dataService: RemoteDataService())

print(data5)



