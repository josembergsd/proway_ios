import SwiftUI

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
