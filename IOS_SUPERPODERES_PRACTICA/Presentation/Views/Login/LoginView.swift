//
//  LoginView.swift
//  IOS_SUPERPODERES_PRACTICA
//
//  Created by Daniel Serrano on 25/2/24.
//

import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var haveToken = false
    @State private var showAlert = false
    @State private var alertMessage = ""
    @EnvironmentObject var mainViewModel: MainViewModel
    
    
    var body: some View {
        ZStack {
            if !haveToken { 
                Image("fondo2" )
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth:.leastNonzeroMagnitude, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all)
                    .id(0)
                
                VStack {
                    Spacer()
                    Spacer()
                    Spacer()
                    Image("marvellogo")
                        .resizable() // Hacer la imagen redimensionable
                        .frame(width: 350, height: 100)
                        .aspectRatio(contentMode: .fill)
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    TextField("Username", text: $username)
                        .padding()
                        .background(Color(UIColor.lightGray))
                        .cornerRadius(5.0)
                        .padding(.bottom, 20)
                        .id(1)
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color(UIColor.lightGray))
                        .cornerRadius(5.0)
                        .padding(.bottom, 20)
                        .id(2)
                    
                    Button(action: {
                        self.login()
                    })
                    {
                        Text("Login")
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 220, height: 60)
                            .background(Color.blue)
                            .cornerRadius(15.0)
                            .id(3)
                            
                    }
                    .padding()
                    .id(4)
                    
                    Spacer()
                }
                .padding()
            }
                
            
            
            if haveToken { // Muestra HeroesList2View solo si hay un token
                HeroesListView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            
        }
        .alert(isPresented: $showAlert) {
                    Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                }
    }
    
    func login() {
        switch (username.isEmpty, !username.contains("@"), password.isEmpty, password.count < 4) {
        case (true, _, _, _):
            alertMessage = "El nombre de usuario está vacío."
            showAlert = true
        case (_, true, _, _):
            alertMessage = "El nombre de usuario no contiene '@'."
            showAlert = true
        case (_, _, true, _):
            alertMessage = "La contraseña está vacía."
            showAlert = true
        case (_, _, _, true):
            alertMessage = "La contraseña debe tener al menos 4 caracteres."
            showAlert = true
        default:
            // Si pasa todas las validaciones, realiza el inicio de sesión
            DispatchQueue.main.async {
                let token = mainViewModel.fakeLogin(username: username, password: password)
                
                if !token.isEmpty {
                    haveToken = true
                }
            }
        }
    }

}


 
