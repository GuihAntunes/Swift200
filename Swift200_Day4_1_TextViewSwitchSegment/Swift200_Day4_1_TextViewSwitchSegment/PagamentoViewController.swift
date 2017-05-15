//
//  PagamentoViewController.swift
//  Swift200_Day4_1_TextViewSwitchSegment
//
//  Created by Swift on 01/10/16.
//  Copyright © 2016 Guihsoft. All rights reserved.
//

import UIKit

class PagamentoViewController: UIViewController, UITextFieldDelegate {
    
    var pizzaPedida:Pizza?
    
    @IBOutlet weak var numeroDoCartao: UITextField!
    @IBOutlet weak var nomeCartao: UITextField!
    @IBOutlet weak var validade: UITextField!
    @IBOutlet weak var cvv: UITextField!
    @IBOutlet weak var bandeira: UISegmentedControl!
    @IBOutlet weak var botaoProsseguir: UIButton!
    @IBOutlet weak var campos: UIView!
    
    // Precisamos preencher a Pizza com os valores capturados nesta tela
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // Validamos se estamos lidando com a segue correta
        guard let destino = segue.destinationViewController as? PedidoViewController else{
            return
        }
        
        pizzaPedida?.cvv            = Int(cvv.text ?? "")
        pizzaPedida?.nome           = nomeCartao.text
        pizzaPedida?.validade       = validade.text
        pizzaPedida?.numeroCartao   = numeroDoCartao.text
        
        // Segmented control, qual o título do segmento selecionado?
        pizzaPedida?.bandeira       = bandeira.titleForSegmentAtIndex(bandeira.selectedSegmentIndex)
        
        // Repassamos pra próxima tela
        destino.pizzaPedida = pizzaPedida
        
    }
    
    // Vamos escutar o evento de inicio e fim de edição
    // para controlar a posição da view onde estão todos
    // os nossos campos de texto.
    // Sobe mais quanto mais baixo é o campo, igual uma
    // roldana
    //    o
    //   / \
    //  /   \
    // [🔝]  \ ⬇
    
    func textFieldDidBeginEditing(textField: UITextField) {
        
        UIView.animateWithDuration(0.4) {
            self.campos.center = CGPointMake(self.view!.frame.size.width / 2, 260 - textField.frame.origin.y)
        }
        
    }
    
    // Quando entramos na tela já é rodada uma validação de campos preenchidos
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        validarTodosCamposPreenchidos()
    }
    
    // No fim da edição, voltamos os campos
    // para o local correto
    func textFieldDidEndEditing(textField: UITextField) {
        
        validarTodosCamposPreenchidos()
        
        UIView.animateWithDuration(0.4) {
            self.campos.center = CGPointMake(self.view!.frame.size.width / 2, 207)
        }
        
    }
    
    // Quando tocar fora, tem que esconder o teclado!
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        // Eu toquei numa view que não é alvo de edição atualmente?
        if touches.first?.view?.isFirstResponder() == false {
            // Se sim, cancela a ediçnao que está sendo feita
            // Pegamos da aplicação, a janela principal e pedimos o cancelamento de qualquer edição
            UIApplication.sharedApplication().keyWindow?.endEditing(true)
    
        }
    }
    
    @IBAction func mudouBandeira(sender: AnyObject) {
        validarTodosCamposPreenchidos()
    }
    
    // Quando não estão todos os campos preenchidos
    // vamos desabilitar o botão continuar
    func validarTodosCamposPreenchidos(){
        
        guard numeroDoCartao.text != "" &&
              nomeCartao.text != "" &&
              validade.text != "" &&
              cvv.text != "" &&
              bandeira.selectedSegmentIndex != UISegmentedControlNoSegment else {
                botaoProsseguir.enabled = false
                botaoProsseguir.alpha = 0.5
                return
        }
        
        botaoProsseguir.enabled = true
        botaoProsseguir.alpha = 1.0
        
    }
    
    // Vamos escutar as alterações de texto para poder validar os campos 
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        
        // Se o textField não tem texto, não precisa validar nada
        guard let text = textField.text else {
            
            return false
        }
        
        // Vamos antecipar a edição para ver como ficaria o texto
        var texto = text as NSString
        texto = texto.stringByReplacingCharactersInRange(range, withString: string)
        
        let tamanho = texto.length
        
        // Tratamento para cada um dos campos
        switch textField {
        case numeroDoCartao:
            
            // Número de cartão não pode ter mais que 19 characters
            // 1234.5678.1234.5678
            if tamanho > 19 {
                return false
            }
            
            // Filtramos tudo que não é número em um vetor,
            // inclusive os antigos pontinhos
            let chars = texto.soNumeros().characters
            
            // Depois, a cada quatro, colocamos pontinho
            var novoTexto = ""
            for (i,character) in chars.enumerate() {
                if i % 4 == 0 && i != 0 {
                    novoTexto = "\(novoTexto)."
                }
                novoTexto.append(character)
            }
            
            // Depois de fazer todo tratamento do texto, colocando pontinho nas casas,
            // repassamos direto pro campo de texto e bloqueamos a edição proposta
            textField.text = novoTexto
            return false
            
        case nomeCartao:
            
            textField.text = texto.uppercaseString
            return false
            
        case cvv:
            
            // O código de segurança do cartão não pode ter mais que 4 números
            if tamanho > 4 {
                return false
            }
            
            // Queremos apenas números no campo
            textField.text = texto.soNumeros()
            
            return false
            
        case validade:
            
            // Tamanho não pode ser maior que 7 -> números + barrinha
            if tamanho > 7 {
                return false
            }
            
            
            
            // Queremos apenas números
            let chars = texto.soNumeros().characters
            
            // Coloca barrinha depois dos 2 primeiros números
            var novoTexto = ""
            for (i,character) in chars.enumerate() {
                if i == 2 && i != 0 {
                    novoTexto = "\(novoTexto)/"
                }
                novoTexto.append(character)
            }
            
            textField.text = novoTexto
            
            return false
            
        default:
            return true
            
        }
        
    }
    
    
}















