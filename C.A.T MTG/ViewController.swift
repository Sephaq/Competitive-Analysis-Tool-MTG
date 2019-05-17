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
        self.parametersView.delegate = self
        self.view.addSubview(parametersView)
        
        parametersView.autoPinEdgesToSuperviewSafeArea()
    }


}

extension ViewController: setParametersAndPredict{
    func setFormat() {
        print("Modern?")
        self.parametersView.formatChooser.text?.append(contentsOf: " Modern")
//        self.parametersView.formatChooser.text = "\(NSLocalizedString("format", comment: "")): \()"
    }
    
    func setDeck() {
        print("UB Mill?")
        self.parametersView.deckChooser.text?.append(contentsOf: " UB Mill")
//        self.parametersView.formatChooser.text = "\(NSLocalizedString("deck", comment: "")): \()"
    }
    
    func setEventSize() {
        print("Small?")
        self.parametersView.eventSizeChooser.text?.append(contentsOf: " Small")
//        self.parametersView.formatChooser.text = "\(NSLocalizedString("eventSize", comment: "")): \()"
    }
    
    func runPredict() {
        print("No can do!")
    }
    
    
}

