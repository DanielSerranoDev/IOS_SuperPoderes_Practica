//
//  HeroDetailScreen.swift
//  IOS_SUPERPODERES_PRACTICA
//
//  Created by Daniel Serrano on 1/3/24.
//

import SwiftUI

struct HeroDetailScreen: View {
    @EnvironmentObject var heroComicsListViewModel: HeroComicsListViewModel
    @EnvironmentObject var heroSeriesListViewModel: HeroSeriesListViewModel
    @State var selectedTabIndex = 0
    var hero: Heroe
   
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            if selectedTabIndex == 0 {
                AsyncImage(url: URL(string: "\(hero.thumbnail.path).\(hero.thumbnail.thumbnailExtension)")) { image in
                    image
                        .resizable()
                        .frame(width: 300, height: 300)
                        .cornerRadius(20)
                        .id(0)
                } placeholder: {
                    ProgressView()
                }
            }
            Text(hero.name)
                .id(1)
            
            TabView(selection: $selectedTabIndex) {
                // Primer elemento para la descripción
                if !hero.description.isEmpty {
                    Text(hero.description)
                        .tabItem {
                            Image(systemName: "info.square")
                            Text("Descripción")
                        }
                        .tag(0)
                } else {
                    //Text("*** Información confidencial ***")
                    Image("topsecret")
                        .tabItem {
                            Image(systemName: "info.square")
                            Text("Descripción")
                        }
                        .tag(0)
                }
                // Segundo elemento para mostrar los cómics
                ScrollView {
                    if let comics = heroComicsListViewModel.requestMarvelComics?.data.results {
                        ForEach(comics) { comic in
                            heroComicsDetailScreen(comic: comic)
                        }
                    }
                }
                .tabItem {
                    Image(systemName: "book.fill")
                    Text("Cómics")
                }
                .tag(1)
                
                // Tercer elemento para mostrar las series
                ScrollView {
                    if let series = heroSeriesListViewModel.requestMarvelSeries?.data.results {
                        ForEach(series) { serie in
                            heroSeriesDetailScreen(serie: serie)
                        }
                    }
                }
                .tabItem {
                    Image(systemName: "videoprojector.fill")
                    Text("Series")
                }
                .tag(2)
            }
            .onAppear{
                heroComicsListViewModel.getComicsList(id: hero.id)
                heroSeriesListViewModel.getSeriesList(id: hero.id)
            }
        }
    }

    func heroComicsDetailScreen(comic: ResultComics) -> some View {
        VStack(alignment: .center) {
            Text(comic.title)
                .padding()
            
            Spacer()
            
            AsyncImage(url: URL(string: "\(comic.thumbnail.path).\(comic.thumbnail.thumbnailExtension)")) { image in
                image
                    .resizable()
                    .frame(width: 300, height: 350)
                    .cornerRadius(20)
            } placeholder: {
                ProgressView()
            }
            
            Spacer()
        }
    }

    func heroSeriesDetailScreen(serie: ResultSeries) -> some View {
        VStack(alignment: .center) {
            Text(serie.title)
            AsyncImage(url: URL(string: "\(serie.thumbnail.path).\(serie.thumbnail.thumbnailExtension)")) { image in
                image
                    .resizable()
                    .frame(width: 300, height: 350)
                    .cornerRadius(20)
            } placeholder: {
                ProgressView()
            }
        }
    }
}
