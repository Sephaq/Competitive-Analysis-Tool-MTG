//
//  ParametersView.swift
//  C.A.T MTG
//
//  Created by Marvin Gonçalves de Aquino on 2019-05-13.
//  Copyright © 2019 Marvin Gonçalves de Aquino. All rights reserved.
//

import Foundation
import UIKit

class ParametersView: UIView{
    
    let LEADING_OFFSET = CGFloat(10)
    let TRAILING_OFFSET = CGFloat(10)
    let TOP_OFFSET = CGFloat(10)
    let BOTTOM_OFFSET = CGFloat(20)
    
    var didLayoutSubviews = false
    
    let infoLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 1
        label.tag = 1
        label.text = "Pick the parameters"
        label.textAlignment = .center
        label.layer.cornerRadius = 5
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.black.cgColor
        return label
    }()
    
    let formatChooser : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 1
        label.tag = 1
        label.text = "Format"
        label.textAlignment = .center
        label.layer.cornerRadius = 5
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.black.cgColor
        return label
    }()
    
    let deckChooser : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 1
        label.tag = 1
        label.text = "Deck"
        label.textAlignment = .center
        label.layer.cornerRadius = 5
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.black.cgColor
        return label
    }()
    
    let eventSizeChooser : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 1
        label.tag = 1
        label.text = "Event Size"
        label.textAlignment = .center
        label.layer.cornerRadius = 5
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.black.cgColor
        return label
    }()
    
    @objc let predictButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "switch"), for: .normal)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    
    func setupSubviews(){
        self.backgroundColor = UIColor.white
        self.addSubview(infoLabel)
        self.addSubview(formatChooser)
        self.addSubview(deckChooser)
        self.addSubview(eventSizeChooser)
        self.addSubview(predictButton)
        
        layoutSubviews()
    }
    
    override func layoutSubviews() {
        if !didLayoutSubviews{
            
            //infoLabel
            self.infoLabel.autoPinEdge(toSuperviewEdge: .top, withInset: TOP_OFFSET)
            self.infoLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: LEADING_OFFSET)
            self.infoLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: TRAILING_OFFSET)
            
            //FormatChooser
            self.formatChooser.autoPinEdge(.top, to: .bottom, of: self.infoLabel, withOffset: TOP_OFFSET)
            self.formatChooser.autoPinEdge(toSuperviewEdge: .leading, withInset: LEADING_OFFSET)
            self.formatChooser.autoPinEdge(toSuperviewEdge: .trailing, withInset: TRAILING_OFFSET)
            
            //DeckChooser
            self.deckChooser.autoPinEdge(.top, to: .bottom, of: self.formatChooser, withOffset: TOP_OFFSET)
            self.deckChooser.autoPinEdge(toSuperviewEdge: .leading, withInset: LEADING_OFFSET)
            self.deckChooser.autoPinEdge(toSuperviewEdge: .trailing, withInset: TRAILING_OFFSET)
            
            //eventSizerChooser
            self.eventSizeChooser.autoPinEdge(.top, to: .bottom, of: self.deckChooser, withOffset: TOP_OFFSET)
            self.eventSizeChooser.autoPinEdge(toSuperviewEdge: .leading, withInset: LEADING_OFFSET)
            self.eventSizeChooser.autoPinEdge(toSuperviewEdge: .trailing, withInset: TRAILING_OFFSET)
            
            //PredictButton
            self.predictButton.autoPinEdge(.top, to: .bottom, of: self.eventSizeChooser, withOffset: TOP_OFFSET)
            self.predictButton.autoPinEdge(toSuperviewEdge: .leading, withInset: LEADING_OFFSET)
            self.predictButton.autoPinEdge(toSuperviewEdge: .trailing, withInset: TRAILING_OFFSET)
            self.predictButton.autoPinEdge(toSuperviewEdge: .bottom, withInset: BOTTOM_OFFSET)
            
        }
        
        super.layoutSubviews()
    }
}
