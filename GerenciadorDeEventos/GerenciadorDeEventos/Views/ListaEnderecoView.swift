import SwiftUI
import SwiftData

struct ListaEnderecoView: View {

    @Environment(\.modelContext)
    private var context

    @Query
    private var enderecos: [EnderecoEntity]

    var body: some View {

        NavigationStack {
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    
                    Spacer()
                    
                    Text("\(enderecos.count) registros")
                        .font(.subheadline)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(
                            Capsule()
                                .foregroundStyle(Color(.systemGray6))
                        )
                        .overlay(
                            Capsule()
                                .stroke(Color(.systemGray4))
                        )
                    
                }//HStack
                .padding(.horizontal)
                .padding(.top)
            }
            .onAppear{
                print("Quantidade de registros: \(enderecos.count)")
            }
            
            VStack {
                if enderecos.isEmpty {
                    ContentUnavailableView {
                        VStack(spacing: 16) {
                            Image(systemName: "house.badge.exclamationmark")
                                .font(.system(size: 80, weight: .light))
                                .foregroundStyle(.blue)

                            Text("Nenhum endereço caastrado")
                                .font(.title)
                                .fontWeight(.bold)
                        }
                    } description: {
                        Text("Os endereços caastrados aparecerão aqui.")
                            .multilineTextAlignment(.center)
                    }
                    
                } else {
                    List {
                        ForEach(enderecos) { endereco in
                            
                            VStack(
                                alignment: .leading,
                                spacing: 4
                            ) {
                                
                                Text(endereco.nomeCompleto)
                                    .font(.headline)
                                
                                Text(
                                    "\(endereco.logradouro), \(endereco.numero)"
                                )
                                
                                Text(
                                    "\(endereco.bairro)"
                                )
                                
                                Text(
                                    "\(endereco.cidade) - \(endereco.uf)"
                                )
                                .font(.caption)
                                
                            }//VStack
                            
                        }//ForEach
                        .onDelete(
                            perform: remover
                        )
                        
                    }//List
                    
                }
            }//VStack de conteúdo
            .navigationTitle("Meus Endereços")
            
        }//NavigationStack

    }

    private func remover(
        at offsets: IndexSet
    ) {

        for index in offsets {

            context.delete(
                enderecos[index]
            )

        }

        try? context.save()
    }

}
