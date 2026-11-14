import SwiftUI

struct CadastroTarefaView: View {

    @Environment(\.dismiss) private var dismiss

    @Binding var tarefaForm: TarefaFormulario
    var acaoPrincipal: () -> Void

    var body: some View {

        Form {

            Section("Nova Tarefa") {

                TextField(
                    "Descrição",
                    text: $tarefaForm.descricao
                )

                DatePicker(
                    "Data",
                    selection: $tarefaForm.data,
                    displayedComponents: .date
                )

                DatePicker(
                    "Horário",
                    selection: $tarefaForm.horario,
                    displayedComponents: .hourAndMinute
                )

                Button {
                    tarefaForm.status.toggle()
                } label: {
                    Image(systemName:
                            tarefaForm.status
                            ? "checkmark.square.fill"
                            : "square"
                    )
                    .font(.title2)
                }
                .buttonStyle(.plain)
                .foregroundStyle(
                    tarefaForm.status
                    ? .green
                    : .gray
                )
            }

            Section {

                Button {

                    acaoPrincipal()
                    dismiss()

                } label: {

                    HStack {

                        Spacer()

                        Label(
                            "Salvar",
                            systemImage: "square.and.arrow.down"
                        )

                        Spacer()
                    }
                }
            }
        }
        .navigationTitle("Nova Tarefa")
        .navigationBarTitleDisplayMode(.inline)
    }
}
