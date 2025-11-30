//
//  ContentView.swift
//  RickAndMortyPracticaApi
//
//  Created by Alexander Hernandez Henggeler on 30/11/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            
            
            ZStack{
                Image("fondo")
                    .resizable()
                    .ignoresSafeArea()
                
                
                VStack() {
                    
                    Text("Practica para el examen ordinario")
                        .ignoresSafeArea()
                        .padding(.top,1)
                        .foregroundStyle(Color.white)
                        .font(.system(size: 25))
                        .underline(true)
                        .bold(true)
                    Spacer()
                    
                    NavigationLink(destination: ListView()) {
                        Text("Ir a la lista")
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                            .padding(6)
                            .bold()
                            .background(Color.green)
                            .cornerRadius(10)
                            
                        
                    }
                    Spacer()
                    
                    
                }
                
            }
        }
        
    }
}

#Preview {
    ContentView()
}
