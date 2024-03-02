//
//  ModelComicsTest.swift
//  IOS_SUPERPODERES_PRACTICATests
//
//  Created by Daniel Serrano on 2/3/24.
//

import XCTest
import SwiftUI
import Combine

@testable import IOS_SUPERPODERES_PRACTICA

class ModelComicsTests: XCTestCase {
    
    func testModelComics() {
        let resultComics = ResultComics(
            id: 123,
            title: "The Amazing Spider-Man",
            issueNumber: 1,
            variantDescription: "Variant Edition",
            description: "Description of the comic",
            modified: "2022-02-24T10:00:00-05:00",
            isbn: "978-1-302-92195-5",
            upc: "75960609202400111",
            diamondCode: "FEB220023",
            ean: "9781302921955",
            issn: "2330-6777",
            format: "Comic",
            pageCount: 32,
            textObjects: [],
            resourceURI: "http://gateway.marvel.com/v1/public/comics/123",
            urls: [],
            series: SeriesComics(
                resourceURI: "http://gateway.marvel.com/v1/public/series/456",
                name: "The Amazing Spider-Man"
            ),
            variants: [],
            collections: nil,
            collectedIssues: nil,
            dates: nil,
            prices: [],
            thumbnail: ThumbnailComics(
                path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784",
                thumbnailExtension: "jpg"
            ),
            images: [],
            creators: CreatorsComics(
                available: 2,
                collectionURI: "http://gateway.marvel.com/v1/public/comics/123/creators",
                items: [],
                returned: 2
            ),
            characters: CharactersComics(
                available: 5,
                collectionURI: "http://gateway.marvel.com/v1/public/comics/123/characters",
                items: [],
                returned: 5
            ),
            stories: StoriesComics(
                available: 1,
                collectionURI: "http://gateway.marvel.com/v1/public/comics/123/stories",
                items: [],
                returned: 1
            ),
            events: CharactersComics(
                available: 0,
                collectionURI: "http://gateway.marvel.com/v1/public/comics/123/events",
                items: [],
                returned: 0
            )
        )
        
        XCTAssertEqual(resultComics.id, 123)
        XCTAssertEqual(resultComics.title, "The Amazing Spider-Man")
        XCTAssertEqual(resultComics.issueNumber, 1)
        XCTAssertEqual(resultComics.variantDescription, "Variant Edition")
        XCTAssertEqual(resultComics.description, "Description of the comic")
        XCTAssertEqual(resultComics.modified, "2022-02-24T10:00:00-05:00")
        XCTAssertEqual(resultComics.isbn, "978-1-302-92195-5")
        XCTAssertEqual(resultComics.upc, "75960609202400111")
        XCTAssertEqual(resultComics.diamondCode, "FEB220023")
        XCTAssertEqual(resultComics.ean, "9781302921955")
        XCTAssertEqual(resultComics.issn, "2330-6777")
        XCTAssertEqual(resultComics.format, "Comic")
        XCTAssertEqual(resultComics.pageCount, 32)
        XCTAssertEqual(resultComics.resourceURI, "http://gateway.marvel.com/v1/public/comics/123")
        XCTAssertEqual(resultComics.urls, [])
        XCTAssertEqual(resultComics.series, SeriesComics(resourceURI: "http://gateway.marvel.com/v1/public/series/456", name: "The Amazing Spider-Man"))
        XCTAssertEqual(resultComics.variants, [])
        XCTAssertNil(resultComics.collections)
        XCTAssertNil(resultComics.collectedIssues)
        XCTAssertNil(resultComics.dates)
        XCTAssertEqual(resultComics.prices, [])
        XCTAssertEqual(resultComics.thumbnail, ThumbnailComics(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", thumbnailExtension: "jpg"))
        XCTAssertEqual(resultComics.images, [])
        XCTAssertEqual(resultComics.creators, CreatorsComics(available: 2, collectionURI: "http://gateway.marvel.com/v1/public/comics/123/creators", items: [], returned: 2))
        XCTAssertEqual(resultComics.characters, CharactersComics(available: 5, collectionURI: "http://gateway.marvel.com/v1/public/comics/123/characters", items: [], returned: 5))
        XCTAssertEqual(resultComics.stories, StoriesComics(available: 1, collectionURI: "http://gateway.marvel.com/v1/public/comics/123/stories", items: [], returned: 1))
        XCTAssertEqual(resultComics.events, CharactersComics(available: 0, collectionURI: "http://gateway.marvel.com/v1/public/comics/123/events", items: [], returned: 0))

    }
}
