//
//  Pokemon Card.swift
//  Deino Base
//
//  Created by Vinay Maryala on 7/24/24.
//

import SwiftUI


func add_zeros_to_id (id: String) -> String {
    var id_with_zeros: String
    id_with_zeros = ""

    if id.count < 2 {
        id_with_zeros = "#000" + id
    }
    
    else if id.count < 3 {
        id_with_zeros = "#00" + id
    }
    
    else if id.count < 4 {
        id_with_zeros = "#0" + id
    }
    
    else {
        id_with_zeros = "#" + id
    }
    
    return id_with_zeros
}

struct Pokemon_Card: View {
    var name: String
    var id: String
    var types: Array<String>
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(name.capitalized)
                Spacer()
                Text(add_zeros_to_id(id: id))
            }.padding()
                .foregroundStyle(Color.white)
            Spacer()
            
            
        }
        .frame(width: width, height: height)
        .background(Color(red:75/255, green:75/255, blue:75/255))
        .cornerRadius(15)
        
    }
}

#Preview {
    Pokemon_Card(name:"bulbasaur", id: "1", types: ["grass", "poison"], width: 350, height: 100)
}
