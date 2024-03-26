// The Swift Programming Language
// https://docs.swift.org/swift-book
//
// Swift Argument Parser
// https://swiftpackageindex.com/apple/swift-argument-parser/documentation

import Foundation
import ArgumentParser

//--------- Função de Setup ---------
func setup() {
    Persistence.projectName = "Batuque"
    Model.saveIfEmpty()
}

//------ Função Verbose geral -------
func verbosePrint(verbose: Bool, _ text: String) {
    if verbose {
        print(text)
        sleep(1)
    }
}

//------- Início programa ------
@main
struct Batuque: ParsableCommand {
    struct Options: ParsableArguments {

        @Flag(name: .shortAndLong, help: "Shows the command process")
        var verbose = false
    }

    static var configuration = CommandConfiguration(
        abstract: "Generator of lists of batuque and quotes.",
        discussion: """

        888888b.            888
        888  "88b           888
        888  .88P           888
        8888888K.   8888b.  888888 888  888  .d88888 888  888  .d88b.
        888  "Y88b     "88b 888    888  888 d88" 888 888  888 d8P  Y8b
        888    888 .d888888 888    888  888 888  888 888  888 88888888
        888   d88P 888  888 Y88b.  Y88b 888 Y88b 888 Y88b 888 Y8b.
        8888888P"  "Y888888  "Y888  "Y88888  "Y88888  "Y88888  "Y8888
                                                 888
                                                 888
                                                 888
        
        This tool is designed to generate lists of batuqueiros for Maracatu's
        performances, taking into account the proportion and priority of
        instruments based on a database of batuqueiros, also generating inspiring
        quotes according to the chosen theme.
        By entering the quantity of batuqueiros, it generates a list and adds
        different quotes within the availability of themes.
        It's possible to create, read, update and delete the registered
        batuqueiros. You can also consult the available themes.
        """,
        subcommands: [Recruit.self, Create.self, Read.self, Update.self, Delete.self, Quote.self, Themes.self]
    )

    func run() throws {
        setup()
    }
}

//------ Início CRUD -------
struct Recruit: ParsableCommand {
    @Option(name: .shortAndLong, help: "Defines the number of batuqueiros between 10 and 50 and create a propotional list considering the instruments priority.")
    var length: Int
    @OptionGroup var options: Batuque.Options

    func addBat(batuqueiros: [Batuqueiro], instrumento: String, listaBat: inout [Batuqueiro]) {
        for batuqueiro in batuqueiros where batuqueiro.instrumento == instrumento {
            listaBat.append(batuqueiro)
        }
    }
    
    var batuqueirosSorteados: [Batuqueiro] = []
    mutating func sorteiaBat(qntBat: Int, bats: inout [Batuqueiro]) {
        for _ in 1...qntBat {
            guard let index = bats.indices.randomElement() else { break }
            let batuqueiroSorteado = bats.remove(at: index)
            batuqueirosSorteados.append(batuqueiroSorteado)
        }
    }

