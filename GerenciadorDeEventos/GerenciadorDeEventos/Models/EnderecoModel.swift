import Foundation

struct EnderecoModel: Codable, Identifiable {
    
    var id: UUID = UUID()
    var nomeCompleto: String = ""
    
    //Campos do endereço preenchidos automaticamente pela API de cep, com excessão do número
    var cep: String
    var uf: String
    var cidade: String
    var bairro: String
    var logradouro: String
    var numero: String
    var complemento: String
    var codigoIBGE: String
    
}
