//
//  Content.swift
//
//

import Foundation

struct Content {
    // Insere as citações nas listas
    var culturaContent: [String] = ["Sem a cultura, e a liberdade relativa que ela pressupõe, a sociedade, por mais perfeita que seja, não passa de uma selva. - Albert Camus", "Quem tem imaginação, mas não tem cultura, possui asas, mas não tem pés. - Joseph Joubert", "A cultura, sob todas as formas de arte, de amor e de pensamento, através dos séculos, capacitou o homem a ser menos escravizado. - André Malraux", "Esse parque de Ubajara/ No Estado do Ceará/ Tem caverna e cachoeira/ Lugar lindo pra se amar/ Na trilha ou no mirante/ É beleza a todo instante/ Como não se apaixonar? - Rômulo Bourbon", "Cearense, cabra cavador: chega, conversa, controla, com calma... conquista. Começa caixeiro - comerciário; cresce, cresce, comanditário; cresce, cresce, caixa; cresce, cresce... capitalista! - Chico Anysio"]

    var maracatuContent: [String] = ["O meu maracatu pesa uma tonelada. - Chico Science", "Carrego pra onde vou / O peso do meu som / Lotando minha bagagem. - Chico Science", "⁠Os Caboclos de Lança / fazem a saudação, Sou o teu Maracatu / de Baque Solto / dançando seu coração. - Anna Flávia", "O ato de pintar-se ou pintar o outro imprime características ritualísticas peculiares aos ritos dramáticos, visto que indicia o ato de tornar-se outro, o brincante fundindo-se no personagem-símbolo da encenação. - Gilson Costa.", "O negrume também pode ser interpretado como uma máscara cênica de valor mimético, onde o brincante, de rosto pintado, é transportado para um estado que o retira a personalidade civil e lhe investe do personagem o qual representa. - Marcelo Souza"]

    var musicaContent: [String] = ["A música retrata o passado, ilustra o presente e verbaliza o futuro. - Thais Ambrósio", "E aqueles que foram vistos dançando foram julgados insanos por aqueles que não podiam escutar a música. - Friedrich Nietzsche", "A música expressa o que não pode ser dito em palavras mas não pode permanecer em silêncio. - Victor Hugo.", "A música é capaz de reproduzir, em sua forma real, a dor que dilacera a alma e o sorriso que inebria. - Ludwig van Beethoven.", "Desculpe eu pedir a toda hora pra chegar o inverno. Desculpe eu pedir para acabar com o inferno. Que sempre queimou o meu Ceará. - Luiz Gonzaga", "Não há pranto que apague Dos meus olhos o clarão Nem metrópole onde eu não veja O luar, o luar do sertão! - Belchior"]

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
