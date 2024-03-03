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
    @Published var comics: [ResultComics] = []

    
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
                print(data.data.results)
            }
            .store(in: &suscriptorsComics)
        
    }
    
    func getComicTesting() {
        self.comics = getComicsMock()
    }
    
    func getComicsMock()-> [ResultComics]{
        let comic = ResultComics(
            id: 98690,
            title: "Marauders (2022) #8",
            issueNumber: 8,
            variantDescription: "",
            description: "Here Comes Yesterday — Part 2! The Marauders go where no Krakoan has gone before! Back, at last, to the first mutant society ever! Kate Pryde might be allergic to the word “no,” but can her crew really save the past without destroying the present? And as the Marauders plan to rescue yesterday, the Threshold Three run free today! But can Krakoa survive the experience?",
            modified: "2023-08-23T12:18:37-0400",
            isbn: "",
            upc: "75960620278200811",
            diamondCode: "",
            ean: "",
            issn: "",
            format: "Comic",
            pageCount: 32,
            textObjects: [],
            resourceURI: "http://gateway.marvel.com/v1/public/comics/98690",
            urls: [
                URLElementComics(
                    type: "detail",
                    url: "http://marvel.com/comics/issue/98690/marauders_2022_8?utm_campaign=apiRef&utm_source=4d72502ffbd31d392959cf1d389e69f3")],
            series: SeriesComics(
                resourceURI: "http://gateway.marvel.com/v1/public/series/34029",
                name: "Marauders (2022 - Present)"),
            variants: [SeriesComics(resourceURI: "http://gateway.marvel.com/v1/public/comics/105303", name: "Marauders (2022) #8 (Variant)")],
            collections: [],
            collectedIssues: [],
            dates: [
                DateElementComics(
                    type: "onsaleDate",
                    date: "2022-11-09T00:00:00-0500"),],
            prices: [
                PriceComics(
                    type: "printPrice",
                    price: 3.99)],
            thumbnail:
                ThumbnailComics(
                    path: "http://i.annihil.us/u/prod/marvel/i/mg/7/00/63658b3f75df2",
                    thumbnailExtension: "jpg"),
            images: [
                ThumbnailComics(
                    path: "http://i.annihil.us/u/prod/marvel/i/mg/7/00/63658b3f75df2",
                    thumbnailExtension: "jpg")],
            creators:
                CreatorsComics(
                    available: 6,
                    collectionURI: "http://gateway.marvel.com/v1/public/comics/98690/creators",
                    items: [
                        CreatorsItemComics(
                            resourceURI: "http://gateway.marvel.com/v1/public/creators/14195",
                            name: "Eleonora Carlini",
                            role: "inker"),],
                    returned: 6),
            characters:
                CharactersComics(
                    available: 7,
                    collectionURI: "http://gateway.marvel.com/v1/public/comics/98690/characters",
                    items:
                        [SeriesComics(
                            resourceURI: "http://gateway.marvel.com/v1/public/characters/1009163",
                            name: "Aurora")],
                    returned: 1),
            stories:
                StoriesComics(
                    available: 2,
                    collectionURI: "http://gateway.marvel.com/v1/public/comics/98690/stories",
                    items: [
                        StoriesItemComics(
                            resourceURI: "http://gateway.marvel.com/v1/public/stories/218473",
                            name: "cover from Marauders (2022) #8",
                            type: "cover")],
                    returned: 2),
            
            events:
                CharactersComics(
                    available: 0,
                    collectionURI: "http://gateway.marvel.com/v1/public/comics/98690/events",
                    items: [],
                    returned: 0)
        )
        
        let data = MarvelResponseComics(
            code: 0,
            status: "",
            copyright: "",
            attributionText: "",
            attributionHTML: "",
            etag: "",
            data: DataClassComics(
                offset: 0,
                limit: 0,
                total: 0,
                count: 0,
                results: [comic, comic]
            )
        )
        return data.data.results
    }

    func loadGetComicsListTesting(){
        let b1 = getComicsMock()

        
        self.comics = b1
    }
    
}
