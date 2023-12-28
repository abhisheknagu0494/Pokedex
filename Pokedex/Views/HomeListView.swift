//
//  HomeListView.swift
//  Pokedex
//
//  Created by Abhishek Nagu on 28/12/23.
//

import SwiftUI

struct HomeListView: View {
    var pokemon: Pokemon
    // To Change Colors
    @State var color1: Color = .green
    @State var color2: Color = .blue
    
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            RemoteImage(url: pokemon.image.thumbnail)
                .frame(width: 80, height: 80)
                .scaledToFit()
            
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text("#\(pokemon.id)")
                        .font(.headline)
                        .foregroundStyle(LinearGradient(colors: [color1, color2], startPoint: .leading, endPoint: .trailing))
                    
                    Text("\(pokemon.name.english)")
                        .font(.headline)
                        .foregroundStyle(LinearGradient(colors: [color1, color2], startPoint: .leading, endPoint: .trailing))
                }
                
                Text(pokemon.type.first ?? "")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                
                Text(pokemon.species)
                    .font(.footnote)
                    .foregroundStyle(.red)
            }
            
            
             /* Old Code to load image with animation
            AsyncImage(url: URL(string: pokemon.image.thumbnail), transaction: Transaction(animation: .spring())) { phase in
                if let image = phase.image {
                    // Display the loaded image
                    image
                        .transition(.push(from: .trailing))
                }
                else if phase.error != nil {
                    // Display a placeholder when loading failed
                    Image(systemName: "questionmark.diamond")
                        .imageScale(.large)
                }
                else {
                    // Display a placeholder while loading
                    ProgressView()
                        .foregroundStyle(.red)
                }
            }
              */
        }
        .onAppear {
            customPokemonColorBasedOnType()
        }
    }
    
    func customPokemonColorBasedOnType() {
        if pokemon.type.first == "Grass" {
            color1 = .green
            color2 = .green.opacity(0.66)
        }
        else if pokemon.type.first == "Fire" {
            color1 = .red
            color2 = .orange
        }
        else if pokemon.type.first == "Water" {
            color1 = .blue
            color2 = .indigo
        }
        else if pokemon.type.first == "Electric" {
            color1 = .yellow
            color2 = .orange
        }
        else if pokemon.type.first == "Bug" {
            color1 = .orange
            color2 = .brown.opacity(0.66)
        }
        else if pokemon.type.first == "Rock" {
            color1 = .secondary
            color2 = .gray.opacity(0.6)
        }
        else if pokemon.type.first == "Ground" {
            color1 = .brown
            color2 = .orange
        }
        else if pokemon.type.first == "Ghost" {
            color1 = .purple
            color2 = .red
        }
        else if pokemon.type.first == "Psychic" {
            color1 = .pink
            color2 = .mint
        }
        else {
            color1 = .primary
            color2 = .secondary
        }
    }
}

struct HomeListView_Previews: PreviewProvider {
    static var previews: some View {
        HomeListView(pokemon: Pokemon(id: 0, name: PokemonName(english: "Test", japanese: "test", chinese: "test", french: "test"), type: ["Grass"], base: PokemonBase(HP: 10, Attack: 10, Defense: 10, Speed: 10), species: "Rat Pokemon", description: "test", image: PokemonImage(sprite: "test", thumbnail: "test", hires: "test")))
    }
}
