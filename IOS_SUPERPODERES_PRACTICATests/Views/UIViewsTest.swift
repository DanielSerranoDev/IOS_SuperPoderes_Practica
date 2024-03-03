//
//  UIViewsTest.swift
//  IOS_SUPERPODERES_PRACTICATests
//
//  Created by Daniel Serrano on 2/3/24.
//

import XCTest
import SwiftUI
import Combine
import ViewInspector

@testable import IOS_SUPERPODERES_PRACTICA

final class UIViewsTest: XCTestCase {

    func testUILoginView()throws{
        let view = LoginView()
            .environmentObject(MainViewModel(testing: true))
        XCTAssertNotNil(view)
        
        let NumbItems = try view.inspect().count
        XCTAssertEqual(NumbItems, 1)
        
        let img = try view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(img)
        
        let textField = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(textField)
        
        let text = try view.inspect().find(viewWithId: 3)
        XCTAssertNotNil(text)
        let text0 = try text.text().string()
        XCTAssertEqual(text0, "Login")

        let botom = try view.inspect().find(viewWithId: 4)
        XCTAssertNotNil(botom)
        try botom.button().tap()

    }
    
    func testUIHeroesListView()throws{
        let view = HeroesListView()
            .environmentObject(HeroesListViewModel())
        XCTAssertNotNil(view)
        
        let NumbItems = try view.inspect().count
        XCTAssertEqual(NumbItems, 1)
        
        let img = try view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(img)
        
        let text = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(text)
        let text0 = try text.text().string()
        XCTAssertEqual(text0, "logout")
        
        let botom = try view.inspect().find(viewWithId: 2)
        XCTAssertNotNil(botom)
        try botom.button().tap()

    }
    
    func testHeroDetailScreen()throws{


        let hero = Heroe(
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
        let hero2 = HeroesListViewModel().getHerosMock().first!
        
        let view = HeroDetailScreen(hero: hero2)
            .environmentObject(HeroComicsListViewModel())
            .environmentObject(HeroSeriesListViewModel())
        XCTAssertNotNil(view)
        
        let img = try view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(img)
        
        let text = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(text)

        let textString = try text.text().string()
        XCTAssertEqual(textString, "3-D Man")

    }
    

}
