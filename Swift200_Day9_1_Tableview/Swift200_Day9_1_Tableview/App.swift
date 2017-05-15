//
//  App.swift
//  Swift200_Day9_1_Tableview
//
//  Created by Swift on 05/11/16.
//  Copyright © 2016 Guihsoft. All rights reserved.
//

import Foundation

class App {
    
    static let compartilhado = App()
    
    typealias TempoCidade = (nome:String, temperatura:Int, icone:String, bg:String, credito:String)
    
    var dados:[TempoCidade] = [
        ("São Paulo", 19, "☁️", "sp", "By The Photographer"),
        ("Rio de Janeiro", 37, "☀️", "rj", "By Rosino"),
        ("Brasilia", 21, "🌥", "br", "By Fabio Luiz"),
        ("Guarulhos", 20, "⛈", "gr", "By WWF"),
        ("Londrina", 9, "🌧", "ln", "By Wilson Vieira")
    ]
    
    var usarCelsius = true
    
    // Só minha classe vê essa variável, pois ela é para controle interno e não deve ser alterada diretamente
    private var favorita = "São Paulo"
    
    // objetos de fora desta classe favoritam por meio dessa função que valida antes se a cidade existe 😎
    func favoritarCidade(comNome nome:String){
        for cidade in dados {
            if cidade.nome == nome {
                favorita = nome
                return
            }
        }
        
        fatalError("Cidade não encontrada!")
    }
    
    // Função para ler todos os dados de uma cidade
    func dadosDaFavorita() -> TempoCidade {
        for cidade in dados {
            if cidade.nome == favorita {
                return cidade
            }
        }
        
        fatalError("Cidade não encontrada! 🤔")
    }
    
    // Removendo a cidade. Filtramos o vetor, mantendo todo mundo que tem o nome diferente do alvo
    func removeCidade(comNome nome:String){
        dados = dados.filter{ $0.nome != nome }
    }
    
    
}
