//
//  AjustesViewController.swift
//  Swift200_Day8_1_TabController
//
//  Created by Swift Prof on 29/10/16.
//  Copyright © 2016 Quaddro. All rights reserved.
//

import UIKit

class AjustesViewController: UIViewController {

    // unwind segue
    @IBAction func voltei(_ sender:UIStoryboardSegue) {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Vai aparecer: Ajustes")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Apareceu: Ajustes")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Vai desaparecer: Ajustes")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("Desapareceu: Ajustes")
    }

}
