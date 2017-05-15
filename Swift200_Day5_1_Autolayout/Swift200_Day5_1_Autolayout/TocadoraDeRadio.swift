//
//  TocadoraDeRadio.swift
//  Swift200_Day5_1_Autolayout
//
//  Created by Swift on 08/10/16.
//  Copyright © 2016 Quaddro. All rights reserved.
//

import Foundation
import AVFoundation
import MediaPlayer

class TocadoraDeRadio {
    
    enum Estilo {
        case rock, pop, ecletica, eletronica
    }
    
    // Objeto do sistema que vai tocar nossas rádios
    var player:AVPlayer?
    
    func mudarDeEstação(_ novoEstilo: Estilo){
        
        let endereçoNaInterwebs:String
        
        // Buscamos o endereco na internet da radio
        switch novoEstilo {
        case .rock:
            endereçoNaInterwebs = "http://11254q.ls.azioncdn.net/1254q/a/kissfm2.sdp/playlist.m3u8"
        case .pop:
            endereçoNaInterwebs = "http://antena1.newradio.it/stream?1475840621661.aac"
        case .ecletica:
            endereçoNaInterwebs = "http://200.144.185.21:8007/radiousp-128.mp3"
        case .eletronica:
            endereçoNaInterwebs = "http://aac.97fm.com.br:80/energia"
        }
        
        // Mandamos o player tocar aquele endereço
        if let urlRadio = URL(string: endereçoNaInterwebs){
            player = AVPlayer(url: urlRadio)
            player?.play()
        }
        
        
    }
    
}


