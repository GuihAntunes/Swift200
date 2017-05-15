//
//  ViewController.swift
//  Swift200_Day3_2_AnimatedImages
//
//  Created by Swift on 24/09/16.
//  Copyright © 2016 Guihsoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    func toqueEm(_ ponto:CGPoint) {
        
        // colocando todas as imagens num vetor
        
        var vetorDeImagens:[UIImage] = []
        
        for i in 1...32 {
            let imageName = "drop\(i)"
            if let imageData = UIImage(named: imageName) {
                vetorDeImagens.append(imageData)
            }
            
        }
        
        // Cria uma Image Viwe para rodar nossa animação e centraliza ela no ponto
        let umaOnda = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        umaOnda.center = ponto
        umaOnda.animationImages = vetorDeImagens
        umaOnda.animationRepeatCount = 1
        self.view?.addSubview(umaOnda)
        umaOnda.startAnimating()
        
        // SAP: Chame esse método, com esse parâmetro, depois desse tempo
        perform(#selector(removerUmaOnda), with: umaOnda, afterDelay: 1.2)
        
    }
    
    // Remove as ondinhas
    func removerUmaOnda(_ sender: UIImageView){
        sender.removeFromSuperview()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        // versão multi-touch
        for touch in touches {
            let centro = touch.location(in: self.view)
            toqueEm(centro)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // versão multi-touch
        for touch in touches {
            let centro = touch.location(in: self.view)
            toqueEm(centro)
        }
        
      //  if let centro = touches.first?.locationInView(self.view){
      //     toqueEm(centro)
      // }
    }


}

