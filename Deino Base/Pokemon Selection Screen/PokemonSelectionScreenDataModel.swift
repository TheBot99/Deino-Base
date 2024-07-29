//
//  PokemonSelectionScreenDataModel.swift
//  Deino Base
//
//  Created by Vinay Maryala on 7/24/24.
//

import Foundation

struct PokemonSelectionScreenDataModel: Identifiable, Decodable {
    var id: String
    var name: String
    var types: Array<String>
    
    
}
