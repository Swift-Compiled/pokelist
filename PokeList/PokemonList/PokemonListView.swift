//
//  ContentView.swift
//  PokeList
//
//  Created by Alex Brown on 13/06/2020.
//  Copyright © 2020 ABrown. All rights reserved.
//

import SwiftUI

struct PokemonListView: View {
    @ObservedObject var viewModel = PokemonListViewModel()
    
    var body: some View {
        NavigationView {
            List(self.viewModel.pokemon) { pokemon in
                Text(pokemon.name.capitalized)
            }
            .navigationBarTitle("Pokemon")
        }
        .onAppear {
            self.viewModel.getPokemonList()
        }
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}
