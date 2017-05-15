//
//  TelaInicialViewController.swift
//  Swift200_Day7_1_DatePicker.AlertViewController.Date
//
//  Created by Swift on 22/10/16.
//  Copyright © 2016 Guihsoft. All rights reserved.
//

import UIKit

class TelaInicialViewController: UIViewController {

    @IBOutlet weak var meuDatePicker: UIDatePicker!
    
    @IBAction func sair(sender: UIStoryboardSegue){
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        estudoNSDate()
    }
    
    func estudoNSDate(){
        
        // Data atual
        let agora = Date()
        print("Agora: \(agora)")
        
        // 10 minutos depois da data atual
        let maisTarde = Date(timeIntervalSinceNow: 10*60)
        print("Daqui 10 minutos será: \(maisTarde)")
        
        // Qual é mais cedo?
        if maisTarde > agora {
            print("Agora é mais cedo do que mais tarde! 😮")
        }
        
        // Adicionando tempo ( 20 minutos )
        // Por exemplo, para fazer modo 'soneca', adicionando 20 minutos a hora de acordar
        let depoisDeAgora = agora.addingTimeInterval(20*60)
        print("20 minutos depois de agora: \(depoisDeAgora)")
        
        // Outra maneira de comprar datas:
        let dataA = agora
        let dataB = maisTarde
        
        switch dataA.compare(dataB) {
        case .orderedSame:
            print("As duas são iguais")
        case .orderedAscending:
            print("A é menor que B 📈")
        case .orderedDescending:
            print("A é maior que B 📉")
        }
        
        // Valores pré definidos
        let epoch = Date(timeIntervalSince1970: 0)
        let futuro = Date.distantFuture
        let passado = Date.distantPast
        
        print("Epoch: \(epoch)")
        print("Futuro: \(futuro)")
        print("Passado: \(passado)")
        
        // Tempo entre duas datas
        let intervalo = agora.timeIntervalSince(maisTarde)
        print("Tem \(Int(intervalo/60)) minutos entre agora e mais tarde!")
        
        // Date Formatters
        
        let formato = DateFormatter()
        formato.dateStyle = .full // sábado, 22 de outubro de 2016
        formato.locale = Locale(identifier: "pt_BR") // Região onde será formatado
        print("Formatadinho: ", formato.string(from: agora))
        
        formato.timeStyle = .medium // 17:11:25
        print("Formatado, com hora: ", formato.string(from: agora))
        
        // Formatador customizado (bit.ly/1O0K61i)
        formato.dateFormat = "YYYYMMddHHmmss"
        print("Formatado, customizado: ", formato.string(from: agora))
        
        // Mesma coisa para recuperar uma data
        let natal = "20161225220000"
        let diaDoNatal = formato.date(from: natal)
        formato.dateStyle = .short
        print("Data recuperada: \(diaDoNatal)")
        
        // Componentes da Data: vamos abrir a data
        // em várias variáveis Int
        if let calendar = NSCalendar(calendarIdentifier: .gregorian) {
            
            // Buscando os componentes de uma data (hora e minuto)
            let hora = calendar.component(.hour, from: agora)
            let minuto = calendar.component(.minute, from: agora)
            print("Agora são \(hora):\(minuto)")
            
        }
        
    }
    
    @IBAction func entrar(_ sender: UIButton) {
        
        // Recuperamos a quantidade de anos entre a data escolhida e a data atual
        let selecionada = meuDatePicker.date
        let agora       = Date()
        let calendar    = meuDatePicker.calendar
        let componentes = calendar?.dateComponents([.year], from: selecionada, to: agora)
        let idade       = componentes?.year
        
        if idade ?? 0 >= 18 {
            performSegue(withIdentifier: "entrar", sender: nil)
        }else{
            //menores de idade
            
            // Criar a view controller do alerta
            
            let aviso = UIAlertController(title: "Se liga, lek!", message: "Esse rolê é só pra maior de idade! 😎", preferredStyle: .alert)
            
            // Vamos criar o botão fechar
            let fechar = UIAlertAction(title: "Saquei, demorou!", style: .cancel){ _ in
                aviso.dismiss(animated: true, completion: nil)
            }
            
            // adiciona a ação no alerta
            aviso.addAction(fechar)
            self.present(aviso, animated: true, completion: nil)
            
        }
        
        
    }


}
