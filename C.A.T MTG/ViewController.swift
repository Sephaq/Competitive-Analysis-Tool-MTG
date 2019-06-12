//
//  ViewController.swift
//  C.A.T MTG
//
//  Created by Marvin Gonçalves de Aquino on 2019-05-13.
//  Copyright © 2019 Marvin Gonçalves de Aquino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var choosendeck: Deck?
    var eventSize: EventSize?
    
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
        picker.setDataSource(decks: DeckInfo.getDecks())
        picker.delegate = self
        picker.preferredContentSize = .init(width: UIScreen.main.bounds.width, height: (UIScreen.main.bounds.height - (UIScreen.main.bounds.height/4)))
        picker.modalPresentationStyle = .overFullScreen
        self.present(picker, animated: true, completion: nil)
    }
    
    func pickEventSize(){
        let picker = PickerViewController()
        picker.setDataSource(decks: [])
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
    }
    
    func setDeck() {
        pickDeck()
    }
    
    func setEventSize() {
        print("Small?")
        pickEventSize()
    }
    
    func runPredict() {
        if let deck = choosendeck, let size = eventSize {
            self.present(PredictionViewController(deck: deck, format: "Modern", eventSize: size), animated: true, completion: nil)
        }else{
            let alert = UIAlertController(title: NSLocalizedString("choiceErrorTitle", comment: ""),
                                          message: NSLocalizedString("choiceErrorText", comment: ""),
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { alertAction in
                alert.dismiss(animated: true, completion: nil)
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}

extension ViewController: ChooseDeck{
    
    
    func choosenSize(size: EventSize) {
        eventSize = size
        self.parametersView.eventSizeChooser.text? = "\(NSLocalizedString("eventSize", comment: "")): \(size.localizedString())"
    }
    
    
    func choosenDeck(deck: Deck) {
        choosendeck = deck
        self.parametersView.deckChooser.text? = "\(NSLocalizedString("format", comment: "")): \(deck.name)"
    }
    
    
}

