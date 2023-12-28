//
//  HomeView.swift
//  Pokedex
//
//  Created by Abhishek Nagu on 26/12/23.
//

import SwiftUI

struct HomeView: View {
    @State var pokemonList = [Pokemon]()
    @State private var searchText = ""
    
    var body: some View {
        if pokemonList.count == 0 {
            ZStack {
                Color.red
            }
            .ignoresSafeArea(.all)
            .onAppear {
                getpokemon()
            }
        } else {
            NavigationStack {
                List(searchResults) { pokemon in
                    NavigationLink(destination: PokemonDetailView(pokemon: pokemon)){
                        HomeListView(pokemon: pokemon)
                    }
                }
                .navigationTitle("Pokemon")
            }
            .tint(.primary)
            .searchable(text: $searchText)
        }
    }
    
    // MARK: - Search Results
    
    var searchResults: [Pokemon] {
        if searchText.isEmpty {
            return pokemonList
        } else {
            return pokemonList.filter { pokemon in
                pokemon.name.english.contains(searchText)
            }
        }
    }
    
    // MARK: - Fetch Pokemon
    // Get pokemon data from pokemon.json file
    
    func getpokemon() {
        guard let url = Bundle.main.url(forResource: "Pokedex", withExtension: "json")
        else {
            print("Json file not found")
            return
        }
        
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        
        do {
            let pokemon = try JSONDecoder().decode([Pokemon].self, from: data)
            
            self.pokemonList = pokemon
        }
        catch {
            print(error)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
