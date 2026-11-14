import SwiftUI

struct TarefaFormSheet: View {
    
    let titulo: String
    let textoBotao: String
    @Binding var tarefaForm: TarefaFormulario //cria ligação direta com a View pai
    //Ação do botão principal (cdastrar ou editar
    var acaoPrincipal: () -> Void
    
    //Função nativa do sistema
    @Environment(\.dismiss)     private var fechar
    
    var body: some View {
        
        NavigationStack {
            
            Form {
                Section("Tarefa") {
                    
                    HStack{
                        Button {
                            tarefaForm.status.toggle()
                        } label: {
                            Image(systemName:
                                    !tarefaForm.status
                                    ? "square"
                                    : "checkmark.square.fill"
                            )
                            .font(.title2)
                        }
                        .buttonStyle(.plain)
                        .foregroundStyle(
                            tarefaForm.status
                            ? .green
                            : .gray
                        )
                        
                        Spacer()
                        
                        VStack{
                            TextField("Tarefa", text: $tarefaForm.descricao)
                            
                            DatePicker(
                                "Data",
                                selection: $tarefaForm.data,
                                displayedComponents: .date
                            )

                            DatePicker(
                                "Horário",
                                selection: $tarefaForm.horario,
                                displayedComponents: .hourAndMinute
                            )
                        }
                        
                    }
                    
                }//Section
            } //Form
            
        } //NavigationStack
        .navigationTitle(titulo)
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancelar") { fechar()}
            };
            ToolbarItem(placement: .confirmationAction) {
                Button(textoBotao) {
                    acaoPrincipal()
                }
            }
        }
    }
}

