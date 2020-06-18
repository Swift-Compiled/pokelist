//
//  PokemonDetailView.swift
//  PokeList
//
//  Created by Alex Brown on 15/06/2020.
//  Copyright © 2020 ABrown. All rights reserved.
//

import SwiftUI

struct PokemonDetailView: View {
    @ObservedObject var viewModel: PokemonDetailViewModel
    
    init(pokemonListItem: PokemonListItem) {
        viewModel = PokemonDetailViewModel(pokemonListItem: pokemonListItem)
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    ForEach(viewModel.pokemonImages, id: \.self) { image in
                        Image(uiImage: image)
                    }
                }
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Stats")
                        .font(.title)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach(viewModel.pokemonStats) { stat in
                            Text("\(stat.stat.name.capitalized): \(stat.baseStat!)")
                        }
                    }
                    .padding(.top, 10)
                    .padding(.leading, 10)
                }
                .padding()
                
                Spacer()
            }
        }
        .onAppear {
            self.viewModel.getPokemon()
        }
        .navigationBarTitle(self.viewModel.pokemonName.capitalized)
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(pokemonListItem: PokemonListItem(name: "Bulbasaur", url: ""))
    }
}
