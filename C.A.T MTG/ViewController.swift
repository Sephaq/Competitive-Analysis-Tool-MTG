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
        DeckInfo.loadDeckLists()
        DeckInfo.loadDeckInfo()
        parametersView.autoPinEdgesToSuperviewSafeArea()
        self.title = NSLocalizedString("C.A.T.", comment: "")
    }
    
    func pickDeck(){
        let picker = PickerViewController()
        picker.setDataSource(decks: DeckInfo.getDecks(), strings: [])
        picker.delegate = self
        picker.preferredContentSize = .init(width: UIScreen.main.bounds.width, height: (UIScreen.main.bounds.height - (UIScreen.main.bounds.height/4)))
        picker.modalPresentationStyle = .overFullScreen
        self.present(picker, animated: true, completion: nil)
    }


}

extension ViewController: setParametersAndPredict{
    func setFormat() {
        print("Modern?")
        self.parametersView.formatChooser.text?.append(contentsOf: " Modern")
//        self.parametersView.formatChooser.text = "\(NSLocalizedString("format", comment: "")): \()"
    }
    
    func setDeck() {
        pickDeck()
    }
    
    func setEventSize() {
        print("Small?")
        self.parametersView.eventSizeChooser.text?.append(contentsOf: " Small")
//        self.parametersView.formatChooser.text = "\(NSLocalizedString("eventSize", comment: "")): \()"
    }
    
    func runPredict() {
        print("No can do!")
        //TODO: Make basic prediction first
    }
    
}

extension ViewController: ChooseDeck{
    
    func choosenDeck(deck: Deck) {
        self.parametersView.deckChooser.text? = "\(NSLocalizedString("format", comment: "")): \(deck.name)"
    }
    
    func choosenFormat(format: String) {
//        nada acontece
    }
    
    
}

