//
//  Player.swift
//  C.A.T MTG
//
//  Created by Marvin Gonçalves de Aquino on 2019-05-20.
//  Copyright © 2019 Marvin Gonçalves de Aquino. All rights reserved.
//

import Foundation

class Player {
    var name: String
    var id: Int
    var points: Int?
    var deck: Deck
    
    init(name: String, deck: Deck, id: Int){
        self.name = name
        self.deck = deck
        self.id = id
    }
}
