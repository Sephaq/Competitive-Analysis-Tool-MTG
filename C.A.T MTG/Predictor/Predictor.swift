//
//  Predictor.swift
//  C.A.T MTG
//
//  Created by Marvin Gonçalves de Aquino on 2019-05-17.
//  Copyright © 2019 Marvin Gonçalves de Aquino. All rights reserved.
//

import Foundation
import CoreML

class Predictor {
    
    private var mainEvent: Event = Event()
    private let model = decksMatchup()
    private var predictPerRound: [Double] = []
    private var choosenPlayer: Player
    
    init(player: Player) {
        choosenPlayer = player
    }
    
    func roundResults(){
        guard var matchups = mainEvent.roundsHistory.last?.matchup else {
            print("error")
            return
        }
        
        for matchup in matchups {
            var results: [String:Double] = [:]
                do {
                    results.updateValue(try self.model.prediction(matchup: Double(matchup.deckMatchup)!, winPercentage: 1).prediction, forKey: "2-0")
                    results.updateValue(try self.model.prediction(matchup: Double(matchup.deckMatchup)!, winPercentage: 0.6666).prediction, forKey: "2-1")
                    results.updateValue(try self.model.prediction(matchup: Double(matchup.deckMatchup)!, winPercentage: 0.333).prediction, forKey: "1-2")
                    results.updateValue(try self.model.prediction(matchup: Double(matchup.deckMatchup)!, winPercentage: 0).prediction, forKey: "0-2")
                }catch{
                    print("Model Error")
                }
            
            if (matchup.player.id == choosenPlayer.id || matchup.opponent.id == choosenPlayer.id){
                if (matchup.player.id == choosenPlayer.id){
                    predictPerRound.append(results["2-0"]!)
                    matchup.victory = 2
                    matchup.loss = 0
                }else{
                    predictPerRound.append(results["0-2"]!)
                    matchup.victory = 0
                    matchup.loss = 2
                }
                
            }else{
                let maxValue = results.max(by: {a,b in a.value < b.value})
                print("Result: \(String(describing: maxValue?.key))")
                print("Value: \(String(describing: maxValue?.value))")
                switch(maxValue?.key){
                case "2-0":
                    matchup.victory = 2
                    matchup.loss = 0
                    break
                case "2-1":
                    matchup.victory = 2
                    matchup.loss = 1
                    break
                case "1-2":
                    matchup.victory = 1
                    matchup.loss = 2
                    break
                default:
                    matchup.victory = 0
                    matchup.loss = 2
                    break
                }
            }
        }
    }
    
    func predictResult() -> Float{
    }
    
}
