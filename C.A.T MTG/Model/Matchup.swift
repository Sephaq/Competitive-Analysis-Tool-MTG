//
//  Matchup.swift
//  C.A.T MTG
//
//  Created by Marvin Gonçalves de Aquino on 2019-05-13.
//  Copyright © 2019 Marvin Gonçalves de Aquino. All rights reserved.
//

import Foundation

class Matchup {
    var player: Player
    var opponent: Player
    var playerMatchup: String
    var deckMatchup: String
    var victory: Int?
    var loss: Int?
    
    init(player: Player, opponent: Player) {
        self.player = player
        self.opponent = opponent
        self.deckMatchup = String("\(self.player.deck.id)\(self.opponent.deck.id)")
        self.playerMatchup = String("\(self.player.name)\(self.opponent.name)")
    }
}
