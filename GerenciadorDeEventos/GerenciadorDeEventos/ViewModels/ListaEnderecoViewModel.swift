import SwiftUI
import Observation

@MainActor
@Observable
class ListaEnderecoViewModel {
    
    var enderecos: [EnderecoModel] = []
    
    func adicionar(_ endereco: EnderecoModel) {
        enderecos.append(endereco)
    }
    
    func remover(at offsets: IndexSet) {
        enderecos.remove(atOffsets: offsets)
    }
    
}