    mutating func run() throws {
        setup()
        guard (10...50).contains(length) else {
            print("---> Por favor, insira um número entre 10 e 50 <---")
            throw CleanExit.helpRequest(self)
        }

        //      ------ Sorteio regente ------------
        var regentes: [Batuqueiro] = []
        let model: Model = try Persistence.readJson(file: "batuqueiros.json")
        for batuqueiro in model.batuqueiros where batuqueiro.instrumento == "regente" {
            regentes.append(batuqueiro)
        }
        let regenteSorteado = regentes.randomElement()!

        //      ------ Início função batuqueiros ------
        var alfaias: [Batuqueiro] = []
        var gongues: [Batuqueiro] = []
        var agbes: [Batuqueiro] = []
        var caixas: [Batuqueiro] = []
        var ferros: [Batuqueiro] = []
        var bumbos: [Batuqueiro] = []
        var agogos: [Batuqueiro] = []
        var xequeres: [Batuqueiro] = []

        addBat(batuqueiros: model.batuqueiros, instrumento: "alfaia", listaBat: &alfaias)
        addBat(batuqueiros: model.batuqueiros, instrumento: "gonguê", listaBat: &gongues)
        addBat(batuqueiros: model.batuqueiros, instrumento: "agbê", listaBat: &agbes)
        addBat(batuqueiros: model.batuqueiros, instrumento: "caixa", listaBat: &caixas)
        addBat(batuqueiros: model.batuqueiros, instrumento: "ferro", listaBat: &ferros)
        addBat(batuqueiros: model.batuqueiros, instrumento: "bumbo", listaBat: &bumbos)
        addBat(batuqueiros: model.batuqueiros, instrumento: "agogô", listaBat: &agogos)
        addBat(batuqueiros: model.batuqueiros, instrumento: "xequerê", listaBat: &xequeres)

        var count: Int = length
        var instruments: [(nome: String, quantidade: Int)] = [
            ("Alfaias", 0),
            ("Gongue", 0),
            ("Agbe", 0),
            ("Caixa", 0),
            ("Ferro", 0),
            ("Bumbo", 0),
            ("Agogo", 0),
            ("Xequere", 0)
        ]

        while count > 0 {
            for index in instruments.indices where count > 0 {
                switch instruments[index].nome {
                case "Alfaias":
                    for _ in 0..<3 where count > 0 {
                        count -= 1
                        instruments[index].quantidade += 1
                    }
                default:
                    count -= 1
                    instruments[index].quantidade += 1
                }
            }
        }

        let qntAlfaias: Int = instruments[0].quantidade
        let qntGongue: Int = instruments[1].quantidade
        let qntAgbe: Int = instruments[2].quantidade
        let qntCaixa: Int = instruments[3].quantidade
        let qntFerro: Int = instruments[4].quantidade
        let qntBumbo: Int = instruments[5].quantidade
        let qntAgogo: Int = instruments[6].quantidade
        let qntXequere: Int = instruments[7].quantidade

        print("\n-> Proporção de instrumentos: \(qntAlfaias) alfaia(s), \(qntGongue) gonguê(s), \(qntAgbe) agbê(s), \(qntCaixa) caixa(s), \(qntFerro) ferro(s), \(qntBumbo) bumbo(s), \(qntAgogo) agogô(s), \(qntXequere) xequerê(s)\n")
        verbosePrint(verbose: options.verbose, "-> Gerando lista...")
        sleep(1)

        batuqueirosSorteados.append(regenteSorteado)
        sorteiaBat(qntBat: qntAlfaias, bats: &alfaias)
        sorteiaBat(qntBat: qntGongue, bats: &gongues)
        sorteiaBat(qntBat: qntAgbe, bats: &agbes)
        sorteiaBat(qntBat: qntCaixa, bats: &caixas)
        sorteiaBat(qntBat: qntFerro, bats: &ferros)
        sorteiaBat(qntBat: qntBumbo, bats: &bumbos)
        sorteiaBat(qntBat: qntAgogo, bats: &agogos)
        sorteiaBat(qntBat: qntXequere, bats: &xequeres)

        //------ Frase inspiração --------
        let content = Content()
        content.saveQuotes()
        
        let maracatu: [String] = (try? Persistence.readPlainText(path: "maracatu.txt")) ?? []
        let citacaoMaracatuSorteada = maracatu.randomElement()!
        print("\n 💭 Frase inspiração: \(citacaoMaracatuSorteada)\n")
        sleep(1)

        //----- Print lista ------
        print("----> Lista de batuqueiros <----\n")
        for batuqueiro in batuqueirosSorteados {
            print("\(batuqueiro.nome) | \(batuqueiro.instrumento)")
        }
    }
}
// ----- Início função create --------
struct Create: ParsableCommand {
    @OptionGroup var options: Batuque.Options
    
    //  ------ Cria os parâmentros do Create -------
    @Argument(help: "Batuqueiro's name and last name in quotes. Ex.: \"Maria da Silva\"")
    var nome: String

    @Argument(help: "Batuqueiro's instrument. Options: regente, alfaia, gonguê, agbê, caixa, ferro, bumbo, agogô, xequerê")
    var instrumento: String

    func run() throws {
        setup()
        var prioridade: Int = 0
        switch instrumento {
        case "regente":
            prioridade = 0
        case "alfaia":
            prioridade = 1
        case "gonguê":
            prioridade = 2
        case "agbê":
            prioridade = 3
        case "caixa":
            prioridade = 4
        case "ferro":
            prioridade = 5
        case "bumbo":
            prioridade = 6
        case "agogô":
            prioridade = 7
        case "xequerê":
            prioridade = 8
            
        default:
            print("---> Please insert a valid instrument <---")
            throw CleanExit.helpRequest(self)
        }
        
        //      ----- Cria novo batuqueiro -----
        let batuqueiro = Batuqueiro(nome: nome, instrumento: instrumento, prioridade: prioridade)

        //      ----- Lendo a lista de batuqueiros -----
        var model: Model = try Persistence.readJson(file: "batuqueiros.json")
        model.batuqueiros.append(batuqueiro)
        verbosePrint(verbose: options.verbose, "\n---> Adicionando novo batuqueiro...")
        sleep(1)

        //      ----- Salva o novo registro no JSON ------
        try Persistence.saveJson(model, file: "batuqueiros.json")
        print("\n---> Registro de \(nome) criado com sucesso.\n")
    }
}

// ------- Início função Read -----
struct Read: ParsableCommand {
    static var configuration = CommandConfiguration(discussion: "\nShows the full list of batuqueiros")
    @OptionGroup var options: Batuque.Options

    func run() throws {
        setup()
        let model: Model = try Persistence.readJson(file: "batuqueiros.json")
        verbosePrint(verbose: options.verbose, "\n---> Gerando lista de batuqueiros...")
        print("\n---> Lista completa de batuqueiros <---\n")
        sleep(2)
        for(index, bat) in model.batuqueiros.enumerated() {
            let displayIndex = index + 1
            print("\(displayIndex-1) Batuqueiro: \(bat.nome) | Instrumento: \(bat.instrumento) | Prioridade: \(bat.prioridade)")
        }
    }
}

// ------- Início função Update -----
struct Update: ParsableCommand {
    @Argument(help: "Batuqueiro's position in the list")
    var posicao: Int

