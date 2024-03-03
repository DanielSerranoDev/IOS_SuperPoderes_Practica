//
//  ComicsListViewTest.swift
//  IOS_SUPERPODERES_PRACTICATests
//
//  Created by Daniel Serrano on 3/3/24.
//

import XCTest
import SwiftUI
import Combine
import ViewInspector

@testable import IOS_SUPERPODERES_PRACTICA

final class HeroComicsListViewModelTest: XCTestCase {
 
    func testHeroComicsListViewModel()throws{
        let expectation = self.expectation(description: "Descarga de Comics")
        var suscriptor = Set<AnyCancellable>()
        
        let vm = HeroComicsListViewModel()
        XCTAssertNotNil(vm)
        vm.comics.publisher
            .sink { completion in
                switch completion{
                 case .finished:
                     XCTAssertEqual(1, 1) //test OK
                     expectation.fulfill()
                 case .failure:
                     XCTAssertEqual(1, 2) //genero el fallo
                     expectation.fulfill()
                 }
            } receiveValue: { data in
                XCTAssertEqual(1, 1)
            }
            .store(in: &suscriptor)
        

        vm.loadGetComicsListTesting()
        self.waitForExpectations(timeout: 10)
        
    }
}
