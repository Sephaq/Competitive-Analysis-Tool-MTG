//
//  ViewController.swift
//  C.A.T MTG
//
//  Created by Marvin Gonçalves de Aquino on 2019-05-13.
//  Copyright © 2019 Marvin Gonçalves de Aquino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let parametersView:  ParametersView = {
        let view = ParametersView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setupSubviews()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(parametersView)
        
        parametersView.autoPinEdgesToSuperviewSafeArea()
    }


}

