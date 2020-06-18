//
//  PokelistViewModel.swift
//  PokeList
//
//  Created by Alex Brown on 14/06/2020.
//  Copyright © 2020 ABrown. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class PokemonListViewModel: ObservableObject, PokemonService {    
    var apiSession: APIService
    @Published var pokemon = [PokemonListItem]()
    
    var cancellables = Set<AnyCancellable>()
    
    init(apiSession: APIService = APISession()) {
        self.apiSession = apiSession
    }
    
    func getPokemonList() {
        let cancellable = self.getPokemonList()
            .sink(receiveCompletion: { result in
                switch result {
                case .failure(let error):
                    print("Handle error: \(error)")
                case .finished:
                    break
                }
                
            }) { (pokemon) in
                self.pokemon = pokemon.results
        }
        cancellables.insert(cancellable)
    }
}

