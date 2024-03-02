//
//  ModelSeriesTest.swift
//  IOS_SUPERPODERES_PRACTICATests
//
//  Created by Daniel Serrano on 2/3/24.
//

import XCTest
import SwiftUI
import Combine

@testable import IOS_SUPERPODERES_PRACTICA

class ModelSeriesTests: XCTestCase {
    
    func testModelSeries() {
        let resultSeries = ResultSeries(
            id: 123,
            title: "The Amazing Spider-Man",
            description: nil,
            resourceURI: "http://gateway.marvel.com/v1/public/series/123",
            urls: [],
            startYear: 1963,
            endYear: 2018,
            rating: "Rated T",
            type: "ongoing",
            modified: "2014-03-19T14:15:04-0400",
            thumbnail: ThumbnailSeries(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", thumbnailExtension: "jpg"),
            creators: CreatorsSeries(available: 2, collectionURI: "http://gateway.marvel.com/v1/public/series/123/creators", items: [], returned: 2),
            characters: CharactersSeries(available: 5, collectionURI: "http://gateway.marvel.com/v1/public/series/123/characters", items: [], returned: 5),
            stories: StoriesSeries(available: 1, collectionURI: "http://gateway.marvel.com/v1/public/series/123/stories", items: [], returned: 1),
            comics: CharactersSeries(available: 5, collectionURI: "http://gateway.marvel.com/v1/public/series/123/comics", items: [], returned: 5),
            events: CharactersSeries(available: 0, collectionURI: "http://gateway.marvel.com/v1/public/series/123/events", items: [], returned: 0),
            next: nil,
            previous: nil
        )
        
        XCTAssertEqual(resultSeries.id, 123)
        XCTAssertEqual(resultSeries.title, "The Amazing Spider-Man")
        XCTAssertNil(resultSeries.description)
        XCTAssertEqual(resultSeries.resourceURI, "http://gateway.marvel.com/v1/public/series/123")
        XCTAssertEqual(resultSeries.urls, [])
        XCTAssertEqual(resultSeries.startYear, 1963)
        XCTAssertEqual(resultSeries.endYear, 2018)
        XCTAssertEqual(resultSeries.rating, "Rated T")
        XCTAssertEqual(resultSeries.type, "ongoing")
        XCTAssertEqual(resultSeries.modified, "2014-03-19T14:15:04-0400")
        XCTAssertEqual(resultSeries.thumbnail, ThumbnailSeries(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", thumbnailExtension: "jpg"))
        XCTAssertEqual(resultSeries.creators, CreatorsSeries(available: 2, collectionURI: "http://gateway.marvel.com/v1/public/series/123/creators", items: [], returned: 2))
        XCTAssertEqual(resultSeries.characters, CharactersSeries(available: 5, collectionURI: "http://gateway.marvel.com/v1/public/series/123/characters", items: [], returned: 5))
        XCTAssertEqual(resultSeries.stories, StoriesSeries(available: 1, collectionURI: "http://gateway.marvel.com/v1/public/series/123/stories", items: [], returned: 1))
        XCTAssertEqual(resultSeries.comics, CharactersSeries(available: 5, collectionURI: "http://gateway.marvel.com/v1/public/series/123/comics", items: [], returned: 5))
        XCTAssertEqual(resultSeries.events, CharactersSeries(available: 0, collectionURI: "http://gateway.marvel.com/v1/public/series/123/events", items: [], returned: 0))
        XCTAssertNil(resultSeries.next)
        XCTAssertNil(resultSeries.previous)
    }
    
}
