//
//  HeroesListViewTest.swift
//  IOS_SUPERPODERES_PRACTICATests
//
//  Created by Daniel Serrano on 2/3/24.
//

import XCTest
import SwiftUI
import Combine
import ViewInspector

@testable import IOS_SUPERPODERES_PRACTICA

class HeroesListViewModelTest: XCTestCase{
    
    func testHeroesListView()throws{
        let expectation = self.expectation(description: "Descarga de heros")
        var suscriptor = Set<AnyCancellable>()
        
        let vm = HeroesListViewModel(testing: true)
        XCTAssertNotNil(vm)
        vm.heros.publisher
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
        

        vm.loadGetHeroesListTesting()
        self.waitForExpectations(timeout: 10)
        
    }

    
    
}
