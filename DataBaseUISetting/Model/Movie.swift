//
//  Movie.swift
//  DataBaseUISetting
//
//  Created by 이주환 on 2022/11/22.
//

import Foundation

struct Movie: Codable {
    let movieNumber, actor, releaseDate, movieTitle: String
    let director, ageLimit: String

    enum CodingKeys: String, CodingKey {
        case movieNumber = "movie number"
        case actor
        case releaseDate = "release date"
        case movieTitle = "movie title"
        case director
        case ageLimit = "age limit"
    }
}
typealias Movies = [Movie]

struct User: Codable {
    let id, password, name, phoneNumber: String
    
    enum CodingKeys: String, CodingKey {
        case id, password, name
        case phoneNumber = "phone number"
    }
}
typealias Users = [User]

