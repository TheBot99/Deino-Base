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
    var searchValue: String
    var filter: String
    
    
    var filteredList: [PokemonSelectionScreenDataModel] {
            if searchValue.isEmpty {
                return PokemonSelectionScreenModelDatas
            } else {
                switch filter {
                    case "Name":
                        return PokemonSelectionScreenModelDatas.filter { $0.name.lowercased().contains(searchValue.lowercased()) }
                    case "Types":
                        
                    return PokemonSelectionScreenModelDatas.filter { pokemon in
                                        pokemon.types.contains { $0.lowercased().contains(searchValue.lowercased()) }
                                    }
                    case "Dex Number":
                        
                        return PokemonSelectionScreenModelDatas.filter { $0.id.contains(searchValue) }
                    default:
                        return PokemonSelectionScreenModelDatas
                }
            }
        }
            
    
    var body: some View {
        
        
        
        ScrollView {
            LazyVStack {
                ForEach(filteredList) { PokemonSelectionScreenModelData in
                    NavigationLink(destination: PokemonInfoScreen(PassedInID: PokemonSelectionScreenModelData.id)) {
                        Pokemon_Card(name: PokemonSelectionScreenModelData.name, id: PokemonSelectionScreenModelData.id, types: PokemonSelectionScreenModelData.types, width: width, height: height)
                    }
                    
                }
            }
        }
    }
}

#Preview {
    NavigationView {
        PokemonCardList(width: 350, height: 100, searchValue: "", filter: "Name")
    }
}
