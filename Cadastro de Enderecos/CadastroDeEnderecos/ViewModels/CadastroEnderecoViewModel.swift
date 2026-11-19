import SwiftUI
import Observation
import SwiftData

@MainActor
@Observable
class CadastroEnderecoViewModel {
    
        //Dados do formulário

        var nomeCompleto = ""
        var cep = ""

        var uf = ""
        var cidade = ""
        var bairro = ""
        var logradouro = ""

        var numero = ""

        var complemento = ""
        var codigoIBGE = ""
    
        // Controle de tela

        var carregando = false
        var mensagemErro: String?

        // MARK: - Dependências

        private let service = EnderecoService()

        // MARK: - Consulta CEP
    
    func consultacep() async {
        
        guard !cep.isEmpty else {
            mensagemErro = "Informe um CEP válido"
            return
        }
        
        carregando = true
        mensagemErro = nil
        
        defer { carregando = false }
        
        do {
            let endereco = try await service.buscarCep(
                cep,
            )
            
            uf = endereco.uf
            cidade = endereco.cidade
            bairro = endereco.bairro
            logradouro = endereco.logradouro
            complemento = endereco.complemento
            codigoIBGE = endereco.codigoIBGE
            
        } catch {
            mensagemErro = error.localizedDescription
            print("Erro ao consultar CEP: \(error)")
        }
    }//consultaCep
    
    func limparFormulario() {

            nomeCompleto = ""
            cep = ""
            uf = ""
            cidade = ""
            bairro = ""
            logradouro = ""
            numero = ""
            complemento = ""
            codigoIBGE = ""

            mensagemErro = nil
        }
    
    var podeSalvar: Bool {
            !nomeCompleto.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
            !cep.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
            !logradouro.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
            !numero.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        }
    
    func salvar(context: ModelContext,
                endereco: EnderecoEntity) {
        
        context.insert(endereco)

        do {

            try context.save()
            
        } catch {

            print("❌ Erro ao salvar: \(error)")

        }
        
        limparFormulario()
    }
    
}
