//
//  PasswordChecker.swift
//  Dev-HW5
//
//  Created by Дима on 2/20/25.
//

enum Pages {
    case ToHome, ToLogin, ToRegistration
}

enum ButtonTypes {
    case primary, secondary, danger
}

enum RegisterStatus {
    case ok, existNickname, existEmail
}

enum AuthorizationStatus {
    case ok, wrongPassword, wrongEmail
}

enum UserInfoKeys: Hashable {
    case destinationPage, user
}

struct User {
    var nickname: String
    var name: String? = nil
//    var phone: String?
    var email: String
    var password: String
}
// User = [UserFields: String?]
class UsersManager {
    nonisolated(unsafe) public static let shared = UsersManager()
    
    private var users: [String: User] = [:]//["Dimon" : User(nickname: "Dimon", email: "ru@me.com", password: "1234")]
    private var emailDict: [String: String] = [:]//["ru@me.com": "Dimon"]
//    private var phoneKey: [String: String] = [:]

    
    func add(user: User) -> RegisterStatus {
        if users[user.nickname] != nil {
            return .existNickname
        } else if emailDict[user.email] != nil {
            return .existEmail
        }
        users[user.nickname] = user
        emailDict[user.email] = user.nickname
        
        return .ok
    }
    
    func find(login: String, password: String) -> User? {
        if let user = users[login] {
            return user.password == password ? user : nil
        }
        if let nickname = emailDict[login] {
            return users[nickname]?.password == password ? users[nickname] : nil
        }
        return nil
    }
    private init() {}
}