    @Argument(help: "Batuqueiro's new name")
    var nome: String

    @Argument(help: "Batuqueiro's new instrument")
    var instrumento: String

    func run() throws {
        setup()
        var prioridade: Int = 0
        switch instrumento {
        case "regente":
            prioridade = 0
        case "alfaia":
            prioridade = 1
        case "gonguê":
            prioridade = 2
        case "agbê":
            prioridade = 3
        case "caixa":
            prioridade = 4
        case "ferro":
            prioridade = 5
        case "bumbo":
            prioridade = 6
        case "agogô":
            prioridade = 7
        case "xequerê":
            prioridade = 8
            
        default:
            print("---> Por favor, insira um instrumento válido <---")
            throw CleanExit.helpRequest(self)
        }

        //----- Cria (update) novo batuqueiro -----
        let batuqueiro = Batuqueiro(nome: nome, instrumento: instrumento, prioridade: prioridade)

        var model: Model = try Persistence.readJson(file: "Batuqueiros.json")
        model.batuqueiros.remove(at: posicao)

        model.batuqueiros.insert(batuqueiro, at: posicao)

        try Persistence.saveJson(model, file: "batuqueiros.json")
        print("\n---> Os dados do batuqueiro foram atualizados na posição \(posicao)\n")

        for(index, bat) in model.batuqueiros.enumerated() {
            let displayIndex = index + 1
            print("---> \(displayIndex-1) Batuqueiro: \(bat.nome) | Instrumento: \(bat.instrumento) | Prioridade: \(bat.prioridade)")
        }
    }
}

// ------ Início função Delete ------
struct Delete: ParsableCommand {
    @Argument(help: "Batuqueiro's position in the list")
    var posicao: Int
    
    @OptionGroup var options: Batuque.Options

    func run() throws {
        setup()

        //------ Lendo a lista de batuqueiros ------
        var model: Model = try Persistence.readJson(file: "batuqueiros.json")
        model.batuqueiros.remove(at: posicao)

        //------ Salva a alteração na lista ------
        try Persistence.saveJson(model, file: "batuqueiros.json")
        print("\n---> ❌ Registro do batuqueiro na posição \(posicao) foi removido\n")
        verbosePrint(verbose: options.verbose, "\n---> Gerando lista de batuqueiros atualizada...\n")
        sleep(2)

        for(index, bat) in model.batuqueiros.enumerated() {
            let displayIndex = index + 1
            print("---> \(displayIndex-1) Batuqueiro: \(bat.nome) | Instrumento: \(bat.instrumento) | Prioridade: \(bat.prioridade)")
        }
    }
}

//------ Início generate quotes ---------

// quote generate <subject> (Generate.self)
// quote <subject> (default to Generate.self)
// quote themes (Themes.self)

struct Quote: ParsableCommand {
    static var configuration = CommandConfiguration(
        subcommands: [Generate.self, Themes.self],
        defaultSubcommand: Generate.self
    )
}

struct Generate: ParsableCommand {
    enum Subject: String, ExpressibleByArgument, CaseIterable {
        case cultura
        case maracatu
        case musica
    }

    @Option(name: .shortAndLong, help: "Allows to define the subject of a quote.")
    var subject: Subject

    @OptionGroup var options: Batuque.Options

    mutating func run() throws {
        setup()

        let content = Content()
        content.saveQuotes()

        //------- Setup das listas de citações -------
        let cultura: [String] = (try? Persistence.readPlainText(path: "cultura.txt")) ?? []
        let maracatu: [String] = (try? Persistence.readPlainText(path: "maracatu.txt")) ?? []
        let musica: [String] = (try? Persistence.readPlainText(path: "musica.txt")) ?? []

        //------- Sorteio das citações -------
        let citacaoCulturaSorteada = cultura.randomElement()!
        let citacaoMaracatuSorteada = maracatu.randomElement()!
        let citacaoMusicaSorteada = musica.randomElement()!

        //------- Exibição das citações ------
        switch subject {
        case .cultura:
            verbosePrint(verbose: options.verbose, "Escolhendo uma frase inspiração sobre cultura...\n")
            print("\n ---> 💭 Frase inspiração: \(citacaoCulturaSorteada)\n")
        case .maracatu:
            verbosePrint(verbose: options.verbose, "Escolhendo uma frase inspiração sobre maracatu...\n")
            print("\n ---> 💭 Frase inspiração: \(citacaoMaracatuSorteada)\n")
        case .musica:
            verbosePrint(verbose: options.verbose, "Escolhendo uma frase inspiração sobre música...\n")
            print("\n ---> 💭 Frase inspiração: \(citacaoMusicaSorteada)\n")
        }
    }
}
//-------- Início consulta de Themes ------
struct Themes: ParsableCommand {
    static var configuration = CommandConfiguration(discussion: "\nShows the full list of subjects")
    var themes = ["Maracatu", "Cultura", "Música"]
    mutating func run() throws {
        setup()
        print("\n-----> Lista de temas <-----\n")
        for theme in themes {
            print("★ \(theme)\n")
        }
    }
}
