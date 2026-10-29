import SwiftUI

struct ListView: View {

    let alunos: [Aluno]
    
    var body: some View {
        
        List(alunos) { aluno in
            
            HStack {
            
                VStack (alignment: .leading) {
                    
                    Text(aluno.nome)
                        .font(.headline)
                    
                    Text("Media \(aluno.media, specifier: "%.1f")")
                        .font(.caption)
                }
                
                Spacer()
                
                Text(aluno.situacaoAcademica)
                    .foregroundStyle(aluno.media >= 7 ? .green : .red)
            }
        }
    }
}
