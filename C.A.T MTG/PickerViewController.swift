//
//  PickerView.swift
//  C.A.T MTG
//
//  Created by Marvin Gonçalves de Aquino on 2019-06-10.
//  Copyright © 2019 Marvin Gonçalves de Aquino. All rights reserved.
//

import Foundation
import UIKit

protocol ChooseDeck: class {
    func choosenDeck(deck: Deck)
    func choosenFormat(format: String)
}

class PickerViewController: UIViewController{
    
    var deckSource: [Deck] = []
    var stringSource: [String] = []
    var doneButton = UIButton.newAutoLayout()
    let pickerView = UIPickerView.newAutoLayout()
    weak var delegate: ChooseDeck?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(pickerView)
        self.view.addSubview(doneButton)
        pickerView.delegate = self
        pickerView.dataSource = self
        
        self.pickerView.layer.cornerRadius = 10.0
        self.pickerView.layer.borderWidth = 1.0
        self.pickerView.layer.borderColor = UIColor.lightGray.cgColor
        self.pickerView.backgroundColor = UIColor.white
        
        
        //MARK: set done Button frame, text and position
        self.doneButton.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
        self.doneButton.setTitle("Done", for: .normal)
        self.doneButton.layer.cornerRadius = 10.0
        self.doneButton.backgroundColor = UIColor.white
        self.doneButton.layer.borderWidth = 1.0
        self.doneButton.layer.borderColor = UIColor.lightGray.cgColor
        self.doneButton.setTitleColor(UIColor.blue, for: .normal)
        
        
        
        //Set Picker Constraint
        self.pickerView.autoPinEdge(toSuperviewEdge: .trailing)
        self.pickerView.autoPinEdge(toSuperviewEdge: .leading)
        
        //set Button Constraints
        self.doneButton.autoPinEdge(.top, to: .bottom, of: self.pickerView, withOffset: 5)
        self.doneButton.autoPinEdge(toSuperviewEdge: .trailing)
        self.doneButton.autoPinEdge(toSuperviewEdge: .leading)
        self.doneButton.autoPinEdge(toSuperviewEdge: .bottom, withInset: 5)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.7)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0)
    }
    
    func setDataSource(decks: [Deck], strings: [String]){
        self.deckSource = decks
        self.stringSource = strings
    }
    
    //Button Action
    @objc func buttonAction(sender: UIButton!){
        if (deckSource.count > 0){
            self.delegate?.choosenDeck(deck: self.deckSource[pickerView.selectedRow(inComponent: 0)])
        }else{
            self.delegate?.choosenFormat(format: self.stringSource[pickerView.selectedRow(inComponent: 0)])
        }
        self.dismiss(animated: true, completion: nil)
    }
}

extension PickerViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (deckSource.count > 0){
            return deckSource.count
        }
        return stringSource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (deckSource.count > 0){
            return deckSource[row].name
        }
        return stringSource[row]
    }
}
