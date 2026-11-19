import Foundation

class EnderecoService {
    //URL Base
    private let baseURL = "https://viacep.com.br/ws/"
    
    func buscarCep(_ cep: String) async throws -> CepResponseModel {

        guard let url =
            URL(string: "\(baseURL)\(cep)/json/")
        else {
            throw URLError(.badURL)
        }

        let (dados, resposta) =
            try await URLSession.shared.data(from: url)

        guard let httpResponse =
                resposta as? HTTPURLResponse,
              httpResponse.statusCode == 200
        else {
            throw URLError(.badServerResponse)
        }

        return try JSONDecoder().decode(
            CepResponseModel.self,
            from: dados
        )
    }
}
