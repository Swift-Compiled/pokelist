//
//  PokemonDetailViewModel.swift
//  PokeList
//
//  Created by Alex Brown on 15/06/2020.
//  Copyright © 2020 ABrown. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import UIKit

class PokemonDetailViewModel: ObservableObject, PokemonService {
    
    var cancellables = Set<AnyCancellable>()
    
    @Published var pokemon: Pokemon?
    @Published var pokemonImages: [UIImage] = [UIImage]()
    
    let pokemonListItem: PokemonListItem
    var apiSession: APIService
        
    var pokemonName: String {
        return pokemonListItem.name
    }
    
    var pokemonStats: [Stat] {
        guard let pokemon = pokemon
            else {return [Stat]()}
        return pokemon.stats
    }
    
    init(pokemonListItem: PokemonListItem, apiService: APIService = APISession()) {
        self.pokemonListItem = pokemonListItem
        self.apiSession = apiService
    }
    
    func getPokemon() {
        let cancellable = self.getPokemon(pokemonURL: pokemonListItem.url)
            .sink(receiveCompletion: { (result) in
                print(result)
            }) { (pokemon) in
                self.pokemon = pokemon
                self.getPokemonSprites()
        }
        cancellables.insert(cancellable)
    }
    
    func getPokemonSprites() {
        guard let pokemon = pokemon
            else {return}
        
        getPokemonSprite(urlString: pokemon.sprites.frontDefault)        
        if let frontShiny = pokemon.sprites.frontShiny {
            getPokemonSprite(urlString: frontShiny)
        }
        
        getPokemonSprite(urlString: pokemon.sprites.backDefault)
        if let backShiny = pokemon.sprites.backShiny {
            getPokemonSprite(urlString: backShiny)
        }
    }
    
    func getPokemonSprite(urlString: String) {
        let cancellable = apiSession.requestImage(with: urlString)
            .sink(receiveCompletion: { (result) in
                print(result)
            }) { (image) in
                self.pokemonImages.append(image)
        }
        
        cancellables.insert(cancellable)
    }
}
