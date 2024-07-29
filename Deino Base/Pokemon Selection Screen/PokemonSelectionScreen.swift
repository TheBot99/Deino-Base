//
//  PokemonSelectionScreen.swift
//  Deino Base
//
//  Created by Vinay Maryala on 7/29/24.
//

import SwiftUI

struct PokemonSelectionScreen: View {
    @State private var searchValue: String = ""
    @State private var initialHeight: CGFloat = 0  // State variable to hold the initial height
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color(red:20/255, green:22/255, blue:82/255), Color(red:106/255, green:3/255, blue:3/255)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.all)
            
            GeometryReader { geometry in
                VStack {
                    Spacer()
                        .frame(height: (initialHeight == 0 ? geometry.size.height : initialHeight) * 0.03) // 3% offset from top
                    
                    SearchBar(text: $searchValue, placeholder: "Search", initialHeight: initialHeight)
                        .frame(height: (initialHeight == 0 ? geometry.size.height : initialHeight) * 0.1)
                    
                    
                    PokemonCardList(width: geometry.size.width * 0.9, height: (initialHeight == 0 ? geometry.size.height : initialHeight) * 0.13)

                    
                    Spacer()
                                            
                    
                        
                    
                }
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .top) // Align to top middle
                .onAppear {
                    // Capture the initial height when the view appears
                    if initialHeight == 0 {
                        initialHeight = geometry.size.height
                    }
                }
            }
        }
    }

}

#Preview {
    PokemonSelectionScreen()
}
