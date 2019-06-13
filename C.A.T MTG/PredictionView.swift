//
//  PredictionView.swift
//  C.A.T MTG
//
//  Created by Marvin Gonçalves de Aquino on 2019-06-12.
//  Copyright © 2019 Marvin Gonçalves de Aquino. All rights reserved.
//

import Foundation
import UIKit

class PredictionView: UIView{
    
    var didLayoutSubviews = false
    
    let choiceContainer: UIView = {
       let view = UIView.newAutoLayout()
        view.layer.borderWidth = 2
        view.layer.cornerRadius = 5
        view.layer.borderColor = UIColor.black.cgColor
        return view
    }()
    
    let deckInfoTitle: UILabel = {
        let label = UILabel.newAutoLayout()
        label.text = "\(NSLocalizedString("deckInfo", comment: "")):"
        return label
    }()
    
    let deckInfoLabel: UILabel = {
        let label = UILabel.newAutoLayout()
        return label
    }()
    
    let eventSizeTitle: UILabel = {
        let label = UILabel.newAutoLayout()
        label.text = "\(NSLocalizedString("eventSize", comment: "")):"
        return label
    }()
    
    let eventSizeLabel: UILabel = {
        let label = UILabel.newAutoLayout()
        return label
    }()
    
    let eventRoundsTitle: UILabel = {
        let label = UILabel.newAutoLayout()
        label.text = "\(NSLocalizedString("rounds", comment: "")):"
        return label
    }()
    
    let eventRoundsLabel: UILabel = {
        let label = UILabel.newAutoLayout()
        return label
    }()
    
    let eventNofPLayersTitle: UILabel = {
        let label = UILabel.newAutoLayout()
        label.text = "\(NSLocalizedString("nOfPLayers", comment: "")):"
        return label
    }()
    
    let eventNofPLayersLabel: UILabel = {
        let label = UILabel.newAutoLayout()
        return label
    }()
    
    let predictionContainer: UIView = {
        let view = UIView.newAutoLayout()
        view.layer.borderWidth = 2
        view.layer.cornerRadius = 5
        view.layer.borderColor = UIColor.black.cgColor
        return view
    }()
    
    let predictionTitle: UILabel = {
        let label = UILabel.newAutoLayout()
        return label
    }()
    
    let predictionLabel: UILabel = {
        let label = UILabel.newAutoLayout()
        return label
    }()
    
    let button: UIButton = {
        let button = UIButton.newAutoLayout()
        return button
    }()
    
    func setupSubviews(){
        self.addSubview(choiceContainer)
        self.choiceContainer.addSubview(deckInfoTitle)
        self.choiceContainer.addSubview(deckInfoLabel)
        self.choiceContainer.addSubview(eventSizeTitle)
        self.choiceContainer.addSubview(eventSizeLabel)
        self.choiceContainer.addSubview(eventRoundsTitle)
        self.choiceContainer.addSubview(eventRoundsLabel)
        self.choiceContainer.addSubview(eventNofPLayersTitle)
        self.choiceContainer.addSubview(eventNofPLayersLabel)
        
        self.addSubview(predictionContainer)
        self.predictionContainer.addSubview(predictionTitle)
        self.predictionContainer.addSubview(predictionLabel)
        
        self.addSubview(button)
        
        layoutSubviews()
    }
    
    override func layoutSubviews() {
        if(!didLayoutSubviews){
            self.choiceContainer.autoPinEdges(toSuperviewMarginsExcludingEdge: .bottom)
            
            //deckInfo Title
            self.deckInfoTitle.autoPinEdge(toSuperviewMargin: .top)
            self.deckInfoTitle.autoPinEdge(toSuperviewMargin: .leading)
            //deckInfo Label
            self.deckInfoLabel.autoPinEdge(toSuperviewMargin: .top)
            self.deckInfoLabel.autoPinEdge(toSuperviewMargin: .trailing)
            self.deckInfoLabel.autoPinEdge(.leading, to: .trailing, of: self.deckInfoTitle, withOffset: 5)
            
            //EventSize Title
            self.eventSizeTitle.autoPinEdge(.top, to: .bottom, of: self.deckInfoTitle, withOffset: 2)
            self.eventSizeTitle.autoPinEdge(toSuperviewMargin: .leading)
            //eventSize Label
            self.eventSizeLabel.autoPinEdge(.top, to: .top, of: self.eventSizeTitle)
            self.eventSizeLabel.autoPinEdge(toSuperviewMargin: .trailing)
            self.eventSizeLabel.autoPinEdge(.leading, to: .leading, of: self.eventSizeTitle, withOffset: 5)
            
            //Rounds Title
            self.eventRoundsTitle.autoPinEdge(.top, to: .bottom, of: self.eventSizeTitle, withOffset: 2)
            self.eventRoundsTitle.autoPinEdge(toSuperviewMargin: .leading)
            //Rounds Label
            self.eventRoundsLabel.autoPinEdge(.top, to: .top, of: self.eventRoundsTitle)
            self.eventRoundsLabel.autoPinEdge(toSuperviewMargin: .trailing)
            self.eventRoundsLabel.autoPinEdge(.leading, to: .leading, of: self.eventRoundsTitle, withOffset: 5)
            
            //N of Players Title
            self.eventNofPLayersTitle.autoPinEdge(.top, to: .bottom, of: self.eventRoundsTitle, withOffset: 2)
            self.eventNofPLayersTitle.autoPinEdge(toSuperviewMargin: .leading)
            self.eventNofPLayersTitle.autoPinEdge(toSuperviewMargin: .bottom)
            //N of Players Label
            self.eventNofPLayersLabel.autoPinEdge(.top, to: .top, of: self.eventNofPLayersTitle)
            self.eventNofPLayersLabel.autoPinEdge(toSuperviewMargin: .trailing)
            self.eventNofPLayersLabel.autoPinEdge(toSuperviewMargin: .bottom)
            self.eventNofPLayersLabel.autoPinEdge(.leading, to: .leading, of: self.eventNofPLayersTitle, withOffset: 5)
            
            self.predictionContainer.autoPinEdge(.top, to: .bottom, of: self.choiceContainer, withOffset: 5)
            self.predictionContainer.autoPinEdge(toSuperviewSafeArea: .leading)
            self.predictionContainer.autoPinEdge(toSuperviewSafeArea: .trailing)
            
            //Prediction Title
            self.predictionTitle.autoPinEdges(toSuperviewMarginsExcludingEdge: .bottom)
            //Prediction Label
            self.predictionLabel.autoPinEdges(toSuperviewMarginsExcludingEdge: .top)
            self.predictionLabel.autoPinEdge(.top, to: .bottom, of: self.predictionTitle, withOffset: 5)
            
            self.button.autoPinEdges(toSuperviewMarginsExcludingEdge: .top)
            self.button.autoPinEdge(.top, to: .bottom, of: self.predictionContainer, withOffset: 5)
            
            didLayoutSubviews = true
        }
        super.layoutSubviews()
    }
        
}
