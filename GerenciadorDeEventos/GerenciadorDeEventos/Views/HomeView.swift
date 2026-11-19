import SwiftUI

struct HomeView: View {

    var body: some View {

        TabView {

            CadastroEnderecoView()
                .tabItem {
                    Label(
                        "Cadastro",
                        systemImage: "person.badge.plus"
                    )
                }

            ListaEnderecoView()
                .tabItem {
                    Label(
                        "Endereços",
                        systemImage: "list.bullet"
                    )
                }
        }

    }
}

#Preview {
    HomeView()
}
