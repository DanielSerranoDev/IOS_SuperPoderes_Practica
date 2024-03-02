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

    func testUIViews()throws{
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

}
