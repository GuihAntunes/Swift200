//
//  Arredondador.swift
//  Swift200_Day4_1_TextViewSwitchSegment
//
//  Created by Swift on 01/10/16.
//  Copyright © 2016 Guihsoft. All rights reserved.
//

import UIKit

class Arredondador: NSObject {
    
    // @IBInspectable avisa o interface builder que essa variável pode
    // ser alterada no storyboard
    // Não pode ser Optional. Precisa de valor padrão
    @IBInspectable var raio:CGFloat     = 10
    @IBInspectable var borda:CGFloat    = 1.0
    
    @IBOutlet var alvos:[UIView]? {
        
        didSet{
            
            // Garantimos que existe um vetor com minhas
            // views conectadas, senão não preciso fazer nada e retorno
            guard let alvosAtuais = alvos else {
                return
            }
            
            // Pegamos cada uma das views num loop
            // e pedimos para arredondar
            for alvo in alvosAtuais {
                // VIIISH 😎
                alvo.layer.cornerRadius = raio
                alvo.layer.borderColor  = UIColor.white.cgColor
                alvo.layer.borderWidth  = borda
                alvo.clipsToBounds      = true
                
            }
                
        }
            
    }
        
}
