//
//  EventGenerator.swift
//  C.A.T MTG
//
//  Created by Marvin Gonçalves de Aquino on 2019-05-17.
//  Copyright © 2019 Marvin Gonçalves de Aquino. All rights reserved.
//

import Foundation

class EventGenerator: NSObject {
    
    static func setPlayers() -> [Deck]{
        
    }
    
    static func generateEvent(eventSize: EventSize, choosenDeck: Deck) -> Event{
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
        event.decks.append(choosenDeck)
        event.decks.append(contentsOf: setPlayers())
        return event
    }
    
    static func newRound(event: Event) -> Round {
        let round = Round()
    }
}
