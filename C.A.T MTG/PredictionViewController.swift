//
//  PredictionViewController.swift
//  C.A.T MTG
//
//  Created by Marvin Gonçalves de Aquino on 2019-06-12.
//  Copyright © 2019 Marvin Gonçalves de Aquino. All rights reserved.
//

import Foundation
import UIKit

class PredictionViewController: UIViewController {
    
    let predictor: Predictor
    let predictionView: PredictionView = {
        let view = PredictionView.newAutoLayout()
        view.setupSubviews()
        return view
    }()
    
    init(deck: Deck, format: String, eventSize: EventSize) {
        predictor = Predictor(player: Player(name: "mainPLayer", deck: deck, id: 0))
        predictor.generateEvent(eventSize: eventSize)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(predictionView)
        self.predictionView.autoPinEdgesToSuperviewSafeArea()
        eventResult()
    }
    
    func eventResult(){
        predictor.iterateRounds()
        let player = predictor.getChoosenPlayer()
        let event = predictor.getEvent()
        self.predictionView.deckInfoLabel.text = player.deck.name
        self.predictionView.eventRoundsLabel.text = "\(String(describing: event.rounds))"
        self.predictionView.eventSizeLabel.text = event.eventSize?.localizedString()
        self.predictionView.eventNofPLayersLabel.text = "\(event.players.count)"
        self.predictionView.predictionLabel.text = "\(predictor.predictResult()*100)%"
    }
    
    
}
