//
//  TextoColorivel.swift
//  Swift200_Day2_2_UISlider
//
//  Created by Swift on 24/09/16.
//  Copyright © 2016 Quaddro. All rights reserved.
//

import UIKit

class TextoColorivel: UILabel, AquelesQueMudamDeCor {

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        ContaGotasViewController.apresentaCom(self)
    }
    
    func recebeNovaCor(_ cor: UIColor) {
        self.textColor = cor
    }

}
