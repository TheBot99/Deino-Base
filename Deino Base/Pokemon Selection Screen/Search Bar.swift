import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    @Binding var selectedFilter: String
    var placeholder: String
    var initialHeight: CGFloat
    
    @State private var showFilters = false
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack {
                    if showFilters {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                FilterButton(title: "Name", isSelected: selectedFilter == "Name") {
                                    selectedFilter = "Name"
                                }
                                FilterButton(title: "Types", isSelected: selectedFilter == "Types") {
                                    selectedFilter = "Types"
                                }
                                FilterButton(title: "Dex Number", isSelected: selectedFilter == "Dex Number") {
                                    selectedFilter = "Dex Number"
                                }
                            }
                        }
                        .frame(height: (initialHeight == 0 ? geometry.size.height : initialHeight) * 0.055)
                        .transition(.move(edge: .leading))
                        .padding(.leading)
                        .frame(width: geometry.size.width * 0.9)
                    } else {
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
                        .padding(.leading)
                        .frame(width: geometry.size.width * 0.9)
                        .font(.system(size: 17))
                        .foregroundStyle(Color.white)
                        .transition(.move(edge: .leading))
                    }
                    
                    Image(systemName: "line.3.horizontal.decrease.circle")
                        .imageScale(.large)
                        .padding(.trailing)
                        .foregroundStyle(Color.gray)
                        .onTapGesture {
                            withAnimation {
                                showFilters.toggle()
                            }
                        }
                }
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .top)
            }
        }
    }
}

struct FilterButton: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        Text(title)
            .padding()
            .background(isSelected ? Color.blue : Color.gray.opacity(0.2))
            .cornerRadius(16)
            .foregroundColor(.white)
            .onTapGesture {
                action()
            }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant("Search..."), selectedFilter: .constant("Name"), placeholder: "Search", initialHeight: 900)
            .previewLayout(.sizeThatFits)
    }
}
