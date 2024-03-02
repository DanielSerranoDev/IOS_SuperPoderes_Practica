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
    @Published var heros: [Heroe] = []
    
    init(testing: Bool = false){
        if (testing){
            
        }else{
            getHeroesList()
        }
        
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
    
    func getHerosTesting() {
        self.status = .loading
        self.heros = getHerosMock()
        self.status = .login
    }
    
    func getHerosMock() -> [Heroe] {
        
        let hero = Heroe(
            id: 1011334,
            name: "3-D Man",
            description: "",
            modified: "",
            thumbnail: Thumbnail(
                path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784",
                thumbnailExtension: "jpg"
            ),
            resourceURI: "http://gateway.marvel.com/v1/public/characters/1011334",
            comics: Comics(
                available: 12,
                collectionURI: "http://gateway.marvel.com/v1/public/characters/1011334/comics",
                items: [
                    ComicsItem(
                        resourceURI: "http://gateway.marvel.com/v1/public/comics/21366",
                        name: "Avengers: The Initiative (2007) #14"
                    )
                ],
                returned: 12
            ),
            series: Comics(
                available: 12,
                collectionURI: "http://gateway.marvel.com/v1/public/characters/1011334/comics",
                items: [
                    ComicsItem(
                        resourceURI: "http://gateway.marvel.com/v1/public/comics/21366",
                        name: "Avengers: The Initiative (2007) #14"
                    )
                ],
                returned: 12
            ),
            stories: Stories(
                available: 12,
                collectionURI: "http://gateway.marvel.com/v1/public/characters/1011334/comics",
                items: [
                    StoriesItem(
                        resourceURI: "http://gateway.marvel.com/v1/public/stories/19947",
                        name: "Cover #19947",
                        type: "cover"
                    )
                ],
                returned: 12
            ),
            events: Comics(
                available: 12,
                collectionURI: "http://gateway.marvel.com/v1/public/characters/1011334/comics",
                items: [
                    ComicsItem(
                        resourceURI: "http://gateway.marvel.com/v1/public/comics/21366",
                        name: "Avengers: The Initiative (2007) #14"
                    )
                ],
                returned: 12
            ),
            urls: [
                URLElement(
                    type: "detail",
                    url: "http://marvel.com/characters/74/3-d_man?utm_campaign=apiRef&utm_source=808a8a06bb441aba483dd693f6c3056d"
                )
            ]
        )
        
        let data = MarvelResponseHeros(
            code: 0,
            status: "",
            copyright: "",
            attributionText: "",
            attributionHTML: "",
            etag: "",
            data: DataClass(
                offset: 0,
                limit: 0,
                total: 0,
                count: 0,
                results: [hero, hero]
            )
        )
        
        return data.data.results
    }
    
    func loadGetHeroesListTesting(){
        let b1 = getHerosMock()

        
        self.heros = b1
    }

    
}
