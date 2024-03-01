//
//  KeyChain.swift
//  IOS_SUPERPODERES_PRACTICA
//
//  Created by Daniel Serrano on 28/2/24.
//

import Foundation
import KeychainSwift

@discardableResult
func saveKC(key: String, value: String)-> Bool{
    if let data = value.data(using: .utf8){
        return KeychainSwift().set(data, forKey: key)
    }else{
        return false
    }
}
@discardableResult
func loadKc(key: String)->String{
    if let data = KeychainSwift().get(key){
        return data
    }else{
        return ""
    }
    
}

@discardableResult
func deleteKC(key: String)-> Bool{
    KeychainSwift().delete(key)
}
