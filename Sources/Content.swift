//
//  Content.swift
//
//

import Foundation

struct Content {
    var culturaContent: [String] = ["example 1", "example 2"]
    var maracatuContent: [String] = ["example 1", "example 2"]
    var musicaContent: [String] = ["example 1", "example 2"]
    
    func saveQuotes() {
        do {
            try Persistence.savePlainText(content: culturaContent, path: "cultura.txt")
            try Persistence.savePlainText(content: maracatuContent, path: "musica.txt")
            try Persistence.savePlainText(content: musicaContent, path: "maracatu.txt")
        } catch {
            print(error)
        }
        
    }
}
