import SwiftUI


struct Aluno: Identifiable {
    let id = UUID()
    var nome: String = ""
    var nota1: Double = 0.0
    var nota2: Double = 0.0
    var media: Double { (nota1 + nota2) / 2}
    var situacaoAcademica: String { media >= 7 ? "APROVADO" : "REPROVADO"}
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
                
                ListView(alunos: alunos) //Aqui não usa Biding porque haverá somente leitura
            }
        } //ZStack
    }
}
 


#Preview {
    ContentView()
}
