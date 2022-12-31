//
//  Movie.swift
//  DataBaseUISetting
//
//  Created by 이주환 on 2022/11/22.
//
//scedule
import Foundation

struct Movie: Codable {
    let actor, releaseDate ,director ,ageLimit: String?
    let movieNumber, movieTitle: String

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

struct Cinema: Codable {
    let movieCinemaNumber, location, phoneNumber, movieCinemaName: String?

    enum CodingKeys: String, CodingKey {
        case movieCinemaNumber, location
        case phoneNumber = "phone number"
        case movieCinemaName
    }
}
typealias Cinemas = [Cinema]

struct Time: Codable {
    let screeningScheduleNumber, screeningDate, movietheater, movieNum: String?
    let cinemaNum: String?

    enum CodingKeys: String, CodingKey {
        case screeningScheduleNumber = "Screening schedule number"
        case screeningDate = "Screening date"
        case movietheater, movieNum
        case cinemaNum = "CinemaNum"
    }
}
typealias Times = [Time]
