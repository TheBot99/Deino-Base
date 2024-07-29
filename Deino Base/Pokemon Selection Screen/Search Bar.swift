import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    var placeholder: String
    var initialHeight: CGFloat

    var body: some View {
        GeometryReader { geometry in
            VStack {
                TextField(
                    "",
                    text: $text,
                    prompt: Text(placeholder)
                        .foregroundStyle(Color(red: 135/255, green: 135/255, blue: 135/255))
                )
                .padding()
                .frame(
                    height: (initialHeight == 0 ? geometry.size.height : initialHeight) * 0.055
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 32)
                        .stroke(Color(red: 63/255, green: 63/255, blue: 63/255), lineWidth: 1)
                )
                .frame(width: geometry.size.width * 0.9)
                .font(.system(size: 17))
            .foregroundStyle(Color.white)
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .top) // Align to top middle
            
            
        }
        
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant("Search..."), placeholder: "Search", initialHeight: 900)
            .previewLayout(.sizeThatFits)
    }
}
