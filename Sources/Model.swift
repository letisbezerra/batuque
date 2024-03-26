//
//  Model.swift
//
//
//  Created by User on 14/03/24.
//

import Foundation

struct Model: Codable {
    var batuqueiros: [Batuqueiro] = [
        Batuqueiro(nome: "Maria Silva", instrumento: "regente", prioridade: 0),
        Batuqueiro(nome: "Fernanda Santos", instrumento: "regente", prioridade: 0),
        Batuqueiro(nome: "Beatriz Oliveira", instrumento: "regente", prioridade: 0),
        Batuqueiro(nome: "Elias Martins", instrumento: "alfaia", prioridade: 1),
        Batuqueiro(nome: "Peter Almeida", instrumento: "alfaia", prioridade: 1),
        Batuqueiro(nome: "Frederico Lima", instrumento: "alfaia", prioridade: 1),
        Batuqueiro(nome: "Genésio Gomes", instrumento: "alfaia", prioridade: 1),
        Batuqueiro(nome: "Isabela Carvalho", instrumento: "alfaia", prioridade: 1),
        Batuqueiro(nome: "Francisca Fernandes", instrumento: "alfaia", prioridade: 1),
        Batuqueiro(nome: "Théo Vieira", instrumento: "alfaia", prioridade: 1),
        Batuqueiro(nome: "Humberto Barbosa", instrumento: "alfaia", prioridade: 1),
        Batuqueiro(nome: "Pablo Ribeiro", instrumento: "alfaia", prioridade: 1),
        Batuqueiro(nome: "André Lima", instrumento: "alfaia", prioridade: 1),
        Batuqueiro(nome: "Sara Martins", instrumento: "alfaia", prioridade: 1),
        Batuqueiro(nome: "Gabriel Oliveira", instrumento: "alfaia", prioridade: 1),
        Batuqueiro(nome: "Marta Correia", instrumento: "alfaia", prioridade: 1),
        Batuqueiro(nome: "Hélder Duarte", instrumento: "alfaia", prioridade: 1),
        Batuqueiro(nome: "Ana Barbosa", instrumento: "gonguê", prioridade: 2),
        Batuqueiro(nome: "Sofia Alves", instrumento: "gonguê", prioridade: 2),
        Batuqueiro(nome: "Clara Lima", instrumento: "gonguê", prioridade: 2),
        Batuqueiro(nome: "Daniel Silva", instrumento: "gonguê", prioridade: 2),
        Batuqueiro(nome: "Gonçalo Santos", instrumento: "gonguê", prioridade: 2),
        Batuqueiro(nome: "Eva Oliveira", instrumento: "gonguê", prioridade: 2),
        Batuqueiro(nome: "Carlos Costa", instrumento: "gonguê", prioridade: 2),
        Batuqueiro(nome: "Paulo Pereira", instrumento: "agbê", prioridade: 3),
        Batuqueiro(nome: "Joaquim Oliveira", instrumento: "ferro", prioridade: 5),
        Batuqueiro(nome: "Francisco Santos", instrumento: "ferro", prioridade: 5),
        Batuqueiro(nome: "Joaquim Silva", instrumento: "ferro", prioridade: 5),
        Batuqueiro(nome: "Paula Costa", instrumento: "ferro", prioridade: 5),
        Batuqueiro(nome: "Mónica Lima", instrumento: "ferro", prioridade: 5),
        Batuqueiro(nome: "Teresa Almeida", instrumento: "ferro", prioridade: 5),
        Batuqueiro(nome: "Inês Sofia Gomes", instrumento: "caixa", prioridade: 4),
        Batuqueiro(nome: "Luísa Rodrigues", instrumento: "caixa", prioridade: 4),
        Batuqueiro(nome: "Diogo Martins", instrumento: "caixa", prioridade: 4),
        Batuqueiro(nome: "Andreia Carvalho", instrumento: "caixa", prioridade: 4),
        Batuqueiro(nome: "Carla Pereira", instrumento: "caixa", prioridade: 4),
        Batuqueiro(nome: "Jeremias Lima", instrumento: "caixa", prioridade: 4),
        Batuqueiro(nome: "Mariana Costa", instrumento: "xequerê", prioridade: 8),
        Batuqueiro(nome: "Ricardo Oliveira", instrumento: "xequerê", prioridade: 8),
        Batuqueiro(nome: "Lara Martins", instrumento: "xequerê", prioridade: 8),
        Batuqueiro(nome: "Nuno Alves", instrumento: "xequerê", prioridade: 8),
        Batuqueiro(nome: "Leonardo Silva", instrumento: "xequerê", prioridade: 8),
        Batuqueiro(nome: "Estella Santos", instrumento: "xequerê", prioridade: 8),
        Batuqueiro(nome: "Rita Costa", instrumento: "agogô", prioridade: 7),
        Batuqueiro(nome: "Miguel Oliveira", instrumento: "agogô", prioridade: 7),
        Batuqueiro(nome: "Filipe Pereira", instrumento: "agogô", prioridade: 7),
        Batuqueiro(nome: "Melany Almeida", instrumento: "agogô", prioridade: 7),
        Batuqueiro(nome: "Stevão Gomes", instrumento: "agogô", prioridade: 7),
        Batuqueiro(nome: "Jurema Lima", instrumento: "agogô", prioridade: 7),
        Batuqueiro(nome: "Tiago Costa", instrumento: "agbê", prioridade: 3),
        Batuqueiro(nome: "Carolina Pereira", instrumento: "agbê", prioridade: 3),
        Batuqueiro(nome: "Patrícia Martins", instrumento: "agbê", prioridade: 3),
        Batuqueiro(nome: "Lúcia Oliveira", instrumento: "agbê", prioridade: 3),
        Batuqueiro(nome: "Cláudia Almeida", instrumento: "agbê", prioridade: 3),
        Batuqueiro(nome: "Catarina Rodrigues", instrumento: "bumbo", prioridade: 6),
        Batuqueiro(nome: "Simão Oliveira", instrumento: "bumbo", prioridade: 6),
        Batuqueiro(nome: "Inácio Santos", instrumento: "bumbo", prioridade: 6),
        Batuqueiro(nome: "Simas Costa", instrumento: "bumbo", prioridade: 6),
        Batuqueiro(nome: "Bruno Freitas", instrumento: "bumbo", prioridade: 6),
        Batuqueiro(nome: "Leticia Bezerra", instrumento: "bumbo", prioridade: 6),
        Batuqueiro(nome: "Marcos Freitas", instrumento: "caixa", prioridade: 4),
        Batuqueiro(nome: "Maria Borges", instrumento: "ferro", prioridade: 5),
        Batuqueiro(nome: "Marcio de Sá", instrumento: "caixa", prioridade: 4)
    ]

    static func saveIfEmpty() {
        let batuqueirosFilename = "batuqueiros.json"
        do {
            let files = try Persistence.listContents(folder: "")
            if !files.contains(batuqueirosFilename) {
                try Persistence.saveJson(Model(), file: batuqueirosFilename)
            }
        } catch {
            print(error)
        }
    }
}

struct Batuqueiro: Codable {
    let nome: String
    let instrumento: String
    let prioridade: Int
}
