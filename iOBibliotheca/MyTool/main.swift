import Foundation

//Funcionalidades
//Cadastrar
//Buscar
//Listar
//Editar
//Remover
//Interface

let biblioteca = Biblioteca()

var executando = true

protocol Documento {
    var id: UUID { get }
    
    func exibirDetalhes()
}

class Livro: Documento {
    let id: UUID
    private(set) var titulo: String = ""
    private(set) var autor: String = ""
    private(set) var anoPublicacao: Int
    private(set) var isEmprestado: Bool
    
    init(
        id: UUID = UUID(),
        titulo: String,
        autor: String,
        anoPublicacao: Int,
        isEmprestado: Bool = false
    ){
            self.id = id
            self.titulo = titulo
            self.autor = autor
            self.anoPublicacao = anoPublicacao
            self.isEmprestado = isEmprestado
    }
    
    func atualizarTitulo(_ novoTitulo: String) {
        titulo = novoTitulo
    }
    
    func atualizarAutor(_ novoAutor: String) {
        autor = novoAutor
    }
    
    func atualizarAnoPublicacao(_ novoAno: Int) {
        anoPublicacao = novoAno
    }
    
    func emprestar() {
        guard !isEmprestado else {
            print("Livro já está emprestado.")
            return
        }
        
        isEmprestado = true
    }
    
    func devolver() {
        guard !isEmprestado else {
            print("Livro já está disponível")
            return
        }
        
        isEmprestado = false
    }
    
    func exibirDetalhes() {
        print("""
        ---------------------------------
        ID: \(id.uuidString) 
        Título: \(titulo)
        Autor: \(autor)
        Ano: \(anoPublicacao)
        Emprestado: \(isEmprestado ? "Sim" : "Não")
        ---------------------------------
        """)
    }
    
}

enum OpcaoMenu: String {
    case cadastrar = "1"
    case listar = "2"
    case buscar = "3"
    case remover = "4"
    case sair = "0"
}

class LivroDigital: Livro {
    let tamanhoEmMB: Double
    
    init(
        titulo: String,
        autor: String,
        anoPublicacao: Int,
        tamanhoEmMB: Double
    ) {
        self.tamanhoEmMB = tamanhoEmMB
        
        super.init(
            titulo: titulo,
            autor: autor,
            anoPublicacao: anoPublicacao,
            isEmprestado: false
        )
    }
    
    override func exibirDetalhes() {
        super.exibirDetalhes()
        print("Tamanho: \(tamanhoEmMB) MB")
    }
}

class Biblioteca {

    private var livros: [Livro] = []

    func cadastrar(_ livro: Livro) {

        if livros.contains(where: { $0.id == livro.id }) {
            print("Já existe um livro com este ID.")
            return
        }

        livros.append(livro)
        print("Livro cadastrado com sucesso.")
    }

    func listarTodos() {

        if livros.isEmpty {
            print("Nenhum livro cadastrado.")
            return
        }

        livros.forEach {
            $0.exibirDetalhes()
        }
    }

    func buscarPorId(_ id: UUID) -> Livro? {
        livros.first { $0.id == id }
    }

    func buscarPorTitulo(_ trecho: String) -> [Livro] {

        livros.filter {
            $0.titulo.lowercased().contains(trecho.lowercased())
        }
    }

    func remover(id: UUID) {

        livros.removeAll {
            $0.id == id
        }
    }
}


while executando {

    print("""

    ===== BIBLIOTECA =====
    1 - Cadastrar livro
    2 - Listar livros
    3 - Buscar por título
    4 - Remover livro
    0 - Sair

    Escolha:
    """, terminator: " ")

    guard let opcao = readLine() else {
        continue
    }

    switch opcao {

    case "1":

        print("Título:")
        let titulo = readLine() ?? ""

        print("Autor:")
        let autor = readLine() ?? ""

        print("Ano:")
        let ano = Int(readLine() ?? "") ?? 0

        let livro = Livro(
            titulo: titulo,
            autor: autor,
            anoPublicacao: ano
        )

        biblioteca.cadastrar(livro)

    case "2":
        biblioteca.listarTodos()

    case "3":
        print("Trecho do título:")
        let busca = readLine() ?? ""

        let resultados = biblioteca.buscarPorTitulo(busca)

        if resultados.isEmpty {
            print("Nenhum resultado encontrado.")
        } else {
            resultados.forEach {
                $0.exibirDetalhes()
            }
        }

    case "4":

        print("ID:")
        if let texto = readLine(),
           let id = UUID(uuidString: texto) {

            biblioteca.remover(id: id)
            print("Livro removido.")
        }

    case "0":
        executando = false

    default:
        print("Opção inválida.")
    }
}
