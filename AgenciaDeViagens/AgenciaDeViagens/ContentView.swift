import SwiftUI


struct ContentView: View {
    
    @State private var pacotes = DataBase()
    @State private var listaFavoritos = false
    
    var pacotesFiltrados: [Pacote] {
        listaFavoritos
            ? pacotes.filter { $0.favorito }
            : pacotes
    }
    
    
    let colunas = [
        GridItem(.flexible(), spacing: 15)
    ]
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: colunas, spacing: 15) {
                    ForEach(pacotes.indices.filter { indice in
                        !listaFavoritos || pacotes[indice].favorito
                    }, id: \.self) { indice in
                            NavigationLink {
                                DetalhesPacoteView(pacote: pacotes[indice])
                            } label: {
                                CardView(pacote: $pacotes[indice])
                            }
                            .buttonStyle(.plain)
                            
                    }
                } //LazyVGrid
                .padding()
            } //ScrollView
            .navigationTitle("Meus Lugares")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Label("Meus Lugares", systemImage: "map")
                }
                //Filtro para favoritos
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        listaFavoritos.toggle()
                    }label: {
                        Image(
                            systemName:
                                listaFavoritos
                                    ? "heart.fill"
                                    : "heart"
                        )
                        .foregroundStyle(.red)
                    }
                }
            }
        } //NavigationStack
        
    } //body
} //ContentView


#Preview {
    ContentView()
}
