//
//  DeckInfo.swift
//  C.A.T MTG
//
//  Created by Marvin Gonçalves de Aquino on 2019-06-06.
//  Copyright © 2019 Marvin Gonçalves de Aquino. All rights reserved.
//

import Foundation


class DeckInfo: NSObject {
    
    static private var deckLists = Array<Deck>()
    static private var deckRepresentativity: [Int:Int] = [:]
    static private var totalDecks: Int = 0
    
    static func loadDeckLists(){
        var totalDecks = Array<Deck>()
        if let path = Bundle.main.path(forResource: "deckList", ofType: ".json"){
            do{
                let url = URL(fileURLWithPath: path)
                let data = try Data(contentsOf: url)
                let json = try JSON(data: data)
                let jsonArray = json["decks"].arrayValue
                for deck in jsonArray{
                    totalDecks.append(Deck(name: deck["name"].stringValue, type: deck["archetype"].stringValue, id: deck["deckid"].intValue))
                }
            }catch {
                print("Json Error")
            }
        }
        deckLists = totalDecks
        print(deckLists)
        
    }
    
    static func loadDeckInfo(){
        
        var totalDecks = Array<Deck>()
        if let path = Bundle.main.path(forResource: "deckRepresentativity", ofType: ".json"){
            do{
                let url = URL(fileURLWithPath: path)
                let data = try Data(contentsOf: url)
                let json = try JSON(data: data)
                let jsonArray = json["representativity"].arrayValue
                for deck in jsonArray{
                    totalDecks.append(Deck(name: deckLists[(deck["deckId"].intValue)-1].name, type: deckLists[(deck["deckId"].intValue)-1].type, id: deckLists[(deck["deckId"].intValue)-1].id))
                }
            }catch {
                print("Json Error")
            }
        }
        var counts: [Int:Int] = [:]
        totalDecks.forEach {counts[$0.id,default: 0] += 1}
        self.totalDecks = totalDecks.count
        deckRepresentativity = counts
        print("\(counts)")
        print("\(deckRepresentativity)")
    }
    
    static func deckRepresentativty() -> [Int:Float]{
        var representativity: [Int:Float] = [:]
        deckLists.forEach{
            representativity[$0.id,default: Float(deckRepresentativity[$0.id] ?? 0/totalDecks)]
        }
        print("\(representativity)")
        return representativity
    }
    
    static func getDeckInfo(id: Int) -> Deck{
        let deck = deckLists.filter({ $0.id == id })
        return deck.first!
    }
    
    static func getDecks() ->[Deck]{
        return deckLists
    }
    
}
