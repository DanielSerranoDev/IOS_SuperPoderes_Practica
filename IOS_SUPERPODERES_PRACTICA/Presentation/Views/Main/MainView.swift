//
//  MainView.swift
//  IOS_SUPERPODERES_PRACTICA
//
//  Created by Daniel Serrano on 27/2/24.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var mainViewModel: MainViewModel
    
    var body: some View {
        switch mainViewModel.status {
        case .error :
            ErrorView()
        case .login:
            LoginView()
        case .heroesList:
            HeroesListView()
        case .loading:
            LoadingView()
        }
    }
}

