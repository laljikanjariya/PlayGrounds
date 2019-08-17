import UIKit

class UserPageData : Codable & NSObject {
    var page : Int?
    var perPage : Int?
    var total : Int?
    var total_pages : Int?
    var userListData : [UserListData]?
    
    enum CodingKeys: String, CodingKey {
        case perPage = "per_page"
        case userListData = "data"
        case page, total, total_pages
    }
//    override init() {
//    }
}
class UserListData : Codable {
    let id : Int
    let email : String
    let firstName : String
    let lastName : String
    let avatar : URL
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case id, email, avatar
    }
}
struct ImgeLisrData : Codable {
    let albumId : Int?
    let id : Int?
    let title : String?
    let url : URL?
    let thumbnailUrl : URL?
}

//URL 1

let url1 = URL(string: "https://reqres.in/api/users?page=2")!
let jsonData1 = try! Data(contentsOf: url1)

if let jsonModelDecode1 = try? JSONDecoder().decode(UserPageData.self, from: jsonData1) {
    print("Page Detail", jsonModelDecode1.page as Any)
    print("User Detail", jsonModelDecode1.total_pages as Any)
    for element in jsonModelDecode1.userListData! {
        print(element.firstName)
    }

    let jsonModelDecodestring = try JSONEncoder().encode(jsonModelDecode1)
    print("============================================")
    print(NSString.init(data: jsonModelDecodestring, encoding: String.Encoding.utf8.rawValue)! )
    print("============================================")
}

//URL 2
//var asd :UserPageData = UserPageData()
//asd.page = 1
//asd.perPage = 122
//asd.total_pages = 143
//let jsonModelDecodestring = try JSONEncoder().encode(asd)
//print("============================================")
//print(NSString.init(data: jsonModelDecodestring, encoding: String.Encoding.utf8.rawValue)! )
//print("============================================")

let url2 = URL(string: "https://jsonplaceholder.typicode.com/photos")!
let jsonDataDecode2 = try! Data(contentsOf: url2)

if let jsonModel2 = try? JSONDecoder().decode([ImgeLisrData].self, from: jsonDataDecode2) {
    print(jsonModel2.first?.title ?? "Null value")
    print(jsonModel2.last?.title ?? "Null value")

    let jsonModelDecodestring = try JSONEncoder().encode(jsonModel2)
    print("============================================")
    print(NSString.init(data: jsonModelDecodestring, encoding: String.Encoding.utf8.rawValue)!)
    print("============================================")
}


