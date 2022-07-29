//
//  CharactersAllNetworkDTO.swift
//  joanMarvelMobileTest
//
//  Created by Joan Cremades on 29/7/22.
//

import Foundation

// MARK: - Characters
struct ResultDTO: Codable {
    let status: String
    let copyright: String
    let attributionText: String
    let attributionHTML: String
    let etag: String
    let data: ResultDataDTO
}

// MARK: - DataClass
struct ResultDataDTO: Codable {
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [CharacterDTO]
}

// MARK: - Result
struct CharacterDTO: Codable {
    let id: Int
    let name, resultDescription: String
    let modified: String
    let thumbnail: ThumbnailDTO
    let resourceURI: String
    let comics, series: ComicsDTO
    let stories: StoriesDTO
    let events: ComicsDTO
    let urls: [URLElementDTO]

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case resultDescription = "description"
        case modified
        case thumbnail
        case resourceURI
        case comics
        case series
        case stories
        case events
        case urls
    }
}

// MARK: - Comics
struct ComicsDTO: Codable {
    let available: Int
    let collectionURI: String
    let items: [ComicsItemDTO]
    let returned: Int
}

// MARK: - ComicsItem
struct ComicsItemDTO: Codable {
    let resourceURI: String
    let name: String
}

// MARK: - Stories
struct StoriesDTO: Codable {
    let available: Int
    let collectionURI: String
    let items: [StoriesItemDTO]
    let returned: Int
}

// MARK: - StoriesItem
struct StoriesItemDTO: Codable {
    let resourceURI: String
    let name: String
    let type: String
}

//enum TypeEnumDTO: String, Codable {
//    case cover = "cover"
//    case interiorStory = "interiorStory"
//}

// MARK: - Thumbnail
struct ThumbnailDTO: Codable {
    let path: String
    let thumbnailExtension: String

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

// MARK: - URLElement
struct URLElementDTO: Codable {
    let type: String
    let url: String
}
