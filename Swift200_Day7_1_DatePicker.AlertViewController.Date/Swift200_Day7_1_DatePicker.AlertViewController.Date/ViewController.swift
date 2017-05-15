//
//  ViewController.swift
//  Swift200_Day7_1_DatePicker.AlertViewController.Date
//
//  Created by Swift on 22/10/16.
//  Copyright © 2016 Guihsoft. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var botaoUm: UIButton!
    @IBOutlet weak var botaoDois: UIButton!
    @IBOutlet weak var botaoTres: UIButton!
    @IBOutlet weak var meuPicker: UIPickerView!
    
    
    // Tentativas restantes de rodar uma única rodinha
    var trys:Int = 0
    
    func ativarBotoes(){
        botaoUm.isEnabled   = true
        botaoDois.isEnabled = true
        botaoTres.isEnabled = true
    }
    
    func desativarBotoes(){
        botaoUm.isEnabled   = false
        botaoDois.isEnabled = false
        botaoTres.isEnabled = false
    }
    
    // Implementando os métodos de delegate e datasource do picker
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3 // 3 pq temos 3 botões e 3 rodinhas para girar
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 50 // São 10 items diferentes em cada rodinha. *5 para simular loop infinito
    }
    
    override func viewDidLoad() {
        
        // Move as rodinhas 0, 1 e 2 para uma posiçnao que dê pra ver items em cima e embaixo
        meuPicker.selectRow(15, inComponent: 0, animated: false)
        meuPicker.selectRow(15, inComponent: 1, animated: false)
        meuPicker.selectRow(15, inComponent: 2, animated: false)
    }
    
    func gira(rodinha:Int){
        
        // Recuperamos qual a posição atual desta rodinha
        // para poder acrescentar e evitar de girar ao contrário
        var selecaoAtual = meuPicker.selectedRow(inComponent: rodinha)
        
        // Volta o picker para o mesmo desenho, só que mais para cima, eliminando o risco de chegar no fim
        let mesmoDesenhoPraCima = selecaoAtual%10 + 10
        meuPicker.selectRow(mesmoDesenhoPraCima, inComponent: rodinha, animated: false)
        selecaoAtual = mesmoDesenhoPraCima
        
        // Gera um número aleatório de um até 10
        let aleatorio    = Int(arc4random()%10) + 1
        
        meuPicker.selectRow(selecaoAtual + aleatorio, inComponent: rodinha, animated: true)
        
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        if let viewQueOPickerFezDaUltimaVezQuePassouAqui = view {
            return viewQueOPickerFezDaUltimaVezQuePassouAqui
        }else{
            
            // Estes são nosso items, vamos sempre retornar dentro da faixa
            // de 10, ou seja row%10
            let titulo                  = ["♠️", "♣️", "♥️", "♦️", "🏈", "🎼", "🏀", "🎱", "🎯", "🎲"][row%10]
            
            let texto                   = UILabel()
            texto.text                  = titulo
            texto.layer.cornerRadius    = 5
            texto.layer.borderColor     = UIColor.black.cgColor
            texto.textAlignment         = .center
            texto.backgroundColor       = UIColor.white
            texto.clipsToBounds         = true
            
            return texto
            
        }
        
    }
    
    // Se todas forem iguais, vamos vibrar o celular para visar que o jogador ganhou
    func validaSeTodasAsRodinhasSaoIguais(){
        
        let item1 = meuPicker.selectedRow(inComponent: 0)
        let item2 = meuPicker.selectedRow(inComponent: 1)
        let item3 = meuPicker.selectedRow(inComponent: 2)
        
        if item1 == item2 && item2 == item3 {
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
            desativarBotoes()
        }
        
    }
    
    @IBAction func tapGira(_ sender: UIButton) {
        
        gira(rodinha: sender.tag)
        validaSeTodasAsRodinhasSaoIguais()
        trys -= 1
        if trys == 0 {
            desativarBotoes()
        }
    }
    
    @IBAction func tapTrocaTodos(_ sender: UIButton) {
        trys = 3
        ativarBotoes()
        
        gira(rodinha: 0)
        gira(rodinha: 1)
        gira(rodinha: 2)
        validaSeTodasAsRodinhasSaoIguais()
    }
    
}

