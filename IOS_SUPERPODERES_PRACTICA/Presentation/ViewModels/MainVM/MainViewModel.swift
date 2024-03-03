//
//  MainViewModel.swift
//  IOS_SUPERPODERES_PRACTICA
//
//  Created by Daniel Serrano on 27/2/24.
//

import Foundation
import SwiftUI
public let CONST_TOKEN_ID = "TokenKeyAppIOS"

class MainViewModel: ObservableObject{
    @Published var status = Status.login
    @Published var token : String = ""{
        didSet{
            saveKC(key: CONST_TOKEN_ID, value: token)
        }
    }
    
    init(testing: Bool = false){
        if !(testing){
            logControl()
        }

        
    }
    
    func logControl(){
        token = loadKc(key: CONST_TOKEN_ID)
        if token.count > 0 {
            status = .heroesList
        }else{
            status = .login
        }
    }
    
    
    
    
    func fakeLogin(username: String, password: String) ->String{
        if !(username.isEmpty && password.isEmpty){
            //Simulo la carga de la api
            status = Status.loading
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.status = Status.heroesList
            }
            
            token = "tokenfake.sdlkfjklsjfljf"
        }else{
            token = ""
        }
        return token
    }
    
    
    
    
}
