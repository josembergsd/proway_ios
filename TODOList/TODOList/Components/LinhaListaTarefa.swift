import SwiftUI

struct LinhaListaTarefa: View {
    
    @Binding var tarefa: TarefaModel
    //var viewModel = TarefaViewModel()
    @Binding var exibirEdicao: Bool
    
    let aoEditar: (TarefaModel) -> Void
    
    var body: some View {
       
        HStack {
            Button {
                tarefa.status.toggle()
            } label: {
                Image(systemName:
                        tarefa.status
                        ? "checkmark.square.fill"
                        : "square"
                )
                .font(.title2)
            }
            .buttonStyle(.plain)
            .foregroundStyle(
                tarefa.status
                ? .green
                : .gray
            )
            
            VStack(alignment: .leading, spacing: 4) {
                
                Text(tarefa.descricao)
                    .font(.headline)
                
                Text("Data: \(tarefa.data)")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            
            
        }//HStack
        .contentShape(Rectangle())
        .onTapGesture {
            aoEditar(tarefa)
            exibirEdicao = true
        }
    }
}
