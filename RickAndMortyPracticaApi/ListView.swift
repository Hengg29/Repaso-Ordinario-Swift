//
//  ListView.swift
//  RickAndMortyPracticaApi
//
//  Created by Alexander Hernandez Henggeler on 30/11/25.
//

import SwiftUI

struct ListView: View {
    @StateObject var RickList = RickListViewModel()
    var body: some View {
        ZStack{
            Color.black //Cambia de color lo que esta afuera de la lista
                .ignoresSafeArea()
            VStack{
                Text("Personajes de Rick y Morty")
                    .foregroundStyle(Color.white)
                    .font(Font.title.bold())
                    .ignoresSafeArea()
                    .padding(.top, 1)
                    
                Spacer()
            }
            
            List(RickList.personajes) { personaje in
                HStack(spacing: 16) {
                    AsyncImage(url: URL(string: personaje.image)) { img in
                        img.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    VStack(spacing: 8){
                        Text("Nombre del personaje: \(personaje.name)")
                            .foregroundColor(.white)
                            .font(.system(size: 12, weight: .bold, design: .default))
                        Text("Tierra de origen: \(personaje.origin.name)")
                            .foregroundColor(.white)
                            .font(.system(size: 12, weight: .bold, design: .default))
                    }
                   
                        
                }
                .padding(.vertical, 8)
                .listRowBackground(Color.gray)//cambia la lista de color
            }
            .scrollContentBackground(.hidden)//esto tmb es importante
            .onAppear {
                RickList.getPersonajes()
            }
        }
    }
}


#Preview {
    ListView()
}
