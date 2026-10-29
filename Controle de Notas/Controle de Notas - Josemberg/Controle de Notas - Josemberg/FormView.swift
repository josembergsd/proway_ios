import SwiftUI

struct FormView: View {
    
    @Binding var alunos: [Aluno]
    
    @State private var nome = ""
    @State private var nota1 = ""
    @State private var nota2 = ""
    
    var body: some View {
        
        Label("Cadatrar aluno", systemImage: "person.badge.plus")
                .bold()
        
        VStack {
            Text("Nome do aluno")
            TextField("Nome do Aluno", text: $nome)
                .padding(10)
                .background(Color(.systemGray6))
                .cornerRadius(5)
            
            HStack {
                Text("Nota 1")
                    .frame(width: 200)
                Text("Nota 2")
                    .frame(width: 200)
            }
            
            HStack (spacing: 10){
                TextField("Nota 1", text: $nota1)
                    .padding(10)
                    .background(Color(.systemGray6))
                    .cornerRadius(5)
                    .keyboardType(.decimalPad)
                
                TextField("Nota 2", text: $nota2)
                    .padding(10)
                    .background(Color(.systemGray6))
                    .cornerRadius(5)
                    .keyboardType(.decimalPad)
            }
            Button {
                guard
                    !nome.trimmingCharacters(in: .whitespaces).isEmpty,
                    let n1 = Double(nota1),
                    let n2 = Double(nota2),
                    n1 >= 0 && n1 <= 10,
                    n2 >= 0 && n2 <= 10
                else {
                    return
                }
                
                alunos.append (
                    Aluno (nome: nome, nota1: n1, nota2: n2)
                )
                
                nome = ""
                nota1 = ""
                nota2 = ""
            } label: {
                Label("Adicionar Aluno", systemImage: "person.fill.badge.plus")
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

