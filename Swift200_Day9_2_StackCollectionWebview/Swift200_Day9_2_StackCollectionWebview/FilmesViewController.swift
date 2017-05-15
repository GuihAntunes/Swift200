//
//  FilmesViewController.swift
//  Swift200_Day9_2_StackCollectionWebview
//
//  Created by Swift on 05/11/16.
//  Copyright © 2016 Guihsoft. All rights reserved.
//

import UIKit

class FilmesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tabela: UITableView!
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.all
    }
    
    
    // Implementando delegates do tableview
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Tabela tem que utilizar o tamanho que as constraints resolverem
        tabela.rowHeight = UITableViewAutomaticDimension
        // Precisa de uma estimativa de tamanho para a tabela desenhar o scroll
        tabela.estimatedRowHeight = 181
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return app.filmes.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return app.filmes[section].lista.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header              = UILabel()
        header.text             = app.filmes[section].genero.uppercased()
        header.textAlignment    = .center
        header.textColor        = UIColor.white
        header.backgroundColor  = UIColor.black.withAlphaComponent(0.6)
        header.font             = UIFont.boldSystemFont(ofSize: 11)
        return header
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tabela.dequeueReusableCell(withIdentifier: "CelulaDoFilme") as? FilmeCell else{
            fatalError("Não encontra a célula!")
        }
        
        cell.atualizar(paraFilme: app.filmes[indexPath.section].lista[indexPath.row])
        
        return cell
        
    }
    
    
    
}
