//
//  RickListViewModel.swift
//  RickAndMortyPracticaApi
//
//  Created by Alexander Hernandez Henggeler on 30/11/25.
//

import Foundation
import Combine

class RickListViewModel: ObservableObject {
    @Published var personajes: [Character] = []

    func getPersonajes() {
        let endPoint = "https://rickandmortyapi.com/api/character"
        guard let apiURL = URL(string: endPoint) else {
            fatalError("URL no válida o no definida")
        }

        URLSession.shared.dataTask(with: apiURL) { data, response, error in

            if let error = error {
                print("Error al conectar: \(error.localizedDescription)")
                return
            }

            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                print("Respuesta inválida del servidor")
                return
            }

            guard let data = data else {
                print("Datos vacíos")
                return
            }

            do {
                let decoded = try JSONDecoder().decode(CharacterResponse.self, from: data)

                DispatchQueue.main.async {
                    self.personajes = decoded.results
                }

            } catch {
                print("Error al decodificar JSON: \(error)")
            }

        }.resume()
    }
}
