//
//  Singleton.swift
//  Dev-HW5
//
//  Created by Дима on 2/17/25.
//

final class PersonalData {
    public var name: String?
    public var email: String?
    public var password: String?
    
    public static let shared = PersonalData()
}
