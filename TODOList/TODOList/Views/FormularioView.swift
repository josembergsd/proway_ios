import SwiftUI

//Struct - Formulário
struct FormularioView: View {
    
    @State private var viewModel = TarefaViewModel()
    @State private var dataHora = Date()
    
    var body: some View {
        
        Form {
            
            Section ("Tarefa") {
                TextField("Descrição", text: $viewModel.tarefaCadastro.descricao)
            }
            
            Section("Agendamento") {
                DatePicker(
                    "Data:",
                    selection: $dataHora,
                    displayedComponents: .date)
                
                DatePicker(
                    "Hora:",
                    selection: $dataHora,
                    displayedComponents: .date)
            }
            
            Section("Status") {
                Toggle(
                    "Concluída",
                    isOn: $viewModel.tarefaCadastro.status
                )
            }
            
            Section {
                Button {
                    let formatterData = DateFormatter()
                    formatterData.dateFormat = "dd/MM/yyy"
                    
                    let formatterHora = DateFormatter()
                    formatterHora.dateFormat = "HH:mm"
                    
                    viewModel.tarefaCadastro.data = dataHora   //formatterData.string(from: dataHora)
                    viewModel.tarefaCadastro.horario = dataHora // formatterHora.string(from: dataHora)
                    
                    _ = viewModel.cadastrar()
                } label: {
                    Label(
                        "Cadastrar Tarefa",
                        systemImage: "plus.cricle.fill"
                    )
                    .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
            }
            .navigationTitle("Nova Tarefa")
        }//Form
    }
    
}//Fim FormularioView


