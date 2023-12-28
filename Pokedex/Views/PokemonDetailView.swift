//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by Abhishek Nagu on 27/12/23.
//

import SwiftUI

struct PokemonDetailView: View {
    
    let pokemon: Pokemon
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.red, .orange], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 24) {
                    VStack(alignment: .center, spacing: 20)  {
                        Text(pokemon.name.japanese)
                            .font(.largeTitle)
                            .foregroundStyle(LinearGradient(colors: [.red, .orange], startPoint: .leading, endPoint: .trailing))
                        
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
                        
                        Text(pokemon.species)
                            .foregroundStyle(.primary)
                            .font(.headline)
                            .padding(.horizontal)
                            .padding(.vertical)
                    }
                    
                    VStack(alignment: .leading, spacing: 24) {
                        Text(pokemon.description)
                            .font(.subheadline)
                        
                        if let base = pokemon.base {
                            ZStack {
                                if pokemon.type.first == "Grass" {
                                    Color.green.opacity(0.10)
                                        .shadow(radius: 12)
                                }
                                else if pokemon.type.first == "Fire" {
                                    Color.red.opacity(0.10)
                                        .shadow(radius: 12)
                                }
                                else if pokemon.type.first == "Water" {
                                    Color.blue.opacity(0.10)
                                        .shadow(radius: 12)
                                }
                                else if pokemon.type.first == "Electric" {
                                    Color.yellow.opacity(0.10)
                                        .shadow(radius: 12)
                                }
                                else if pokemon.type.first == "Bug" {
                                    Color.orange.opacity(0.10)
                                        .shadow(radius: 12)
                                }
                                else if pokemon.type.first == "Rock" {
                                    Color.black.opacity(0.10)
                                        .shadow(radius: 12)
                                }
                                else if pokemon.type.first == "Ground" {
                                    Color.brown.opacity(0.10)
                                        .shadow(radius: 12)
                                }
                                else if pokemon.type.first == "Ghost" {
                                    Color.purple.opacity(0.10)
                                        .shadow(radius: 12)
                                }
                                else if pokemon.type.first == "Psychic" {
                                    Color.pink.opacity(0.10)
                                        .shadow(radius: 12)
                                }
                                else {
                                    Color.secondary.opacity(0.10)
                                        .shadow(radius: 12)
                                }
                                
                                VStack(alignment: .leading, spacing: 10) {
                                    Text("HP: \(base.HP)")
                                        .foregroundStyle(.indigo)
                                        .bold()
                                    Text("Speed: \(base.Speed)")
                                        .foregroundStyle(.orange)
                                        .bold()
                                    Text("Attack: \(base.Attack)")
                                        .foregroundStyle(.secondary)
                                        .bold()
                                    Text("Defence: \(base.Defense)")
                                        .foregroundStyle(.green)
                                        .bold()
                                }
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .cornerRadius(20)
                        }
                    }
                }
            }.ignoresSafeArea(.all)
            
        }
        .padding()
        .navigationTitle(pokemon.name.english)
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(pokemon: Pokemon(id: 1, name: PokemonName(english: "Bulbasaur", japanese: "フシギダネ", chinese: "妙蛙种子", french: "Bulbizarre"), type: ["Grass", "Poison"], base: PokemonBase(HP: 45, Attack: 49, Defense: 49, Speed: 45) , species: "Seed Pokémon", description: "Bulbasaur can be seen napping in bright sunlight. There is a seed on its back. By soaking up the sun’s rays, the seed grows progressively larger.", image: PokemonImage( sprite:"https://raw.githubusercontent.com/Purukitto/pokemon-data.json/master/images/pokedex/sprites/001.png", thumbnail:"https://raw.githubusercontent.com/Purukitto/pokemon-data.json/master/images/pokedex/thumbnails/001.png",              hires:"https://raw.githubusercontent.com/Purukitto/pokemon-data.json/master/images/pokedex/thumbnails/001.png")))
        //    profile: PokemonProfile(height: 0, weight: 13, egg: ["Monster", "Grass"], ability: ["Overgrow", "false","Chlorophyll", "true"], gender: 87.5)))
    }
}
