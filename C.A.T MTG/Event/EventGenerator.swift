//
//  EventGenerator.swift
//  C.A.T MTG
//
//  Created by Marvin Gonçalves de Aquino on 2019-05-17.
//  Copyright © 2019 Marvin Gonçalves de Aquino. All rights reserved.
//

import Foundation

class EventGenerator: NSObject {
    
    static func setPlayers(players: Int) -> [Player]{
        let representativity = DeckInfo.deckRepresentativty()
        var playersDeck = Array<Player>()
        var nOfDecks: [Int:Int] = [:]
        var total = 0
        for i in representativity{
            nOfDecks.updateValue(Int(roundf(i.value * Float(players))), forKey: i.key)
            total += Int(roundf(i.value * Float(players)))
        }
        let decksId = Array(nOfDecks.keys).count
            for i in 1...players+1{
                let randomDeck = Int.random(in: 0...decksId)
                print(nOfDecks[randomDeck])
                playersDeck.append(Player(name: "player\(i)", deck: DeckInfo.getDeckInfo(id: randomDeck), id: i))
                
            }
        return playersDeck
    }
    
    static func generateEvent(eventSize: EventSize, choosenPlayer: Player) -> Event{
        let event = Event()
        var nPlayers = 0
        event.eventSize = eventSize
        switch eventSize {
        case .big:
            event.rounds = 10 //Players 410+
            nPlayers = 410
        case .medium:
            event.rounds = 7 //Players 128 MAX
            nPlayers = 128
        default:
            event.rounds = 4 //Playersd 16 MAX
            nPlayers = 16
        }
        event.players.append(choosenPlayer)
        event.players.append(contentsOf: setPlayers(players: nPlayers))
        return event
    }
    
    static func newRound(event: Event) -> Round {
        let round = Round()
        var pairedPlayers = Array<Player>()
        outer: for player in event.players{
            if pairedPlayers.contains(where: { pairedPlayer -> Bool in
                pairedPlayer.id == player.id
            }){
                continue outer
            }
            var maybeOpponent: Player?
            for pOpponent in event.players.filter({ opponent in (player.points <= opponent.points &&
                player.id != opponent.id &&
                !(havePlayedAgainst(p1: player, p2: opponent, event: event)) &&
                !pairedPlayers.contains(where: { pairedPlayer -> Bool in pairedPlayer.id == opponent.id }))}){
                    if (player.points == pOpponent.points){
                        round.matchup.append(Matchup(player: player, opponent: pOpponent))
                        pairedPlayers.append(player)
                        pairedPlayers.append(pOpponent)
                        continue outer
                    }else{
                        if maybeOpponent == nil{
                            maybeOpponent = pOpponent
                        }else{
                            if (maybeOpponent?.points ?? 0 < pOpponent.points) {
                                maybeOpponent = pOpponent
                            }
                        }
                }
            }
            round.matchup.append(Matchup(player: player, opponent: maybeOpponent!))
            pairedPlayers.append(player)
            pairedPlayers.append(maybeOpponent!)
        }
        return round
    }
    
    static func havePlayedAgainst(p1: Player, p2: Player, event: Event) -> Bool{
        for rounds in event.roundsHistory{
            for matchup in rounds.matchup{
                if (matchup.playerMatchup.elementsEqual("\(p1.name)\(p2.name)") || matchup.playerMatchup.elementsEqual("\(p2.name)\(p1.name)")){
                    return true
                }
            }
        }
        return false
    }
}
