//
//  PokemonInfoScreen.swift
//  Deino Base
//
//  Created by Vinay Maryala on 7/29/24.
//

import SwiftUI

struct PokemonInfoScreen: View {
    var PassedInID: String
    
    var body: some View {
        Text(PassedInID)
    }
}

#Preview {
    PokemonInfoScreen(PassedInID: "1")
}
