//
//  PokemonAPIResponse.swift
//  PokeList
//
//  Created by Alex Brown on 14/06/2020.
//  Copyright © 2020 ABrown. All rights reserved.
//

import Foundation

struct PokemonListAPIResponse: Codable {
    let count: Int
    let next: String
    let previous: String?
    let results: [PokemonListItem]
}
