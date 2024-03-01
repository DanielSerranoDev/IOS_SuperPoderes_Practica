//
//  HeroesListViewModel.swift
//  IOS_SUPERPODERES_PRACTICA
//
//  Created by Daniel Serrano on 21/2/24.
//

import Foundation
import Combine


class HeroesListViewModel: ObservableObject{
    @Published var status = Status.heroesList
    @Published var requestMarvelHeros: MarvelResponseHeros?
    var suscriptors = Set<AnyCancellable>()
    @Published var loggedOut: Bool = false
    
    init(){
        getHeroesList()
    }
  
    func getHeroesList(){
        status = .loading
        
        URLSession.shared
            .dataTaskPublisher(for: NetworkModule().getHeroesToApi() )
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    
                    throw URLError(.badServerResponse)
                }
                return $0.data
            }
            .decode(type: MarvelResponseHeros.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion{
                case.finished:
                    self.status = Status.heroesList
                    
                case.failure(let errorString):
                    self.status = Status.error(error: "error")
                }
            } receiveValue: { data in
                self.requestMarvelHeros = data
            }
            .store(in: &suscriptors)
    }

    func logOut(){
        loggedOut = true
        deleteKC(key: CONST_TOKEN_ID)
        LoginView()
        
        
        
    }
}
