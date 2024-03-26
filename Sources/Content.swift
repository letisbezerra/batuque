//
//  Content.swift
//
//

import Foundation

struct Content {
    // Insere as citações nas listas
    var culturaContent: [String] = ["Sem a cultura, e a liberdade relativa que ela pressupõe, a sociedade, por mais perfeita que seja, não passa de uma selva. - Albert Camus", "Quem tem imaginação, mas não tem cultura, possui asas, mas não tem pés. - Joseph Joubert", "A cultura, sob todas as formas de arte, de amor e de pensamento, através dos séculos, capacitou o homem a ser menos escravizado. - André Malraux"]
    
    var maracatuContent: [String] = ["O meu maracatu pesa uma tonelada. - Chico Science", "Carrego pra onde vou / O peso do meu som / Lotando minha bagagem. - Chico Science", "⁠Os Caboclos de Lança / fazem a saudação, Sou o teu Maracatu / de Baque Solto / dançando seu coração. - Anna Flávia "]
    
    var musicaContent: [String] = ["A música retrata o passado, ilustra o presente e verbaliza o futuro. - Thais Ambrósio", "E aqueles que foram vistos dançando foram julgados insanos por aqueles que não podiam escutar a música. - Friedrich Nietzsche", "A música expressa o que não pode ser dito em palavras mas não pode permanecer em silêncio. - Victor Hugo.", "A música é capaz de reproduzir, em sua forma real, a dor que dilacera a alma e o sorriso que inebria. - Ludwig van Beethoven."]

    // Converte o array de citações em um arquivo de texto limpo
    func saveQuotes() {
        do {
            try Persistence.savePlainText(content: culturaContent, path: "cultura.txt")
            try Persistence.savePlainText(content: musicaContent, path: "musica.txt")
            try Persistence.savePlainText(content: maracatuContent, path: "maracatu.txt")
        } catch {
            print(error)
        }
        
    }
}
