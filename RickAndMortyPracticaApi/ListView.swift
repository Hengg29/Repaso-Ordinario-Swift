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
        Text("\(RickList.personajes.count)")
      
        List(RickList.personajes) { personaje in
            Text(personaje.name)
            AsyncImage(url: URL(string: personaje.image)!)
        }
        .onAppear {
            RickList.getPersonajes()
        }
    }
}

#Preview {
    ListView()
}
