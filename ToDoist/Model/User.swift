//
//  User.swift
//  ToDoist
//
//  Created by Anton on 16.04.2021.
//

class User {
    var login = ""
    var password = ""
    
    var users: [User] = []
    
    
    init(login: String, password: String) {
        self.login = login
        self.password = password
    }
    
    func getUser() -> [User] {
        users
    }
    
    func createdUser(login: String, password: String) {
        users.append(User(login: login, password: password))
//        users.append(newUser)
    }
    
}
