//
//  SportService.swift
//  grupohasten
//
//  Created by Cristian Espes on 25/01/2020.
//  Copyright © 2020 Cristian Espes. All rights reserved.
//

import Foundation

final class SportService: Codable {
    
    let title: String?
    let type: String?
    let players: [PlayerService]?
    
    private enum CodingKeys: String, CodingKey {
        case title, type, players
    }
}
