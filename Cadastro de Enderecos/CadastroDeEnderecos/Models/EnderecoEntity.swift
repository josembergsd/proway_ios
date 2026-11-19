import SwiftData


@Model
final class EnderecoEntity {

    var nomeCompleto: String
    var cep: String
    var logradouro: String
    var numero: String
    var bairro: String
    var cidade: String
    var uf: String

    init(
        nomeCompleto: String,
        cep: String,
        logradouro: String,
        numero: String,
        bairro: String,
        cidade: String,
        uf: String
    ) {

        self.nomeCompleto = nomeCompleto
        self.cep = cep
        self.logradouro = logradouro
        self.numero = numero
        self.bairro = bairro
        self.cidade = cidade
        self.uf = uf
    }
}



