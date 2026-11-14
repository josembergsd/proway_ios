import SwiftUI
import Observation

@MainActor
@Observable
class TarefaViewModel {
    
    var listaDeTarefas: [TarefaModel] = []
    
    var tarefaCadastro = TarefaFormulario()
    var tarefaEdicao = TarefaFormulario()
    
    var totalTarefas: Int {
        listaDeTarefas.count
    }
    var concluidas: Int {
        listaDeTarefas.filter { $0.status }.count
    }
    var pendentes: Int {
        listaDeTarefas.filter { !$0.status }.count
    }
    
    func cadastrar() -> String? {
        guard let novaTarefa = tarefaCadastro.converterFormularioToModelo() else {
            return "Falha ao cadastrar a tarefa!"
        }
        
        listaDeTarefas.append(novaTarefa)
        tarefaCadastro.clear()
        
        return nil
    }
    
    func prepareTarefaToEdit(task: TarefaModel) {
        tarefaEdicao = .preencherFormulario(tarefa: task)
    }
    
    func editar() -> String? {
        
        guard let tarefaEditada = tarefaEdicao.converterFormularioToModelo() else {
            return "Falha ao editar Tarefa"
        }
        
        guard let indice = listaDeTarefas.firstIndex(where: { $0.id == tarefaEditada.id} ) else {
            return "Tarefa não encontrada!"
        }
        
        listaDeTarefas[indice] = tarefaEditada
        
        return nil
    }
    
    func remove(indice: IndexSet) {
        listaDeTarefas.remove(atOffsets: indice)
    }
}
