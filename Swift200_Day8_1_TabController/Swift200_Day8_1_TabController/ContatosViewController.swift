//
//  ContatosViewController.swift
//  Swift200_Day8_1_TabController
//
//  Created by Swift Prof on 29/10/16.
//  Copyright © 2016 Quaddro. All rights reserved.
//

import UIKit

class ContatosViewController: UIViewController {
    
    @IBOutlet weak var butãoVaiVolta: UISwitch!

    @IBAction func tapLevaParaAjustes(){
        
        // Primeiro, antes de trocar de tab, garantimos
        // que esta tela tem um tabBarController
        guard let tabs = self.tabBarController?.viewControllers else{
            return
        }
        
        // Com a lista de telas de tabs em mãos,
        // percorremos uma a uma...
        for (indice, controlador) in tabs.enumerated() {
            
            // .. até encontrar a que procuramos
            if controlador is AjustesViewController {
                
                // e ai mudamos para esta tab
                self.tabBarController?.selectedIndex = indice
            }
        }
        
    }
    
    @IBAction func tapMostraTab(sender:UISwitch){
        // Fazemos uma animação para esconder ou mostrar
        // a barra, dependendo do estado on/off do switch
        UIView.animate(withDuration: 0.24) { 
            self.tabBarController?.tabBar.alpha = sender.isOn ? 1 : 0
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Vai aparecer: Contatos")
        
        // quando voltar, preciso saber se meu botão mostra/esconde tab bar está ligado ou desligado e refletir isso no layout
        
        UIView.animate(withDuration: 0.24) {
            self.tabBarController?.tabBar.alpha = self.butãoVaiVolta!.isOn ? 1 : 0
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Apareceu: Contatos")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Vai desaparecer: Contatos")
        
        // Quando sair da tela, preciso deixar a tab
        // do jeito que eu encontrei
        UIView.animate(withDuration: 0.24) {
            self.tabBarController?.tabBar.alpha = 1
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("Desapareceu: Contatos")
    }
    
}
