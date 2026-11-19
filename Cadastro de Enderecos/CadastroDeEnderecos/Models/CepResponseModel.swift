struct CepResponseModel: Codable {

    let cep: String
    let logradouro: String
    let complemento: String
    let bairro: String
    let cidade: String
    let uf: String
    let codigoIBGE: String

    enum CodingKeys: String, CodingKey {
        case cep
        case logradouro
        case complemento
        case bairro
        case cidade = "localidade"
        case uf
        case codigoIBGE = "ibge"
    }
}
