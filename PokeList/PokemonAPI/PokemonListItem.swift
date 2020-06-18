//
//  Pokemon.swift
//  PokeList
//
//  Created by Alex Brown on 14/06/2020.
//  Copyright © 2020 ABrown. All rights reserved.
//

import Foundation

struct PokemonListItem: Codable, Identifiable {
    let id = UUID()
    let name: String
    let url: String
}
