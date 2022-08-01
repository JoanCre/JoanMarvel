//
//  SeriesDTO.swift
//  joanMarvelMobileTest
//
//  Created by Joan Cremades on 31/7/22.
//

import Foundation

// MARK: - Welcome
struct ResultSeriesDTO: Codable {
    let code: Int
    let status: String
    let copyright: String
    let attributionText: String
    let attributionHTML: String
    let etag: String
    let data: SerieDataDTO
}

// MARK: - DataClass
struct SerieDataDTO: Codable {
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [SeriesDTO]
}

// MARK: - Result
struct SeriesDTO: Codable {
    let id: Int
    let title: String
    let resultDescription: String?
    let resourceURI: String
    let urls: [URLElement]
    let startYear, endYear: Int
    let rating, type: String
    let modified: String
    let thumbnail: Thumbnail
    let creators: Creators
    let characters: Characters
    let stories: Stories
    let comics, events: Characters
    let next, previous: Next?

    enum CodingKeys: String, CodingKey {
        case id, title
        case resultDescription = "description"
        case resourceURI
        case urls
        case startYear
        case endYear
        case rating
        case type
        case modified
        case thumbnail
        case creators
        case characters
        case stories
        case comics
        case events
        case next
        case previous
    }
}

// MARK: - Characters
struct Characters: Codable {
    let available: Int
    let collectionURI: String
    let items: [Next]
    let returned: Int
}

// MARK: - Next
struct Next: Codable {
    let resourceURI: String
    let name: String
}

// MARK: - Creators
struct Creators: Codable {
    let available: Int
    let collectionURI: String
    let items: [CreatorsItem]
    let returned: Int
}

// MARK: - CreatorsItem
struct CreatorsItem: Codable {
    let resourceURI: String
    let name, role: String
}

// MARK: - Stories
struct Stories: Codable {
    let available: Int
    let collectionURI: String
    let items: [StoriesItem]
    let returned: Int
}

// MARK: - StoriesItem
struct StoriesItem: Codable {
    let resourceURI: String
    let name: String
    let type: String
}

// MARK: - Thumbnail
struct Thumbnail: Codable {
    let path: String
    let thumbnailExtension: String

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

// MARK: - URLElement
struct URLElement: Codable {
    let type: String
    let url: String
}

