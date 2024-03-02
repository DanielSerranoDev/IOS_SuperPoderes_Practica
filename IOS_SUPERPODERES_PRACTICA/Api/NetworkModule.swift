//
//  ApiProvider.swift
//  IOS_SUPERPODERES_PRACTICA
//
//  Created by Daniel Serrano on 21/2/24.
//

import Foundation
import Combine

private let Base_URL = "https://gateway.marvel.com/v1/public/characters"

let apikey = "4d72502ffbd31d392959cf1d389e69f3"
let privatekey = "7350a2bcb6561e5344b2a1f93f31f0af26ae1e7a"
let hash = "f9ee188b78e178164a3a95b0f22618c5"

//private let apikey = "f3603d6d0330a129071bf9dfa05b49ca"
//private let hash = "0864ea25976921785806d9e08ba4c893"
private let timestamp = "1"
private let securData = "apikey=\(apikey)&hash=\(hash)&ts=\(timestamp)"

enum chainPoint: String{
    case characters = "?&limit=10&offset=80&"
    case comics = "comics?"
    case series = "series?"
    
}

struct HTTPMethods {
    static let post = "POST"
    static let get = "GET"
    static let put = "PUT"
    static let delete = "DELETE"
    static let content = "application/json"
}


//extension de URLResponse
extension URLResponse {
    func getStatusCode() -> Int? {
        if let httpResponse = self as? HTTPURLResponse {
            return httpResponse.statusCode
        }
        return nil
    }
}

final class NetworkModule{
    
    func getHeroesToApi()-> URLRequest{
        
        let urlString = "\(Base_URL)\(chainPoint.characters.rawValue)\(securData)"
        var request: URLRequest = URLRequest(url: URL(string: urlString)!)
        request.httpMethod = HTTPMethods.get
        request.addValue(HTTPMethods.content, forHTTPHeaderField: "Content-type")
        return request
        
    }
    
    func getComicsToApi(id: Int)-> URLRequest{
        let id = id
        let urlString = "\(Base_URL)/\(id)/\(chainPoint.comics.rawValue)\(securData)"
        var request: URLRequest = URLRequest(url: URL(string: urlString)!)
        
        request.httpMethod = HTTPMethods.get
        request.addValue(HTTPMethods.content, forHTTPHeaderField: "Content-type")
        return request
        
    }
    
    func getSeriesToApi(id: Int)-> URLRequest{
        let id = id
        let urlString = "\(Base_URL)/\(id)/\(chainPoint.series.rawValue)\(securData)"
        var request: URLRequest = URLRequest(url: URL(string: urlString)!)
        request.httpMethod = HTTPMethods.get
        request.addValue(HTTPMethods.content, forHTTPHeaderField: "Content-type")
        
        return request
        
    }
}

