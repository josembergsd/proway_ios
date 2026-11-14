import SwiftUI
import Foundation

struct TarefaModel: Identifiable, Codable {
    var id = UUID()
    var descricao: String = ""
    var data: Date
    var horario: Date
    var status: Bool
}
    