//
//  PokemonEndpoint.swift
//  PokeList
//
//  Created by Alex Brown on 14/06/2020.
//  Copyright © 2020 ABrown. All rights reserved.
//

import Foundation

enum PokemonEndpoint {
    case pokemonList
    case pokemonDetail(String)
}

extension PokemonEndpoint: RequestBuilder {
    
    var urlRequest: URLRequest {
        switch self {
        case .pokemonList:
            guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon")
                else {preconditionFailure("Invalid URL format")}
            let request = URLRequest(url: url)
            return request
        case .pokemonDetail(let pokemonURL):
            
            guard let url = URL(string: pokemonURL)
                else {preconditionFailure("Invalid URL format")}
            
            let request = URLRequest(url: url)
            return request
        }
        
    }
}
