//
//  TermosDeUsoViewController.swift
//  Swift200_Day8_2_NavController
//
//  Created by Swift on 29/10/16.
//  Copyright © 2016 Quaddro. All rights reserved.
//

import UIKit

class TermosDeUsoViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Quando entra na tela, pede para esconder a barra de navegação no topo
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Quando sai da tela, volta a barra que estava lá no topo
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBAction func tapVoltar(_ sender: AnyObject) {
        // Quando tocamos no botão 'voltar, pedimos ao navController para que tire a tela que está mais acima,
        // no caso é esta mesmo, a TermosDeUso
        let _ = self.navigationController?.popViewController(animated: true)
        
    }

    @IBAction func tapImprimir(_ sender: AnyObject) {
        
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "imprimir"){
            self.navigationController?.pushViewController(controller, animated: true)
        }
        
    }
    
    
}
