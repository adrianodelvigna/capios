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
            imageView.isAccessibilityElement = true
        }
    }
    
    @IBOutlet weak var descriptionLabel: UILabel! {
        didSet {
            
        }
    }
    
    @IBOutlet weak var button: UIButton! {
        didSet {
            
        }
    }
}
