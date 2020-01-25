//
//  Sport.swift
//  grupohasten
//
//  Created by Cristian Espes on 25/01/2020.
//  Copyright © 2020 Cristian Espes. All rights reserved.
//

import Foundation

final class Sport {
    
    let title: String
    let type: String
    let players: [Player]
    
    init(title: String, type: String, players: [Player]) {
        self.title = title
        self.type = type
        self.players = players
    }
}
