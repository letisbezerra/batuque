//
//  Model.swift
//
//
//  Created by User on 14/03/24.
//

import Foundation

struct Model: Codable {
    var batuqueiros: [Batuqueiro]
}

struct Batuqueiro: Codable {
    let nome: String
    let instrumento: String
    let prioridade: Int
}
