//
//  EventGenerator.swift
//  C.A.T MTG
//
//  Created by Marvin Gonçalves de Aquino on 2019-05-17.
//  Copyright © 2019 Marvin Gonçalves de Aquino. All rights reserved.
//

import Foundation

class EventGenerator: NSObject {
    
    static func setPlayers() -> [Player]{
        //TODO: Set Players based on deck presence
        return Array<Player>()
    }
    
    static func generateEvent(eventSize: EventSize, choosenPlayer: Player) -> Event{
        let event = Event()
        event.eventSize = eventSize
        switch eventSize {
        case .big:
            event.rounds = 15
        case .medium:
            event.rounds = 7
        default:
            event.rounds = 4
        }
        event.players.append(choosenPlayer)
        event.players.append(contentsOf: setPlayers())
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
            for pOpponent in event.players.filter({ opponent in (player.points! <= opponent.points! &&
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
                            if (maybeOpponent?.points ?? 0 < pOpponent.points ?? 0) {
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
