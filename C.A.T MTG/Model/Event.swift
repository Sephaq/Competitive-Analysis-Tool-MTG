//
//  Event.swift
//  C.A.T MTG
//
//  Created by Marvin Gonçalves de Aquino on 2019-05-17.
//  Copyright © 2019 Marvin Gonçalves de Aquino. All rights reserved.
//

import Foundation
enum EventSize {
    case small
    case medium
    case big
}

class Event {
    var eventSize: EventSize?
    var rounds: Int?
    var roundsHistory = Array<Round>()
    var players = Array<Player>()
}
