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
    
    let choiceContainer: UIView = {
       let view = UIView.newAutoLayout()
        view.layer.borderWidth = 5
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
        view.layer.borderWidth = 5
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
        
}
