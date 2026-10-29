// xcode: set sdk=iOS

import SwiftUI


struct Aluno: Identifiable {
    let id = UUID()
    var nome: String = ""
    var nota1: Double = 0.0
    var nota2: Double = 0.0
    var media: Double { (nota1 + nota2) / 2}
    var situacaoAcademica: String { media >= 7 ? "APROVADO" : "REPROVADO"}
}

struct HeaderView: View {
    
    var body: some View {
        VStack {
            Image(systemName: "graduationcap")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundStyle(.orange)
                .padding(.top, 30)
            
            Text("MINHA TURMA")
                .font(.largeTitle)
                .foregroundStyle(.black)
                .bold()
            
            Text("Cadastre alunos e acompanhe os resultados.")
                .font(.title3)
                .foregroundStyle(.gray)
        }
    }
}


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

struct ResumeView: View {
    
    let totalAlunos: Int
    let aprovados: Int
    let reprovados: Int
    
    var body: some View {
        HStack (spacing: 40) {
            VStack {
                Image(systemName: "persons.3")
                Text("\(totalAlunos)")
                    .font(.title)
                    .bold()

                Text("Total")
            }

            VStack {
                Image(systemName: "checkmark.circle")
                    .foregroundStyle(.green)
                
                Text("\(aprovados)")
                    .font(.title)
                    .bold()
                    .foregroundStyle(.green)

                Text("Aprovados")
            }

            VStack {
                Image(systemName: "plus.circle")
                    .foregroundStyle(.red)
                
                Text("\(reprovados)")
                    .font(.title)
                    .bold()
                    .foregroundStyle(.red)

                Text("Reprovados")
            }
        }
    }
}


struct ListView: View {

    @Binding var alunos: [Aluno]
    
    private func removerAluno (_ aluno: Aluno) {
        alunos.removeAll { $0.id == aluno.id }
    }
    
    var body: some View {
        
        List(alunos) { aluno in
            
            HStack {
                VStack(alignment: .leading) {
                    HStack {
                        VStack(alignment: .leading) {
                            
                            Text(aluno.nome)
                                .font(.headline)
                            
                            Text(aluno.situacaoAcademica)
                                .foregroundStyle(aluno.media >= 7 ? .green : .red)
                            
                        }
                        Spacer()
                        
                        Button {
                            removerAluno(aluno)
                        } label: {
                            Image(systemName: "trash")
                                .foregroundColor(.red)
                        }
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("Nota 1")
                            .font(.caption)
                        Spacer()
                        Text("Nota 2")
                            .font(.caption)
                        Spacer()
                        Text("Media")
                            .font(.caption)
                    }
                    HStack {
                        Text("\(aluno.nota1, specifier: "%.1f")")
                            .font(.caption)
                        Spacer()
                        Text("\(aluno.nota2, specifier: "%.1f")")
                            .font(.caption)
                        Spacer()
                        Text("\(aluno.media, specifier: "%.1f")")
                            .font(.caption)
                            .foregroundStyle(aluno.media >= 7 ? .green : .red)
                    }
                    
                }
                
            }
        }
    }
}


struct ContentView: View {
    
    @State private var alunos: [Aluno] = []
    
    //Filtros para contagem
    var totalAlunos: Int {
        alunos.count
    }

    var aprovados: Int {
        alunos.filter { $0.media >= 7 }.count
    }

    var reprovados: Int {
        alunos.filter { $0.media < 7 }.count
    }

    
    var body: some View {
        
        ZStack{
            
            VStack(spacing: 10) {
                HeaderView()
    
                FormView(alunos: $alunos) //Binding necessário para que o formulário possa alterar a lista
                
                ResumeView(
                    totalAlunos: totalAlunos,
                    aprovados: aprovados,
                    reprovados: reprovados
                )
                
                ListView(alunos: $alunos) //Aqui não usa Biding porque haverá somente leitura
            }
        } //ZStack
    }
}
 


#Preview {
    ContentView()
}
