//
//  UsersManager.swift
//  Dev-HW5
//
//  Created by Дима on 3/6/25.
//

final class UsersManager {
    nonisolated(unsafe) public static let shared = UsersManager()
    
    private var users: [String: User] = ["Dima" : User(nickname: "Dima", email: "Dima", password: "Dima")]
    private var emailDict: [String: String] = ["Dima": "Dima"]
//    private var phoneKey: [String: String] = [:]

    
    public func add(user: User) -> RegisterStatus {
        if users[user.nickname] != nil {
            return .existNickname
        } else if emailDict[user.email] != nil {
            return .existEmail
        }
        users[user.nickname] = user
        emailDict[user.email] = user.nickname
        
        return .ok
    }
    
    public func find(login: String, password: String) -> User? {
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
