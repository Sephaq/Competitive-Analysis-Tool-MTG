//
//  Deck.swift
//  C.A.T MTG
//
//  Created by Marvin Gonçalves de Aquino on 2019-05-13.
//  Copyright © 2019 Marvin Gonçalves de Aquino. All rights reserved.
//

import Foundation


class Deck{
    var name: String
    var type: String
    var id: Int
    
    init(name: String, type: String, id: Int) {
        self.name = name
        self.type = type
        self.id = id
    }
}
