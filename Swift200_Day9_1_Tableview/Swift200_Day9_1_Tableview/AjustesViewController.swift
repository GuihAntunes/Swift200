//
//  AjustesViewController.swift
//  Swift200_Day9_1_Tableview
//
//  Created by Swift on 05/11/16.
//  Copyright © 2016 Guihsoft. All rights reserved.
//

import UIKit

class AjustesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tabela: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.barStyle = .default
        atualizaSelecao()
    }
    
    // Número de seções na minha tabela
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // Quantas linhas vou ter para cada seção
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        // Para cidades, numero de linhas = numero de cidades
        case 0:
            return App.compartilhado.dados.count
        // Para graus, uma linha (row) só
        default:
            return 1
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            // Vamos pedir para tableview buscar uma célula que tenha um prototype configurado com o identificador de ruso CellCidade
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellCidade") else{
                fatalError("Célula não encontrada!")
            }
            
            // Analisamos a chamada para ver de qual linha estamos falando (indexPath vem de parametro)
            let linha = indexPath.row
            
            // Configura o texto para a cidade correta
            cell.textLabel?.text = App.compartilhado.dados[linha].nome
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellGraus") else{
                fatalError("Celula de graus não encontrada!")
            }
            
            cell.textLabel?.text = "Exibir em Celsius?"
            
            // Botãozinho liga/desliga
            let meuSwitch = UISwitch()
            
            // Precisamos configurar com o valor já definido
            meuSwitch.isOn = App.compartilhado.usarCelsius
            
            // Versão manual de uma IBAction:
            // Essa classe, esse método, quando isso acontecer (ordem dos parâmetros)
            meuSwitch.addTarget(self, action: #selector(trocaGrausCelsius), for: .valueChanged)
            
            // Accessory View, fica à direita da cell
            cell.accessoryView = meuSwitch
            
            return cell
        default:
            fatalError("Não existe essa seção!")
        }
    }
    
    // Função que o switch chama quando trocar seu valor
    func trocaGrausCelsius(sender:UISwitch){
        App.compartilhado.usarCelsius = sender.isOn
    }
    
    // Configurando o title das sections
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Cidades Favoritas"
        case 1:
            return "Ajustes de métrica"
        default:
            fatalError("Ops! Que section é essa?")
        }
    }
    
    // MARK: Seleção da cidade
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tabela.cellForRow(at: indexPath) {
            
            // Adicionando a marca da seleção na direita ✔️
            cell.accessoryType = .checkmark
            
            // Avisamos o app que a cidade favorita mudou
            App.compartilhado.favoritarCidade(comNome: cell.textLabel?.text ?? "")
        }
    }
    

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        // Similar a seleção, pego a célula em questão e removo a view da direita
        if let cell = tabela.cellForRow(at: indexPath) {
            cell.accessoryType = .none
        }
    }
    
    // Evitar desmarcar a cell quando dá um tap em Celsius que seleciona uma cidade inválida, que dá um crash
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        
        if indexPath.section == 0 {
            return indexPath
        }else{
            return nil
        }
    }
    
    // Essa função vê qual a cidade atualmente selecionada e marca na tabela
    func atualizaSelecao(){
        
        var linhaFavorita = 0
        
        for (i, cidade) in App.compartilhado.dados.enumerated() {
            if cidade.nome == App.compartilhado.dadosDaFavorita().nome {
                linhaFavorita = i
                break
            }
        }
        
        // Sabendo a linha da cidade favorita, selecionamos esta linha e atualizamos a interface para mostrar o check mark
        let indexPath = IndexPath(row: linhaFavorita, section: 0)
        tabela.selectRow(at: indexPath, animated: false, scrollPosition: .none)
        tabela.cellForRow(at: indexPath)?.accessoryType = .checkmark
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if indexPath.section != 0 {
            return false // Não pode quando está fora da seção de cidade
        } else if tabela.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            return false // Não pode quando é a linha selecionada
        } else {
            return true
        }
    }
    
    func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
        atualizaSelecao()
    }
    
    // MARK: Métodos de edição
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        return [
        
            UITableViewRowAction(style: .destructive, title: "Remover", handler: { (action, indexPath) in
                
                // Quando selecionar 'remover', vamos capturar a cell e remover a cidade com este nome
                let cell = self.tabela.cellForRow(at: indexPath)
                App.compartilhado.removeCidade(comNome: cell?.textLabel?.text ?? "")
                
                // Depois pedimos pra tableview remover essa linha e atualizamos a seleção na interface
                self.tabela.deleteRows(at: [indexPath], with: .fade)
                self.atualizaSelecao()
            
            })
            
        ]
        
    }
    
}














