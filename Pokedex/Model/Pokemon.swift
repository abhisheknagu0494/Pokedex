//
//  Pokemon.swift
//  Pokedex
//
//  Created by Abhishek Nagu on 26/12/23.
//

import Foundation
import SwiftUI

struct Pokemon : Identifiable, Codable {
    let id: Int
    let name: PokemonName
    let type: [String]
    let base: PokemonBase?
    let species: String
    let description: String
//    let profile: PokemonProfile?
    let image: PokemonImage
}

struct PokemonName: Codable {
    let english: String
    let japanese: String
    let chinese: String
    let french: String
}

struct PokemonBase: Codable {
    let HP: Int
    let Attack: Int
    let Defense: Int
    let Speed: Int
}


struct PokemonImage: Codable {
    let sprite: String
    let thumbnail: String
    let hires: String?
}

//struct PokemonProfile: Codable {
//    let height: Int
//    let weight: Int
//    let egg: [String]
//    let ability: [String]
//    let gender: Double
//}
