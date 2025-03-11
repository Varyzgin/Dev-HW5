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

enum UserInfoKeys: String, Hashable {
    case destinationPage, user
}

struct User {
    var nickname: String
    var name: String? = nil
//    var phone: String?
    var email: String
    var password: String
    
    func toDictionary() -> [String: String] {
        var dict = [String: String]()
        dict["nickname"] = nickname
        dict["email"] = email
        dict["password"] = password
        if let name = name {
            dict["name"] = name
        }
        return dict
    }
    static func fromDictionary(_ dict: [String: String]) -> User? {
        
        guard let nickname = dict["nickname"],
              let email = dict["email"],
              let password = dict["password"] else {
            return nil
        }
        return User(nickname: nickname, name: dict["name"], email: email, password: password)
    }
}
