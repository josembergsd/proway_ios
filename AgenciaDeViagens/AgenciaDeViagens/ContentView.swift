import SwiftUI


struct BackgroundAnimadoOceano: View {
    
    @State private var animar = false
    
    var body: some View {
        
        LinearGradient (
            colors: [.blue.opacity(0.8), .cyan.opacity(0.5), .white],
            startPoint: animar ? .topLeading : .bottomTrailing,
            endPoint: animar ? .bottomTrailing : .topLeading
        )
        .ignoresSafeArea()
        .onAppear {
            withAnimation(
                .easeInOut(duration: 8)
                .repeatForever(autoreverses: true)
            ) {
                animar.toggle()
            }
        }
    }
}

struct ContentView: View {
    
    @State private var pacotes = DataBase()
    @State private var listaFavoritos = false
    @State private var titulo = "Meus Lugares"
    
    var pacotesFiltrados: [Pacote] {
        listaFavoritos
            ? pacotes.filter { $0.favorito }
            : pacotes
    }
    
    
    let colunas = [
        GridItem(.flexible(), spacing: 15)
    ]
    
    var body: some View {
        
        ZStack {
            
            BackgroundAnimadoOceano()
            
            NavigationStack {
                ScrollView {
                    LazyVGrid(columns: colunas, spacing: 15) {
                        ForEach(pacotes.indices.filter { indice in
                            !listaFavoritos || pacotes[indice].favorito
                        }, id: \.self) { indice in
                            NavigationLink {
                                DetalhesPacoteView(pacote: $pacotes[indice])
                            } label: {
                                CardView(pacote: $pacotes[indice])
                            }
                            .buttonStyle(.plain)
                            
                        }
                    } //LazyVGrid
                    .padding()
                } //ScrollView
                .scrollContentBackground(.hidden)
                .navigationTitle(titulo)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Label("Meus Lugares", systemImage: "map")
                    }
                    //Filtro para favoritos
                    ToolbarItem(placement: .topBarLeading) {
                        Button {
                            titulo = "Meus Favoritos"
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
        }
    } //body
} //ContentView


#Preview {
    ContentView()
}
