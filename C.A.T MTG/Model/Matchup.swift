//
//  Matchup.swift
//  C.A.T MTG
//
//  Created by Marvin Gonçalves de Aquino on 2019-05-13.
//  Copyright © 2019 Marvin Gonçalves de Aquino. All rights reserved.
//

import Foundation

class Matchup {
    var deck: Int
    var opponentDeck: Int
    var matchup: String
    var victory: Int?
    var loss: Int?
    
    init(deck: Int, opponentDeck: Int) {
        self.deck = deck
        self.opponentDeck = opponentDeck
        self.matchup = String("\(self.deck)\(self.opponentDeck)")
    }
}
