//
//  UsersManager.swift
//  Dev-HW5
//
//  Created by Дима on 3/6/25.
//

import Foundation

final class UsersManager {
    nonisolated(unsafe) public static let shared = UsersManager()
    
    private let url = FileManager.default.urls(for: .documentDirectory, in: .allDomainsMask).first!
    
    private var users: [String: User] = [:] //["Dima" : User(nickname: "Dima", email: "Dima", password: "Dima")]
    private var emailDict: [String: String] = ["Dima": "Dima"]
//    private var phoneKey: [String: String] = [:]

    
    public func add(user: User, photo: Data?) -> RegisterStatus {
        if users[user.nickname] != nil {
            return .existNickname
        } else if emailDict[user.email] != nil {
            return .existEmail
        }
        users[user.nickname] = user
        emailDict[user.email] = user.nickname
        
        do {
            print(url)
            let usersUrl = url.appending(path: "/UsersStorage")
            try? FileManager.default.createDirectory(at: usersUrl, withIntermediateDirectories: true)
//            
//            let jsonDataUrl = usersUrl.appending(path: "users.json")
//            let jsonData = try JSONEncoder().encode(users)
//            try? jsonData.write(to: jsonDataUrl)
//            
//            let jsonEmailsUrl = usersUrl.appending(path: "emailDict.json")
//            let jsonEmailsData = try JSONEncoder().encode(emailDict)
//            try? jsonEmailsData.write(to: jsonEmailsUrl)
            
            let photoPath = usersUrl.appending(path: "\(user.nickname).jpeg")
            try? photo?.write(to: photoPath)
            
        } catch {
            print("Error saving data")
        }
        
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
