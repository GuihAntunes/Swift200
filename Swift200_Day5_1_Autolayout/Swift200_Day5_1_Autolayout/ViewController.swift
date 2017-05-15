//
//  ViewController.swift
//  Swift200_Day5_1_Autolayout
//
//  Created by Swift on 08/10/16.
//  Copyright © 2016 Quaddro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var viewsDeFundo: [UIView]!
    
    let minhaTocadoraDeRadio = TocadoraDeRadio()
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }

    @IBAction func clickRock(_ sender: UIButton) {
        atualizaBorda(sender)
        minhaTocadoraDeRadio.mudarDeEstação(.rock)
    }
    
    @IBAction func clickEletronica(_ sender: UIButton) {
        atualizaBorda(sender)
        minhaTocadoraDeRadio.mudarDeEstação(.eletronica)
    }
    
    @IBAction func clickPop(_ sender: UIButton) {
        atualizaBorda(sender)
        minhaTocadoraDeRadio.mudarDeEstação(.pop)
    }
    
    @IBAction func clickEcletica(_ sender: UIButton) {
        atualizaBorda(sender)
        minhaTocadoraDeRadio.mudarDeEstação(.ecletica)
    }
    
    func atualizaBorda (_ botao: UIButton) {
        
        // Primeiro removo a borda de todos
        for view in viewsDeFundo {
            view.layer.borderColor = UIColor.clear.cgColor
        }
        // Depois faco a borda da view em que o botão selecionado está incluído
        botao.superview?.layer.borderColor = UIColor.red.cgColor
        botao.superview?.layer.borderWidth = 3.0
        
    }
    
    @IBAction func voltar(_ sender: UIStoryboardSegue) {
        
    }
    
    @IBAction func parar(_ sender: UIButton){
        for view in viewsDeFundo {
            view.layer.borderColor = UIColor.clear.cgColor
        }
        minhaTocadoraDeRadio.player?.pause()
    }
    
    
}















