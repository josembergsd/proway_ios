import Foundation
import SwiftUI

//Card de locais para tela principal
struct CardView: View {
    
    @Binding var pacote: Pacote
    
    @State private var favorito = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(pacote.foto)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: 180)
                .clipped()
            HStack {
                VStack(alignment: .leading) {
                    Text(pacote.tituloPacote)
                        .foregroundStyle(.black)
                        .font(.title3)
                    Text(pacote.destino)
                        .font(.title3)
                        .foregroundStyle(.black)
                }
                
                Spacer()
                
                Button {
                    pacote.favorito.toggle()
                } label: {
                    Image(systemName: pacote.favorito ? "heart.fill" : "heart")
                }
                .foregroundStyle(.red)
                
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .foregroundStyle(.blue)
        .glassEffect(in: .rect(cornerRadius: 15))
        .shadow(color: .cyan.opacity(0.3) ,radius: 8)
    } //body
    
} //CardView
