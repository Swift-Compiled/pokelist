//
//  PokemonService.swift
//  PokeList
//
//  Created by Alex Brown on 14/06/2020.
//  Copyright © 2020 ABrown. All rights reserved.
//

import Foundation
import Combine
import UIKit

protocol PokemonService {
    var apiSession: APIService {get}
    
    func getPokemonList() -> AnyPublisher<PokemonListAPIResponse, APIError>
    func getPokemon(pokemonURL: String) -> AnyPublisher<Pokemon, APIError>
}

extension PokemonService {
    
    func getPokemonList() -> AnyPublisher<PokemonListAPIResponse, APIError> {
        return apiSession.request(with: PokemonEndpoint.pokemonList)
            .eraseToAnyPublisher()
    }
    
    func getPokemon(pokemonURL: String) -> AnyPublisher<Pokemon, APIError> {
        return apiSession.request(with: PokemonEndpoint.pokemonDetail(pokemonURL))
            .eraseToAnyPublisher()
    }
}
