//
//  ViewController.swift
//  Password Game
//
//  Created by Swift on 10/09/16.
//  Copyright © 2016 Guihsoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let colors = [UIColor.greenColor(),
                  UIColor.magentaColor(),
                  UIColor.redColor(),
                  UIColor.blueColor(),
                  UIColor.darkGrayColor()]
    
    let senha = [
        UIColor.blueColor(),
        UIColor.redColor(),
        UIColor.blueColor()
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let largura = self.view.frame.size.width / 3
        
        for i in 0..<3 {
            let posicao = CGRectMake(largura*CGFloat(i), 0, largura, 400)
            let umDasViews = UIView(frame: posicao)
            umDasViews.backgroundColor = colors.first
            umDasViews.tag = i+1
            self.view.addSubview(umDasViews)
            
        }
        
        let botãoEntrar = UIButton(type: UIButtonType.System)
        botãoEntrar.frame = CGRectMake(0, 410, self.view.frame.width, self.view.frame.height)
        
        botãoEntrar.setTitle("Entrar", forState: UIControlState.Normal)
        botãoEntrar.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        self.view.addSubview(botãoEntrar)
        
        botãoEntrar.addTarget(self, action: #selector(entrar), forControlEvents: UIControlEvents.TouchUpInside)
    
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func entrar(){
        
        guard let viewUm = self.view.viewWithTag(1),
              let viewDois = self.view.viewWithTag(2),
              let viewTres = self.view.viewWithTag(3) else{
                return
        }
        if senha[0] == viewUm.backgroundColor
        && senha[1] == viewDois.backgroundColor
        && senha[2] == viewTres.backgroundColor {
            print("Certo!")
            performSegueWithIdentifier("Entrar", sender: self)
        }else{
            print("Errado!")
        }
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
            
            // Guarda da balada
            guard let viewAlvo = touches.first?.view,
                  let corAtual = viewAlvo.backgroundColor,
                  let indiceAtual = colors.indexOf(corAtual) else {
                return
            
        }
            // Acho a proxima cor
            // e troco o fundo pra essa nova cor
            let proximaCor = colors[(indiceAtual+1)%colors.count]
            viewAlvo.backgroundColor = proximaCor
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}