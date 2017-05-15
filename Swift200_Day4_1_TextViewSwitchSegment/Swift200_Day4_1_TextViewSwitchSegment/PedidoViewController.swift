//
//  PedidoViewController.swift
//  Swift200_Day4_1_TextViewSwitchSegment
//
//  Created by Swift on 01/10/16.
//  Copyright © 2016 Guihsoft. All rights reserved.
//

import UIKit

class PedidoViewController: UIViewController {
    
    var pizzaPedida:Pizza?
    
    @IBOutlet weak var textoDoPedido: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        var textoPedido = "\n----------------"
        textoPedido    += "\nPizza sabor \(pizzaPedida?.sabor ?? "?")"
        textoPedido    += "\n----------------"
        textoPedido    += "\nPedido do cliente: \(pizzaPedida?.detalhesDoPedido ?? "Nenhum")"
        textoPedido    += "\nRecheio extra: \(pizzaPedida?.recheioExtra ?? false ? "SIM" : "NÄO" )"
        textoPedido    += "\nTalheres: \(pizzaPedida?.talheres ?? 0)"
        textoPedido    += "\n----------------"
        textoPedido    += "\nMeio de pagamento: Cartão \(pizzaPedida?.bandeira ?? "?")"
        textoPedido    += "\nNúmero do cartão: \(pizzaPedida?.numeroCartao ?? "?")"
        textoPedido    += "\nNome no cartão: \(pizzaPedida?.nome ?? "?")"
        textoPedido    += "\n----------------"
        
        textoDoPedido.text = textoPedido
        
    }

}
