//
//  PokemonCardList.swift
//  Deino Base
//
//  Created by Vinay Maryala on 7/24/24.
//

import SwiftUI

struct PokemonCardList: View {
    var width: CGFloat
    var height: CGFloat
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(PokemonSelectionScreenModelDatas) { PokemonSelectionScreenModelData in
                    Pokemon_Card(name: PokemonSelectionScreenModelData.name, id: PokemonSelectionScreenModelData.id, types: PokemonSelectionScreenModelData.types, width: width, height: height)
                    
                }
            }
        }
    }
}

#Preview {
    PokemonCardList(width: 350, height: 100)
}
