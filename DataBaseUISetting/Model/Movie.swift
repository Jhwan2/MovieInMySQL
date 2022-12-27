//
//  Movie.swift
//  DataBaseUISetting
//
//  Created by 이주환 on 2022/11/22.
//

import Foundation

struct Movie{
    let movieName: String?
    let movieDate: Date?
    let movieImgUrl: String?
    let movieAct: String?
}

struct User: Codable {
    let id, password, name, phoneNumber: String
    
    enum CodingKeys: String, CodingKey {
        case id, password, name
        case phoneNumber = "phone number"
    }
}
typealias Users = [User]

