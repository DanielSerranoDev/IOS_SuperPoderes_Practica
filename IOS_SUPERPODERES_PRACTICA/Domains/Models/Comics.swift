//
//  Comics.swift
//  IOS_SUPERPODERES_PRACTICA
//
//  Created by Daniel Serrano on 29/2/24.
//


import Foundation

// MARK: - MarvelResponsComics
struct MarvelResponseComics: Codable {
    let code: Int
    let status, copyright, attributionText, attributionHTML: String
    let etag: String
    let data: DataClassComics
}

// MARK: - DataClass
struct DataClassComics: Codable {
    let offset, limit, total, count: Int
    let results: [ResultComics]
}

// MARK: - Result
struct ResultComics: Codable, Identifiable {
    let id: Int
    let title: String
    let issueNumber: Int
    let variantDescription: String
    let description: String?
    let modified: String?
    let isbn, upc, diamondCode, ean: String
    let issn: String
    let format: String
    let pageCount: Int
    let textObjects: [TextObjectComics]
    let resourceURI: String
    let urls: [URLElementComics]
    let series: SeriesComics
    let variants: [SeriesComics]
    let collections: [collectionsSeries]?
    let collectedIssues: [collectionsSeries]?
    let dates: [DateElementComics]?
    let prices: [PriceComics]
    let thumbnail: ThumbnailComics
    let images: [ThumbnailComics]
    let creators: CreatorsComics
    let characters: CharactersComics
    let stories: StoriesComics
    let events: CharactersComics

}

struct collectionsSeries: Codable{
    let resourceURI: String
    let name: String
    
}

// MARK: - Characters
struct CharactersComics: Codable {
    let available: Int
    let collectionURI: String
    let items: [SeriesComics]
    let returned: Int
}

// MARK: - Series
struct SeriesComics: Codable {
    let resourceURI: String
    let name: String
}

// MARK: - Creators
struct CreatorsComics: Codable {
    let available: Int
    let collectionURI: String
    let items: [CreatorsItemComics]
    let returned: Int
}

// MARK: - CreatorsItem
struct CreatorsItemComics: Codable {
    let resourceURI: String
    let name: String
    let role: String
}


// MARK: - DateElement
struct DateElementComics: Codable {
    let type: String
    let date: String
}


enum FormatComics: String, Codable {
    case comic = "Comic"
    case digitalVerticalComic = "Digital Vertical Comic"
    case hardcover = "Hardcover"
    case tradePaperback = "Trade Paperback"
}

// MARK: - Thumbnail
struct ThumbnailComics: Codable {
    let path: String
    let thumbnailExtension: String

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

enum ExtensionComics: String, Codable {
    case jpg = "jpg"
}

enum IssnComics: String, Codable {
    case empty = ""
    case the23306777 = "2330-6777"
}

// MARK: - Price
struct PriceComics: Codable {
    let type: PriceTypeComics
    let price: Double
}

enum PriceTypeComics: String, Codable {
    case digitalPurchasePrice = "digitalPurchasePrice"
    case printPrice = "printPrice"
}

// MARK: - Stories
struct StoriesComics: Codable {
    let available: Int
    let collectionURI: String
    let items: [StoriesItem]
    let returned: Int
}

// MARK: - StoriesItem
struct StoriesItemComics: Codable {
    let resourceURI: String
    let name: String
    let type: ItemTypeComics
}

enum ItemTypeComics: String, Codable {
    case cover = "cover"
    case interiorStory = "interiorStory"
}

// MARK: - TextObject
struct TextObjectComics: Codable {
    let type, language, text: String
}

// MARK: - URLElement
struct URLElementComics: Codable {
    let type: URLTypeComics
    let url: String
}

enum URLTypeComics: String, Codable {
    case detail = "detail"
    case inAppLink = "inAppLink"
    case purchase = "purchase"
    case reader = "reader"
}

