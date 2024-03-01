//
//  HeroesComicsListViewModel.swift
//  IOS_SUPERPODERES_PRACTICA
//
//  Created by Daniel Serrano on 1/3/24.
//

import Foundation
import Combine

class HeroComicsListViewModel: ObservableObject{
    @Published var requestMarvelComics: MarvelResponseComics?
    var suscriptorsComics = Set<AnyCancellable>()

    
    func getComicsList(id: Int){
        
        URLSession.shared
            .dataTaskPublisher(for: NetworkModule().getComicsToApi(id: id) )
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return $0.data
            }
            .decode(type: MarvelResponseComics.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion{
                case.finished:
                    print("Finished")
                    
                case.failure(let errorString):
                    print(errorString)
                }
            } receiveValue: { data in
                self.requestMarvelComics = data
            }
            .store(in: &suscriptorsComics)
        
    }
    
}
