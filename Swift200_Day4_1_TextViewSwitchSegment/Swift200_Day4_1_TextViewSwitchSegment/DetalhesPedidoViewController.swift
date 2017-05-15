//
//  DetalhesPedidoViewController.swift
//  Swift200_Day4_1_TextViewSwitchSegment
//
//  Created by Swift on 01/10/16.
//  Copyright © 2016 Guihsoft. All rights reserved.
//

import UIKit

class DetalhesPedidoViewController: UIViewController, UITextViewDelegate {
    
    // Vamos continuar repassando os valores para um objeto Pizza,
    // que veio da tela anterior e agora vai para a próxima
    var pizzaPedida:Pizza?
    
    let placeholder = "Algum pedido especial?"
    
    @IBOutlet weak var pedidoEspecial: UITextView!
    @IBOutlet weak var numTalheres: UITextField!
    @IBOutlet weak var contador: UILabel!
    
    // Recebemos o evento do Stepper avisando que o usuário apertou
    // '+'ou '-'. Repassamos esse valor para o campo de texto
    @IBAction func talheresMudou(sender: UIStepper) {
        numTalheres.text = "\(Int(sender.value))"
    }
    
    // Quando tocar em prosseguir, preenchemos o objeto Pizza
    // Com os dados desta tela e repassamos para o próximo View Controller
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        guard let destino = segue.destinationViewController as? PagamentoViewController else {
            return
        }
        
        if pedidoEspecial.text != placeholder {
            pizzaPedida?.detalhesDoPedido = pedidoEspecial.text
        }
        
        pizzaPedida?.talheres = Int(numTalheres.text ?? "0")
        
        destino.pizzaPedida = pizzaPedida
        
    }
    
    // Como textview não tem placeholder, vamos
    // implementar essa funcionalidade utilizando
    // o delegate de comeco e fim da edição
    func textViewDidEndEditing(textView: UITextView) {
        if textView.text == "" {
            textView.text = placeholder
        }
    }
    
    func textViewDidBeginEditing(textView: UITextView) {
        if textView.text == placeholder {
            textView.text = ""
        }
    }
    
    // Vamos escutar o evento de edição de texto para:
    // 1) esconder o teclado quando tocar em 'done'
    // 2) contar a quantidade de texto que ainda pode digitar
    // 3) limite o texto em 60 chars
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        
        // 1)
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        // 2)
        var texto = textView.text as NSString
        texto = texto.stringByReplacingCharactersInRange(range, withString: text)
        
        let tamanho = texto.length
        
        // 3)
        if tamanho > 60 {
            return false
        }
        
        // 2)
        contador.text = "\(60 - tamanho)"
        
        return true
        
    }

}
