import SwiftUI
import SwiftData

struct CadastroEnderecoView: View {

    @State private var viewModel = CadastroEnderecoViewModel()

    
    @Environment(\.modelContext)
    private var context

    var body: some View {
        NavigationStack {
            
            VStack {
                Form {
                    
                    Section ("Dados de Usuário") {
                        TextField(
                            "Nome Completo",
                            text: $viewModel.nomeCompleto
                        )
                        
                        TextField(
                            "CEP",
                            text: $viewModel.cep
                        )
                        .keyboardType(.numberPad)
                        .onChange(of: viewModel.cep) {
                            if viewModel.cep.count == 8 {
                                Task {
                                    await viewModel.consultacep()
                                }
                            }
                        }
                        
                    }
                    
                    
                    Section ("Endereço") {
                        TextField(
                            "Estado",
                            text: $viewModel.uf
                        )
                        .disabled(true)
                        
                        TextField(
                            "Cidade",
                            text: $viewModel.cidade
                        )
                        .disabled(true)
                        
                        TextField(
                            "Bairro",
                            text: $viewModel.bairro
                        )
                        .disabled(true)
                        TextField(
                            "Logradouro",
                            text: $viewModel.logradouro
                        )
                        .disabled(true)
                        
                        TextField(
                            "Número",
                            text: $viewModel.numero
                        )
                        
                        if viewModel.carregando {
                            ProgressView()
                        }
                    }
                    
                    Section {
                        Button {
                            let endereco = EnderecoEntity(
                                nomeCompleto: viewModel.nomeCompleto,
                                cep: viewModel.cep,
                                logradouro: viewModel.logradouro,
                                numero: viewModel.numero,
                                bairro: viewModel.bairro,
                                cidade: viewModel.cidade,
                                uf: viewModel.uf
                            )
                            viewModel.salvar(context: context, endereco: endereco)
                        }label: {
                            Label(
                                "Cadastrar endereço",
                                systemImage: "plus.circle.fill"
                            )
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .disabled(!viewModel.podeSalvar)
        
                }//Form
            }//VStack
            .navigationTitle("Novo Cadastro")
        
            
        } //NavigationStack
    }
}

#Preview {
    CadastroEnderecoView()
}
