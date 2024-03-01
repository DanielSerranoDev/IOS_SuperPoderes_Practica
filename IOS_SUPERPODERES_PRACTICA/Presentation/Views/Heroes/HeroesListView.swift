//
//  HeroesList2View.swift
//  IOS_SUPERPODERES_PRACTICA
//
//  Created by Daniel Serrano on 25/2/24.

import SwiftUI
import Combine


struct HeroesListView: View {
    @EnvironmentObject var heroesListViewModel: HeroesListViewModel
    @State private var isShowingLoginView = false 
    
    
    var body: some View {
        NavigationView {
            List {
                if let heroes = heroesListViewModel.requestMarvelHeros?.data.results {
                    ForEach(heroes) { hero in
                        NavigationLink(
                            destination: HeroDetailScreen(hero: hero),
                            label: {
                                heroListScreen(hero: hero)
                            }
                        )
                    }
                }
            }
            .navigationTitle("Heroes")
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        heroesListViewModel.logOut()
                        isShowingLoginView = true
                    }) {
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                        Text("logout")
                    }
                    .fullScreenCover(isPresented: $isShowingLoginView) {
                        NavigationView {
                            LoginView()
                        }
                    }
                }
            }
        }
    }
    
    func heroListScreen(hero: Heroe) -> some View {
        VStack {
            Text(hero.name)
                .foregroundColor(.black)
            
            AsyncImage(url: URL(string: "\(hero.thumbnail.path).\(hero.thumbnail.thumbnailExtension)")) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .cornerRadius(20)
            } placeholder: {
                ProgressView()
            }
        }
    }
    
    
}

