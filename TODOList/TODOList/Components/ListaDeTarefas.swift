import SwiftUI

struct ListaDeTarefas: View {
    
    @State private var viewModel = TarefaViewModel()
    
    // 2. Controles de abertura das folhas modais (Sheets)
   @State private var exibirCadastro = false
   @State private var exibirEdicao = false
       
   // 3. Controles para exibição do Alerta de erro (Abordagem da Opção 1 com booleano)
   @State private var exibirAlerta = false
   @State private var mensagemErro = ""
    
    var body: some View {
        
        
        NavigationStack {
            
            VStack {
                //Resumo
                ResumoView(
                    totalTarefas: viewModel.totalTarefas,
                    concluidas: viewModel.concluidas,
                    pendentes: viewModel.pendentes
                )
                .padding()
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding(.horizontal)
                
                Divider()
                    .padding(15)
                
                List {
                    
                    if viewModel.listaDeTarefas.isEmpty {
                        ContentUnavailableView {
                            VStack(spacing: 16) {
                                Image(systemName: "pencil.and.list.clipboard")
                                    .font(.system(size: 90, weight: .light))
                                    .foregroundStyle(.blue)

                                Text("Não há tarefas para exibir")
                                    .font(.title2)
                                    .fontWeight(.bold)
                            }
                        } description: {
                            Text("Toque no botão adicionar (+) para inserir uma tarefa")
                                .multilineTextAlignment(.center)
                        }
                    } else {
                        
                        //Lista de tarefas
                        ForEach($viewModel.listaDeTarefas) { $tarefa in
                            LinhaListaTarefa(
                                tarefa: $tarefa,
                                exibirEdicao: $exibirEdicao
                            ) { tarefaSelecionada in
                                viewModel.prepareTarefaToEdit(task: tarefaSelecionada)
                                exibirEdicao = true
                            }
                            
                        } //ForEach
                        .onDelete(perform: viewModel.remove)
                        
                    }//if - else
                }//List
                .navigationTitle("Listagem de Tarefas")
                .navigationSubtitle("Organize seu dia, conquiste seus objetivos")
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {

                        NavigationLink {
                            CadastroTarefaView (
                                tarefaForm: $viewModel.tarefaCadastro,
                                acaoPrincipal: {
                                    if let erro = viewModel.cadastrar() {
                                        mensagemErro = erro
                                        exibirAlerta = true
                                    }
                                }
                            )
                        } label: {
                            Image(systemName: "plus")
                        }//NavigationLink
                        
                    }//ToolbarItem
                    
                }//Sheet de cadastro
                //Sheet de edição
                .sheet(isPresented: $exibirEdicao) {
                    TarefaFormSheet (
                        titulo: "Editar",
                        textoBotao: "Editar Tarefa",
                        tarefaForm: $viewModel.tarefaEdicao,
                        acaoPrincipal: {
                            if let erro = viewModel.editar() {
                                mensagemErro = erro
                                exibirAlerta = true
                            } else {
                                exibirEdicao = false
                            }
                        }
                    )
                }//Sheet de edição
                //Alerta genérico de erro a validação do converter() falhe
                .alert("Ateção", isPresented: $exibirAlerta) {
                    Button("OK", role: .cancel) {}
                } message: {
                    Text(mensagemErro)
                }
            }//Fim VStack
            
        }//NavigationStack
    }
}
    
