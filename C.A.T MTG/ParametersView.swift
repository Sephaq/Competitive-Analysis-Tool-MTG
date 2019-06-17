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
        label.text = "\(NSLocalizedString("pickTheParameters", comment: "")):"
        label.textAlignment = .center
        label.layer.cornerRadius = 5
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.black.cgColor
        return label
    }()
    
    let formatContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        return view
    }()
    
    let formatChooser : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.isUserInteractionEnabled = true
        label.numberOfLines = 1
        label.tag = 1
        label.text = "\(NSLocalizedString("format", comment: "")):"
        label.textAlignment = .left
        return label
    }()
    
    let deckContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        return view
    }()
    
    let deckChooser : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.isUserInteractionEnabled = true
        label.numberOfLines = 1
        label.tag = 1
        label.text = "\(NSLocalizedString("deck", comment: "")):"
        label.textAlignment = .left
        return label
    }()
    
    let eventContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        return view
    }()
    
    let eventSizeChooser : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.isUserInteractionEnabled = true
        label.numberOfLines = 1
        label.tag = 1
        label.text = "\(NSLocalizedString("eventSize", comment: "")):"
        label.textAlignment = .left
        return label
    }()
    
    @objc let predictButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(NSLocalizedString("makePrediction", comment: ""), for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    
    func setupSubviews(){
        self.backgroundColor = UIColor.white
        self.addSubview(infoLabel)
        self.addSubview(formatContainer)
        self.formatContainer.addSubview(formatChooser)
        self.addSubview(deckContainer)
        self.deckContainer.addSubview(deckChooser)
        self.addSubview(eventContainer)
        self.eventContainer.addSubview(eventSizeChooser)
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
            
            //Format Container
            self.formatContainer.autoPinEdge(.top, to: .bottom, of: self.infoLabel, withOffset: TOP_OFFSET)
            self.formatContainer.autoPinEdge(toSuperviewEdge: .leading, withInset: LEADING_OFFSET)
            self.formatContainer.autoPinEdge(toSuperviewEdge: .trailing, withInset: TRAILING_OFFSET)
            self.formatContainer.autoSetDimension(.height, toSize: UIScreen.main.bounds.height * 0.12)
            
            //FormatChooser
            self.formatChooser.autoPinEdgesToSuperviewEdges(with: .init(top: 0, left: 10, bottom: 0, right: 0))
            
            //Deck Container
            self.deckContainer.autoPinEdge(.top, to: .bottom, of: self.formatContainer, withOffset: TOP_OFFSET)
            self.deckContainer.autoPinEdge(toSuperviewEdge: .leading, withInset: LEADING_OFFSET)
            self.deckContainer.autoPinEdge(toSuperviewEdge: .trailing, withInset: TRAILING_OFFSET)
            self.deckContainer.autoSetDimension(.height, toSize: UIScreen.main.bounds.height * 0.12)
            
            //DeckChooser
            self.deckChooser.autoPinEdgesToSuperviewEdges(with: .init(top: 0, left: 10, bottom: 0, right: 0))
            
            //EventSizeContainer
            self.eventContainer.autoPinEdge(.top, to: .bottom, of: self.deckContainer, withOffset: TOP_OFFSET)
            self.eventContainer.autoPinEdge(toSuperviewEdge: .leading, withInset: LEADING_OFFSET)
            self.eventContainer.autoPinEdge(toSuperviewEdge: .trailing, withInset: TRAILING_OFFSET)
            self.eventContainer.autoSetDimension(.height, toSize: UIScreen.main.bounds.height * 0.12)
            
            //eventSizerChooser
            self.eventSizeChooser.autoPinEdgesToSuperviewEdges(with: .init(top: 0, left: 10, bottom: 0, right: 0))
            
            //PredictButton
            self.predictButton.autoPinEdge(.top, to: .bottom, of: self.eventContainer, withOffset: TOP_OFFSET)
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
        let formatTouch = UITapGestureRecognizer()
        formatTouch.addTarget(self, action: #selector(chooseFormat(_:)))
        self.formatContainer.addGestureRecognizer(formatTouch)
        
        //ChooseDeck
        let deckTouch = UITapGestureRecognizer()
        deckTouch.addTarget(self, action: #selector(chooseDeck(_:)))
        self.deckContainer.addGestureRecognizer(deckTouch)
        
        //EventSize
        let eventTouch = UITapGestureRecognizer()
        eventTouch.addTarget(self, action: #selector(chooseEventSize(_:)))
        self.eventContainer.addGestureRecognizer(eventTouch)
    }
    
    @objc func chooseFormat(_ sender: UITapGestureRecognizer){
        delegate?.setFormat()
    }
    
    @objc func chooseDeck(_ sender: UITapGestureRecognizer){
        delegate?.setDeck()
    }
    
    @objc func chooseEventSize(_ sender: UITapGestureRecognizer){
        delegate?.setEventSize()
    }
    
    @objc func makePrediction(_ sender: UIButton){
        delegate?.runPredict()
    }
}
