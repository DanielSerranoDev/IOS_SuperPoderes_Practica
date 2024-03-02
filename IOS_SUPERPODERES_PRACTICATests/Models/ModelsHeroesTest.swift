//
//  HeroesListViewTest.swift
//  IOS_SUPERPODERES_PRACTICATests
//
//  Created by Daniel Serrano on 2/3/24.
//

import XCTest
import SwiftUI
import Combine

@testable import IOS_SUPERPODERES_PRACTICA

class ModelHeroeViewTest: XCTestCase{
    
    func testModelHeroes() throws {
    
        let heroe = Heroe(
            id: 1011334,
            name: "3-D Man",
            description: "",
            modified: "",
            thumbnail: Thumbnail(
                path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784",
                thumbnailExtension: "jpg"
            ),
            resourceURI: "http://gateway.marvel.com/v1/public/characters/1011334",
            comics: Comics(
                available: 12,
                collectionURI: "http://gateway.marvel.com/v1/public/characters/1011334/comics",
                items: [
                    ComicsItem(
                        resourceURI: "http://gateway.marvel.com/v1/public/comics/21366",
                        name: "Avengers: The Initiative (2007) #14"
                    )
                ],
                returned: 12
            ),
            series: Comics(
                available: 12,
                collectionURI: "http://gateway.marvel.com/v1/public/characters/1011334/comics",
                items: [
                    ComicsItem(
                        resourceURI: "http://gateway.marvel.com/v1/public/comics/21366",
                        name: "Avengers: The Initiative (2007) #14"
                    )
                ],
                returned: 12
            ),
            stories: Stories(
                available: 12,
                collectionURI: "http://gateway.marvel.com/v1/public/characters/1011334/comics",
                items: [
                    StoriesItem(
                        resourceURI: "http://gateway.marvel.com/v1/public/stories/19947",
                        name: "Cover #19947",
                        type: "cover"
                    )
                ],
                returned: 12
            ),
            events: Comics(
                available: 12,
                collectionURI: "http://gateway.marvel.com/v1/public/characters/1011334/comics",
                items: [
                    ComicsItem(
                        resourceURI: "http://gateway.marvel.com/v1/public/comics/21366",
                        name: "Avengers: The Initiative (2007) #14"
                    )
                ],
                returned: 12
            ),
            urls: [
                URLElement(
                    type: "detail",
                    url: "http://marvel.com/characters/74/3-d_man?utm_campaign=apiRef&utm_source=808a8a06bb441aba483dd693f6c3056d"
                )
            ]
        )
        
        let thumbnail = Thumbnail(path: "http://example.com/image", thumbnailExtension: "jpg")
        let comicsItem = ComicsItem(resourceURI: "http://example.com/comics/1", name: "Comic 1")
        let storiesItem = StoriesItem(resourceURI: "http://example.com/stories/1", name: "Story 1", type: "Type 1")
        let urlElement = URLElement(type: "detail", url: "http://example.com/detail")
        
        
        XCTAssertEqual(heroe.id, 1011334)
        XCTAssertEqual(heroe.name, "3-D Man")
        XCTAssertEqual(heroe.description, "")
        XCTAssertEqual(heroe.modified, "")
        XCTAssertEqual(heroe.thumbnail.path, "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784")
        XCTAssertEqual(heroe.thumbnail.thumbnailExtension, "jpg")
        XCTAssertEqual(heroe.resourceURI, "http://gateway.marvel.com/v1/public/characters/1011334")
        XCTAssertEqual(heroe.comics.available, 12)
        XCTAssertEqual(heroe.comics.collectionURI, "http://gateway.marvel.com/v1/public/characters/1011334/comics")
        XCTAssertEqual(heroe.comics.items.count, 1)
        XCTAssertEqual(heroe.comics.items.first?.resourceURI, "http://gateway.marvel.com/v1/public/comics/21366")
        XCTAssertEqual(heroe.comics.items.first?.name, "Avengers: The Initiative (2007) #14")
        XCTAssertEqual(heroe.comics.returned, 12)
        XCTAssertEqual(heroe.series.available, 12)
        XCTAssertEqual(heroe.series.collectionURI, "http://gateway.marvel.com/v1/public/characters/1011334/comics")
        XCTAssertEqual(heroe.series.items.count, 1)
        XCTAssertEqual(heroe.series.items.first?.resourceURI, "http://gateway.marvel.com/v1/public/comics/21366")
        XCTAssertEqual(heroe.series.items.first?.name, "Avengers: The Initiative (2007) #14")
        XCTAssertEqual(heroe.series.returned, 12)
        XCTAssertEqual(heroe.stories.available, 12)
        XCTAssertEqual(heroe.stories.collectionURI, "http://gateway.marvel.com/v1/public/characters/1011334/comics")
        XCTAssertEqual(heroe.stories.items.count, 1)
        XCTAssertEqual(heroe.stories.items.first?.resourceURI, "http://gateway.marvel.com/v1/public/stories/19947")
        XCTAssertEqual(heroe.stories.items.first?.name, "Cover #19947")
        XCTAssertEqual(heroe.stories.items.first?.type, "cover")
        XCTAssertEqual(heroe.stories.returned, 12)
        XCTAssertEqual(heroe.events.available, 12)
        XCTAssertEqual(heroe.events.collectionURI, "http://gateway.marvel.com/v1/public/characters/1011334/comics")
        XCTAssertEqual(heroe.events.items.count, 1)
        XCTAssertEqual(heroe.events.items.first?.resourceURI, "http://gateway.marvel.com/v1/public/comics/21366")
        XCTAssertEqual(heroe.events.items.first?.name, "Avengers: The Initiative (2007) #14")
        XCTAssertEqual(heroe.events.returned, 12)
        XCTAssertEqual(heroe.urls.count, 1)
        XCTAssertEqual(heroe.urls.first?.type, "detail")
        XCTAssertEqual(heroe.urls.first?.url, "http://marvel.com/characters/74/3-d_man?utm_campaign=apiRef&utm_source=808a8a06bb441aba483dd693f6c3056d")
    }
    
    
}
