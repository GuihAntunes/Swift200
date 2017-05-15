//
//  DetalhesViewController.swift
//  Swift200_Day3_1_ImageView
//
//  Created by Swift on 24/09/16.
//  Copyright © 2016 Guihsoft. All rights reserved.
//

import UIKit

class DetalhesViewController: UIViewController {
    
    var item:String?
    
    @IBOutlet weak var fotinho: UIImageView!
    
    @IBOutlet weak var descrição: UILabel!
    
    var detalhes = [
        "ponte": "O Parque Ibirapuera é o mais importante parque urbano da cidade de São Paulo, no Brasil. Foi inaugurado em 21 de agosto de 1954 para a comemoração do quarto centenário da cidade. Em 2012 e 2013, foi apontado pela rede social Facebook como o local mais popular em todo o Brasil para se fazer check-in.",
        
        "teatro": "O Auditório Ibirapuera é um edifício concebido por Oscar Niemeyer para apresentações de espetáculos musicais. O prédio possui simplicidade volumétrica singular, sendo composto de um bloco único, que em planta tem a forma de um trapézio e, em corte, a forma de um triângulo.",
        
        "obelisco": "O Obelisco Mausoléu aos Heróis de 32, também conhecido como Obelisco do Ibirapuera ou Obelisco de São Paulo, é um monumento funerário brasileiro, símbolo da Revolução Constitucionalista de 1932. É um projeto do escultor ítalo-brasileiro Galileo Ugo Emendabili, que chegou ao Brasil em 1923, fugindo do regime fascista na Itália.",
        
        "cavalinho": "Monumento às Bandeiras é uma obra de arte executada pelo escultor ítalo-brasileiro Victor Brecheret. A obra representa os bandeirantes, expondo suas diversas etnias e o esforço para desbravar o país. Além de portugueses, vemos na obra negros, mamelucos e índios, puxando uma canoa de monções, utilizadas nas expedições fluviais."
    ]
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let itemAtual = item else{
            return
        }
        
        descrição.numberOfLines = 0
        descrição.text = detalhes[itemAtual]
        
        switch itemAtual {
        case "cavalinho":
            fotinho.image = UIImage(named: "ibira-2")
            
            //alinhamento de imagem
            fotinho.contentMode = .scaleAspectFill
            fotinho.clipsToBounds = true
        
        case "ponte":
            fotinho.image = UIImage(named: "ibira-3")
            
            //alinhamento de imagem
            fotinho.contentMode = .right
            fotinho.clipsToBounds = true
        
        case "obelisco":
            fotinho.image = UIImage(named: "ibira-1")
            
            //alinhamento de imagem
            fotinho.contentMode = .scaleAspectFill
            fotinho.clipsToBounds = true
        
        case "teatro":
            fotinho.image = UIImage(named: "ibira-4")
            
            //alinhamento de imagem
            fotinho.contentMode = .scaleAspectFill
            fotinho.clipsToBounds = true
        
        default:
            break
        }
        
        // Arredondando a foto
        fotinho.layer.cornerRadius = 60
        fotinho.layer.borderColor = UIColor.white.cgColor
        fotinho.layer.borderWidth = 12
        
        print("Item atual: \(item)")
        
    }
    
    @IBAction func fechar(){
        dismiss(animated: true, completion: nil)
    }
    
    
    

}
