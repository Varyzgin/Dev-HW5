//
//  PasswordChecker.swift
//  Dev-HW5
//
//  Created by Дима on 2/20/25.
//


enum Pages: Hashable {
    case ToHome, ToLogin, ToRegistration
}

enum UserFields: Hashable {
    case nickname, name, email, password
}

struct User {
    let nickname: String
    let name: String? = nil
//    let phone: String?
    let email: String
    let password: String
}
class UsersManager {
    nonisolated(unsafe) public static let shared = UsersManager()
    
    private var users: [String: User] = [:]//["Dimon" : User(nickname: "Dimon", email: "ru@me.com", password: "1234")]
    private var emailDict: [String: String] = [:]//["ru@me.com": "Dimon"]
//    private var phoneKey: [String: String] = [:]

    
    func add(nickname: String, email: String, password: String) -> Bool {
        if users[nickname] != nil || emailDict[email] != nil {
            return false
        }
        users[nickname] = User(nickname: nickname, email: email, password: password)
        emailDict[email] = nickname
        
        return true
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
