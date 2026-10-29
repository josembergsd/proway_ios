import SwiftUI

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
