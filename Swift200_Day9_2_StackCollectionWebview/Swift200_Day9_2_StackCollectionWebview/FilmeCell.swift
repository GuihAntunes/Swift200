//
//  FilmeCell.swift
//  Swift200_Day9_2_StackCollectionWebview
//
//  Created by Swift on 05/11/16.
//  Copyright © 2016 Guihsoft. All rights reserved.
//

import UIKit

class FilmeCell: UITableViewCell {

    @IBOutlet weak var imagemPoster: UIImageView!
    @IBOutlet weak var imagemFundo: UIImageView!
    
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var descricao: UILabel!
    @IBOutlet weak var estrelas: UILabel!
    @IBOutlet weak var direcao: UILabel!
    @IBOutlet weak var duracao: UILabel!
    @IBOutlet weak var classificacao: UILabel!
    
    func atualizar(paraFilme filme:Filme){
        
        titulo.text         = filme.nome
        descricao.text      = filme.sinopse
        direcao.text        = filme.direção
        duracao.text        = "\(filme.duração) min."
        classificacao.text  = filme.classificação
        imagemPoster.image  = filme.poster
        imagemFundo.image   = filme.poster
        
    }
    

}
