//
//  IOS_SUPERPODERES_PRACTICAApp.swift
//  IOS_SUPERPODERES_PRACTICA
//
//  Created by Daniel Serrano on 21/2/24.
//

import SwiftUI

@main
struct IOS_SUPERPODERES_PRACTICAApp: App {

    
    @StateObject var mainViewModel = MainViewModel()
    @StateObject var heroesListViewModel = HeroesListViewModel()
    @StateObject var heroComicsListViewModel = HeroComicsListViewModel()
    @StateObject var heroSeriesListViewModel = HeroSeriesListViewModel()

    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(mainViewModel)
                .environmentObject(heroesListViewModel)
                .environmentObject(heroComicsListViewModel)
                .environmentObject(heroSeriesListViewModel)
        }
    }
}
