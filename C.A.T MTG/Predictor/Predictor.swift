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
    
    func generateEvent(eventSize: EventSize){
        mainEvent = EventGenerator.generateEvent(eventSize: eventSize, choosenPlayer: choosenPlayer)
    }
    
    func roundResults(){
        for index in mainEvent.roundsHistory.last!.matchup.indices {
            let matchup = mainEvent.roundsHistory.last!.matchup[index]
            var results: [String:Double] = [:]
                do {
                    results.updateValue(try self.model.prediction(matchup: Double(self.mainEvent.roundsHistory.last!.matchup[index].deckMatchup)!, winPercentage: 1).prediction, forKey: "2-0")
                    results.updateValue(try self.model.prediction(matchup: Double(self.mainEvent.roundsHistory.last!.matchup[index].deckMatchup)!, winPercentage: 0.6666).prediction, forKey: "2-1")
                    results.updateValue(try self.model.prediction(matchup: Double(self.mainEvent.roundsHistory.last!.matchup[index].deckMatchup)!, winPercentage: 0.333).prediction, forKey: "1-2")
                    results.updateValue(try self.model.prediction(matchup: Double(self.mainEvent.roundsHistory.last!.matchup[index].deckMatchup)!, winPercentage: 0).prediction, forKey: "0-2")
                }catch{
                    print("Model Error")
                }
            
            if (mainEvent.roundsHistory.last!.matchup[index].player.id == choosenPlayer.id || mainEvent.roundsHistory.last!.matchup[index].opponent.id == choosenPlayer.id){
                if (mainEvent.roundsHistory.last!.matchup[index].player.id == choosenPlayer.id){
                    predictPerRound.append(results["2-0"]!)
                    mainEvent.roundsHistory.last!.matchup[index].victory = 2
                    mainEvent.roundsHistory.last!.matchup[index].loss = 0
                    mainEvent.players[matchup.player.id].points += 3
                }else{
                    predictPerRound.append(results["0-2"]!)
                    mainEvent.roundsHistory.last!.matchup[index].victory = 0
                    mainEvent.roundsHistory.last!.matchup[index].loss = 2
                    mainEvent.players[matchup.opponent.id].points += 3
                }
                
            }else{
                let maxValue = results.max(by: {a,b in a.value < b.value})
                print("Result: \(String(describing: maxValue?.key))")
                print("Value: \(String(describing: maxValue?.value))")
                switch(maxValue?.key){
                case "2-0":
                    mainEvent.roundsHistory.last!.matchup[index].victory = 2
                    mainEvent.roundsHistory.last!.matchup[index].loss = 0
                    mainEvent.players[matchup.player.id].points += 3
                    break
                case "2-1":
                    mainEvent.roundsHistory.last!.matchup[index].victory = 2
                    mainEvent.roundsHistory.last!.matchup[index].loss = 1
                    mainEvent.players[matchup.player.id].points += 3
                    break
                case "1-2":
                    mainEvent.roundsHistory.last!.matchup[index].victory = 1
                    mainEvent.roundsHistory.last!.matchup[index].loss = 2
                    mainEvent.players[matchup.opponent.id].points += 3
                    break
                default:
                    mainEvent.roundsHistory.last!.matchup[index].victory = 0
                    mainEvent.roundsHistory.last!.matchup[index].loss = 2
                    mainEvent.players[matchup.opponent.id].points += 3
                    break
                }
            }
        }
    }
    
    func predictResult() -> Double{
        if predictPerRound.count > 1{
            return predictPerRound.popLast()!/predictResult()
        }else{
            return predictPerRound.popLast()!
        }
    }
    
    func iterateRounds(){
        for _ in 0...mainEvent.rounds!{
            //Generate Round
            mainEvent.roundsHistory.append(EventGenerator.newRound(event: mainEvent))
            //Define Results
            roundResults()
        }
    }
    
    func getChoosenPlayer() -> Player{
        return choosenPlayer
    }
    
    func getEvent() -> Event{
        return mainEvent
    }
    
}
