import Foundation

struct TarefaFormulario {
    var id: UUID? = nil
    var descricao: String = ""
    var data: Date = Date()
    var horario: Date = Date()
    var status: Bool = false
    
    mutating func clear() {
        id = nil
        descricao = ""
        data = Date.now
        horario = Date.now
        status = false
    }
    
    //Conversores formulário para model
    func converterFormularioToModelo() -> TarefaModel? {
        
        //Formatação
        let textoDescricao = descricao.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !textoDescricao.isEmpty else {
            return nil
        }
        
        let formatterData = DateFormatter()
        formatterData.dateFormat = "dd/MM/yyyy"
        
        let formatterHorario = DateFormatter()
        formatterHorario.dateFormat = "HH:mm"
        
        let dataFormatada = formatterData.string(from: data)
        let horarioFormatado = formatterHorario.string(from: horario)
        
        //Retorna Obj
        if let idExistente = self.id {
            return TarefaModel(
                id: idExistente,
                descricao: textoDescricao,
                data: data,
                horario: horario,
                status: status
            )
        } else {
            return TarefaModel(
                descricao: textoDescricao,
                data: data,
                horario: horario,
                status: status
            )
        }
    }
    
    static func preencherFormulario(
        tarefa: TarefaModel
    ) -> TarefaFormulario {
        
        let formatterData = DateFormatter()
        formatterData.dateFormat = "dd/MM/yyyy"
        
        let formatterHorario = DateFormatter()
        formatterHorario.dateFormat = "HH:mm"
        
        return TarefaFormulario (
            id: tarefa.id,
            descricao: tarefa.descricao,
            data: tarefa.data,    //formatterData.date(from: tarefa.data) ?? Date(),
            horario: tarefa.horario,     //formatterHorario.date(from: tarefa.horario) ?? Date(),
            status: tarefa.status
        )
    }
    
}
