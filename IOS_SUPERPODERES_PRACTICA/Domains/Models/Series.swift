//
//  Comics.swift
//  IOS_SUPERPODERES_PRACTICA
//
//  Created by Daniel Serrano on 29/2/24.
//


import Foundation

// MARK: - MarvelResponsComics
struct MarvelResponseSeries: Codable {
    let code: Int
    let status, copyright, attributionText, attributionHTML: String
    let etag: String
    let data: DataClassSeries
}

// MARK: - DataClass
struct DataClassSeries: Codable {
    let offset, limit, total, count: Int
    let results: [ResultSeries]
}

// MARK: - Result
struct ResultSeries: Codable, Identifiable {
    let id: Int
    let title: String
    let description: String?
    let resourceURI: String
    let urls: [URLElementSeries]
    let startYear, endYear: Int
    let rating: String
    let type: String
    let modified: String
    let thumbnail: ThumbnailSeries
    let creators: CreatorsSeries
    let characters: CharactersSeries
    let stories: StoriesSeries
    let comics, events: CharactersSeries
    let next: NextSeries?
    let previous: previousSeries?
}


// MARK: - Characters
struct CharactersSeries: Codable {
    let available: Int
    let collectionURI: String
    let items: [NextSeries]
    let returned: Int
}

// MARK: - Next
struct NextSeries: Codable {
    let resourceURI: String
    let name: String
}

// MARK: - Creators
struct CreatorsSeries: Codable {
    let available: Int
    let collectionURI: String
    let items: [CreatorsItemSeries]
    let returned: Int
}

// MARK: - CreatorsItem
struct CreatorsItemSeries: Codable {
    let resourceURI: String
    let name: String
    let role: String
}



// MARK: - Stories
struct StoriesSeries: Codable {
    let available: Int
    let collectionURI: String
    let items: [StoriesItemSeries]
    let returned: Int
}

// MARK: - StoriesItem
struct StoriesItemSeries: Codable {
    let resourceURI: String
    let name: String
    let type: String
}


// MARK: - Thumbnail
struct ThumbnailSeries: Codable {
    let path: String
    let thumbnailExtension: String

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}



// MARK: - URLElement
struct URLElementSeries: Codable {
    let type: String
    let url: String
}


struct previousSeries: Codable{
    let resourceURI: String
    let name: String
    
}
