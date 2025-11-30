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
            
            List(RickList.personajes) { personaje in
                HStack(spacing: 16) {
                    AsyncImage(url: URL(string: personaje.image)) { img in
                        img.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 80, height: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 10))

                    Text(personaje.name)
                        .foregroundColor(.white)
                        .font(.headline)
                }
                .padding(.vertical, 8)
                .listRowBackground(Color.gray)//cambia la lista de color
            }
            .scrollContentBackground(.hidden)
            .onAppear {
                RickList.getPersonajes()
            }
        }
    }
}


#Preview {
    ListView()
}
