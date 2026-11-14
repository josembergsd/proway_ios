import SwiftUI

struct ResumoView: View {
    
    var totalTarefas: Int
    var concluidas: Int
    var pendentes: Int
    
    var body: some View {
        HStack(spacing: 40) {
            VStack {
                Image(systemName: "list.bullet.clipboard")
                Text("\(totalTarefas)")
                    .font(.title)
                    .bold()

                Text("Total")
            }//VStack
            VStack {
                Image(systemName: "checkmark.circle")
                    .foregroundStyle(.green)
                
                Text("\(concluidas)")
                    .font(.title)
                    .bold()
                    .foregroundStyle(.green)

                Text("Concluidas")
            }

            VStack {
                Image(systemName: "plus.circle")
                    .foregroundStyle(.red)
                
                Text("\(pendentes)")
                    .font(.title)
                    .bold()
                    .foregroundStyle(.red)

                Text("Pendentes")
            }
        }//HStack
    }
}
