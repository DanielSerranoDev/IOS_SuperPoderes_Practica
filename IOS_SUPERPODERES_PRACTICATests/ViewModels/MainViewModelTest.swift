//
//  MainViewModelTest.swift
//  IOS_SUPERPODERES_PRACTICATests
//
//  Created by Daniel Serrano on 2/3/24.
//

import XCTest
import SwiftUI
import Combine

@testable import IOS_SUPERPODERES_PRACTICA

class MainViewModelTests: XCTestCase {
    
    
    func testLogControlWithToken()throws{
        // Arrange
        let viewModel = MainViewModel() 
        let mockToken = "mockToken123"
        
        // Act
        viewModel.token = mockToken
        viewModel.logControl()
        
        // Assert
        XCTAssertEqual(viewModel.status, Status.heroesList, "El estado debería ser 'heroesList' cuando hay un token válido.")
    }
    
    func testLogControlWithoutToken()throws{
        // Arrange
        let viewModel = MainViewModel()
        let mockEmptyToken = ""
        
        // Act
        viewModel.token = mockEmptyToken
        viewModel.logControl()
        
        // Assert
        XCTAssertEqual(viewModel.status, Status.login, "El estado debería ser 'login' cuando no hay un token válido.")
    }
    
    
    
    func testFakeLoginWithValidCredentials()throws {
        // Arrange
        let viewModel = MainViewModel()
        
        // Act
        let token = viewModel.fakeLogin(username: "example@gmail.com", password: "123456")
        
        // Assert
        XCTAssertEqual(token, "tokenfake.sdlkfjklsjfljf", "El token generado debe ser 'tokenfake.sdlkfjklsjfljf' para credenciales válidas.")
    }
    
    func testFakeLoginWithEmptyCredentials()throws {
        // Arrange
        let viewModel = MainViewModel()
        
        // Act
        let token = viewModel.fakeLogin(username: "", password: "")
        
        // Assert
        XCTAssertEqual(token, "", "El token generado debe ser una cadena vacía para credenciales vacías.")
    }
}
