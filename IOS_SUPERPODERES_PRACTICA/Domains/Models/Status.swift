//
//  Status.swift
//  IOS_SUPERPODERES_PRACTICA
//
//  Created by Daniel Serrano on 26/2/24.
//

import Foundation

import Foundation

enum Status: Equatable {
    case login, heroesList, loading, error(error: String)
}
