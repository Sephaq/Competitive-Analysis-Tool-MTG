//
//  ParametersView.swift
//  C.A.T MTG
//
//  Created by Marvin Gonçalves de Aquino on 2019-05-13.
//  Copyright © 2019 Marvin Gonçalves de Aquino. All rights reserved.
//

import Foundation
import UIKit

protocol setParametersAndPredict {
    func setFormat()
    func setDeck()
    func setEventSize()
    func runPredict()
}

class ParametersView: UIView{
    
    let LEADING_OFFSET = CGFloat(10)
    let TRAILING_OFFSET = CGFloat(10)
    let TOP_OFFSET = CGFloat(10)
    let BOTTOM_OFFSET = CGFloat(20)
    
    var delegate: setParametersAndPredict!
    
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
    
    let formatContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        return view
    }()
    
    let formatChooser : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 1
        label.tag = 1
        label.text = "Format:"
        label.textAlignment = .left
        return label
    }()
    
    let deckContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        return view
    }()
    
    let deckChooser : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 1
        label.tag = 1
        label.text = "Deck:"
        label.textAlignment = .left
        return label
    }()
    
    let eventContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        return view
    }()
    
    let eventSizeChooser : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 1
        label.tag = 1
        label.text = "Event Size:"
        label.textAlignment = .left
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
            self.infoLabel.autoSetDimension(.height, toSize: UIScreen.main.bounds.height * 0.12)
            
            //FormatChooser
            self.formatChooser.autoPinEdge(.top, to: .bottom, of: self.infoLabel, withOffset: TOP_OFFSET)
            self.formatChooser.autoPinEdge(toSuperviewEdge: .leading, withInset: LEADING_OFFSET)
            self.formatChooser.autoPinEdge(toSuperviewEdge: .trailing, withInset: TRAILING_OFFSET)
            self.formatChooser.autoSetDimension(.height, toSize: UIScreen.main.bounds.height * 0.12)
            
            //DeckChooser
            self.deckChooser.autoPinEdge(.top, to: .bottom, of: self.formatChooser, withOffset: TOP_OFFSET)
            self.deckChooser.autoPinEdge(toSuperviewEdge: .leading, withInset: LEADING_OFFSET)
            self.deckChooser.autoPinEdge(toSuperviewEdge: .trailing, withInset: TRAILING_OFFSET)
            self.deckChooser.autoSetDimension(.height, toSize: UIScreen.main.bounds.height * 0.12)
            
            //eventSizerChooser
            self.eventSizeChooser.autoPinEdge(.top, to: .bottom, of: self.deckChooser, withOffset: TOP_OFFSET)
            self.eventSizeChooser.autoPinEdge(toSuperviewEdge: .leading, withInset: LEADING_OFFSET)
            self.eventSizeChooser.autoPinEdge(toSuperviewEdge: .trailing, withInset: TRAILING_OFFSET)
            self.eventSizeChooser.autoSetDimension(.height, toSize: UIScreen.main.bounds.height * 0.12)
            
            //PredictButton
            self.predictButton.autoPinEdge(.top, to: .bottom, of: self.eventSizeChooser, withOffset: TOP_OFFSET)
            self.predictButton.autoPinEdge(toSuperviewEdge: .leading, withInset: LEADING_OFFSET)
            self.predictButton.autoPinEdge(toSuperviewEdge: .trailing, withInset: TRAILING_OFFSET)
            self.predictButton.autoPinEdge(toSuperviewEdge: .bottom, withInset: BOTTOM_OFFSET)
            
            setupButtons()
            
        }
        
        super.layoutSubviews()
    }
    
    func setupButtons(){
        self.predictButton.addTarget(self, action: #selector(makePrediction), for: .touchUpInside)
        
        //chooseFormat
        let formatTouch = UIGestureRecognizer()
        formatTouch.addTarget(self, action: #selector(chooseFormat))
        self.eventSizeChooser.addGestureRecognizer(formatTouch)
        
        //ChooseDeck
        let deckTouch = UIGestureRecognizer()
        deckTouch.addTarget(self, action: #selector(chooseDeck))
        self.deckChooser.addGestureRecognizer(deckTouch)
        
        //EventSize
        let eventTouch = UIGestureRecognizer()
        eventTouch.addTarget(self, action: #selector(chooseEventSize))
        self.eventSizeChooser.addGestureRecognizer(eventTouch)
    }
    
    @objc func chooseFormat(){
        delegate?.setFormat()
    }
    
    @objc func chooseDeck(){
        delegate?.setDeck()
    }
    
    @objc func chooseEventSize(){
        delegate?.setEventSize()
    }
    
    @objc func makePrediction(){
        delegate?.runPredict()
    }
}
