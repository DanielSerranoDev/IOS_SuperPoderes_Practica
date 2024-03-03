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
    @Published var series: [ResultSeries] = []

    
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

    func getSeriesTesting() {
        self.series = getSeriesMock()
    }
    
    func getSeriesMock()-> [ResultSeries]{
        let serie = ResultSeries(
            id: 3614,
            title: "Age of Apocalypse: The Chosen (1995)",
            description: "",
            resourceURI: "http://gateway.marvel.com/v1/public/series/3614",
            urls: [URLElementSeries(
                type: "detail",
                url:"http://marvel.com/comics/series/3614/age_of_apocalypse_the_chosen_1995?utm_campaign=apiRef&utm_source=4d72502ffbd31d392959cf1d389e69f3")],
            startYear: 1995,
            endYear: 1995,
            rating: "",
            type: "",
            modified: "2020-08-24T12:51:02-0400",
            thumbnail: ThumbnailSeries(
                path: "http://i.annihil.us/u/prod/marvel/i/mg/2/00/4bad2bdd3c8a9",
                thumbnailExtension: "jpg"), 
            creators: CreatorsSeries(
                available: 16,
                collectionURI: "http://gateway.marvel.com/v1/public/series/3614/creators",
                items: [CreatorsItemSeries(
                    resourceURI: "http://gateway.marvel.com/v1/public/creators/11063",
                    name: "Terry Kevin Austin",
                    role: "inker")],
                returned: 16),
                characters: CharactersSeries(
                    available: 13,
                    collectionURI: "http://gateway.marvel.com/v1/public/series/3614/characters", 
                    items: [NextSeries(
                        resourceURI: "http://gateway.marvel.com/v1/public/characters/1009159",
                        name: "Archangel")],
                    returned: 13),
                stories: StoriesSeries(
                available: 24,
                collectionURI: "http://gateway.marvel.com/v1/public/series/3614/stories",
                items: [StoriesItemSeries(
                    resourceURI: "http://gateway.marvel.com/v1/public/stories/37492",
                    name: "",
                    type: "")],
                returned: 24),
                comics: CharactersSeries(available: 1, collectionURI: "http://gateway.marvel.com/v1/public/series/3614/comics", items: [NextSeries(resourceURI: "http://gateway.marvel.com/v1/public/comics/17701", name: "Age of Apocalypse: The Chosen (1995) #1")], returned: 1),
            events: CharactersSeries(
                available: 1,
                collectionURI: "http://gateway.marvel.com/v1/public/series/3614/events",
                items: [NextSeries(
                    resourceURI: "http://gateway.marvel.com/v1/public/events/227",
                    name: "Age of Apocalypse")],
                returned: 1),
            next: nil, 
            previous: nil)
        let data = MarvelResponseSeries(
            code: 0,
            status: "",
            copyright: "",
            attributionText: "",
            attributionHTML: "",
            etag: "",
            data: DataClassSeries(
                offset: 0,
                limit: 0,
                total: 0,
                count: 0,
                results: [serie, serie]
            )
        )
        return data.data.results
    }
    
    func loadGetSeriesListTesting(){
        let b1 = getSeriesMock()

        
        self.series = b1
    }
}
