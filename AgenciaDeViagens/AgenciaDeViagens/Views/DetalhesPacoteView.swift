import Foundation
import SwiftUI

import Foundation
import SwiftUI

struct DetalhesPacoteView: View{
    
    let pacote: Pacote
    
    @State private var exibirMensagemCompra = false
    
    var body: some View {
        
        ZStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    
                        Image(pacote.foto)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 250)
                            .clipShape(
                                RoundedRectangle(cornerRadius: 16)
                            )
                            .shadow(radius: 4)
                    
                    Divider()
                        
                    VStack(alignment: .leading, spacing: 12) {
                        
                        Text(pacote.tituloPacote)
                            .font(.largeTitle)
                            .bold()
                        
                        Text(pacote.destino)
                            .font(.title3)
                            .foregroundStyle(.secondary)
                        
                        Label("\(pacote.qtdDiarias) diárias",
                              systemImage: "bed.double")
                        
                        Label("Partida: \(pacote.dataPartida)",
                              systemImage: "airplane.arrival")
                        
                        Label("Retorno: \(pacote.dataRetorno)",
                              systemImage: "airplane.departure")
                        
                        Text("Hospedagem")
                            .font(.headline)

                        Text(pacote.infoHospedagem)

                        Text("Preço")
                            .font(.headline)

                        Text(
                            pacote.precoPacote,
                            format: .currency(code: "BRL")
                        )
                        .font(.largeTitle)
                        .foregroundStyle(.green)

                        Button {
                            exibirMensagemCompra = true

                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                exibirMensagemCompra = false
                            }
                        } label: {
                            Label("Comprar pacote",
                                  systemImage: "cart.fill")
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(.borderedProminent)
                        .controlSize(.large)
                    }
                    .padding(.horizontal)
                    .background(.gray.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    
                }
                .padding()
                
                //Toast
                if exibirMensagemCompra {
                    VStack {
                        Spacer()
                        
                        Label(
                            "Pacote comprado com sucesso!",
                            systemImage: "checkmark.fill"
                        )
                        .padding()
                        .foregroundStyle(.white)
                        .background(.green)
                        .clipShape(Capsule())
                        .padding(.bottom, 30)
                    }
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                    .animation(.easeInOut, value: exibirMensagemCompra)
                }
                
            }//Scrool
            .navigationTitle("Detalhes")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}
