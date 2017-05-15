//
//  ViewController.swift
//  Swift200_Day2_1_TextField
//
//  Created by Swift on 17/09/16.
//  Copyright © 2016 Guihsoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func limparCampos(){
        
        for campo in meusCamposDeTexto{
            campo.text = ""
        }
    }

    @IBOutlet var meusCamposDeTexto: [UITextField]!
    @IBOutlet weak var campoNome: UITextField!
    @IBOutlet weak var campoIdade: UITextField!
    @IBOutlet weak var campoSenha: UITextField!
    
    // unwind segue -> outras telas rebobinam para cá
    @IBAction func volta(sender: UIStoryboardSegue){
        print("Voltei!")
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        
        // vamos garantir que é a nossa segue entrar
        guard identifier == "entrar" else {
            return true
        }
        
        guard tudoPreenchido() else {
            mostraAlerta("Fera, pra entrar na festa precisa preencher todos os campos. Faz essa pro time? 😉")
            return false
        }
        
        guard campoSenha.text == "123" else{
            mostraAlerta("Ouch! Essa senha está errada! Fica pra próxima colega. Abraços! 😵")
            return false
        }
        
        // A idade tem que estar preenchida e maior que 18
        guard let idadePreenchida = campoIdade.text
            where Int(idadePreenchida) > 18 else {
                mostraAlerta("Vish! Infelizmente, rapaz, essa festa é só para maiores de idade. Fica triste não nenis! 😆")
                return false
            }
        
        return true
    }
    
    func mostraAlerta(texto: String) {
        
        let alerta = AlertaView(frame: self.view.frame, texto)
        self.view.addSubview(alerta)
    }
    
    func tudoPreenchido() -> Bool {
        return (meusCamposDeTexto.filter { $0.text == "" }).isEmpty
    }

}

