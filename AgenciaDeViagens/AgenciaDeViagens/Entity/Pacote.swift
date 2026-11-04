import Foundation
import SwiftUI

//Modelo de Local
struct Pacote: Identifiable {
    let id = UUID()
    let tituloPacote: String
    let destino: String
    let qtdDiarias: Int
    let dataPartida: String
    let dataRetorno: String
    let infoHospedagem: String
    let foto: String
    let precoPacote: Double
    var favorito: Bool
}
