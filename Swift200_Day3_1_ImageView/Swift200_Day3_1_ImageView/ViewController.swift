//
//  ViewController.swift
//  Swift200_Day3_1_ImageView
//
//  Created by Swift on 24/09/16.
//  Copyright © 2016 Guihsoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBAction func abreMapa(_ sender: AnyObject) {
        
        // Documentação em:// http://apple.co/2cHroho
        if let endereço = URL(string: "http://maps.apple.com/?daddr=Parque+do+Ibirapuera&saddr=Alameda+Santos+,+1000&t=k&addr=sao-paulo") {
            UIApplication.shared.openURL(endereço)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Garante que essa é a segue que leva para tela de detalhes
        if let destino = segue.destination as? DetalhesViewController,
            let item = segue.identifier {
                destino.item = item
            }
    }
        
}

