//
//  HeroesSeriesListViewModel.swift
//  IOS_SUPERPODERES_PRACTICA
//
//  Created by Daniel Serrano on 1/3/24.
//

import Foundation
import Combine

class HeroSeriesListViewModel: ObservableObject{
    @Published var requestMarvelSeries: MarvelResponseSeries?
    var suscriptorsSeries = Set<AnyCancellable>()

    
    func getSeriesList(id: Int){
        
        URLSession.shared
            .dataTaskPublisher(for: NetworkModule().getSeriesToApi(id: id) )
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return $0.data
            }
            .decode(type: MarvelResponseSeries.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion{
                case.finished:
                    print("Finished")
                    
                case.failure(let errorString):
                    print(errorString)
                }
            } receiveValue: { data in
                self.requestMarvelSeries = data
            }
            .store(in: &suscriptorsSeries)
        
    }
    
}
