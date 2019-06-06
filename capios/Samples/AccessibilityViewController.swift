//
//  AccessibilityViewController.swift
//  capios
//
//  Created by Francisco de Carvalho Costa Neto on 05/06/19.
//  Copyright © 2019 Adriano. All rights reserved.
//

//Refs:
//https://www.raywenderlich.com/845-ios-accessibility-tutorial-getting-started
//https://developer.apple.com/documentation/uikit/accessibility/

import UIKit
/*
 O primeiro passo para acessibilidade, é nós marcarmos quais os elementos que nós achamos adequado ter acessibilidade
*/

class AccessibilityViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.image = R.image.gato()
            //Elementos que não tem reação de acessibilidade automática, devem ter a propriedade isAccessibilityElement alterada para true, caso contrário, não terá nenhuma informação disponível para o VoiceOver sobre esse elemento
            imageView.isAccessibilityElement = true
            imageView.accessibilityTraits = UIAccessibilityTraitImage
            imageView.accessibilityLabel = "Gatinho fofo"
        }
    }
    
    @IBOutlet weak var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.accessibilityLabel = "nome do gato"
            descriptionLabel.accessibilityValue = descriptionLabel.text
            //adjustsFontForContentSizeCategory é uma propriedade que deve ser alterada para true, para que o ajuste de fonte da acessibilidade, tenha efeito nessa label especificamente.
            descriptionLabel.adjustsFontForContentSizeCategory = true
        }
    }
    
    @IBOutlet weak var recalculateButton: UIButton! {
        didSet {
            recalculateButton.accessibilityTraits = UIAccessibilityTraitButton
            recalculateButton.accessibilityLabel = "Remover"
            recalculateButton.accessibilityHint = "Remove informações sobre o gato Arthur"
            recalculateButton.titleLabel?.adjustsFontForContentSizeCategory = true
        }
    }
    
    @IBOutlet weak var sliderDescription: UILabel! {
        didSet {
            sliderDescription.accessibilityHint = "abaixo tem uma barra de ajuste para alterar o valor do peso do gato Arthur"
            sliderDescription.adjustsFontForContentSizeCategory = true
        }
    }
    
    @IBOutlet weak var sliderAccesibility: UISlider! {
        didSet {
            sliderAccesibility.isAccessibilityElement = true
            sliderAccesibility.accessibilityTraits = UIAccessibilityTraitAdjustable
            sliderAccesibility.accessibilityLabel = "Peso"
            sliderAccesibility.accessibilityValue = "\(sliderAccesibility.value) kilos"
        }
    }
    
    @IBAction func sliderValueChange(_ sender: Any)
    {
        sliderAccesibility.accessibilityValue = "\(sliderAccesibility.value) kilos"
    }
}
