//
//  PlayerService.swift
//  grupohasten
//
//  Created by Cristian Espes on 25/01/2020.
//  Copyright © 2020 Cristian Espes. All rights reserved.
//

import Foundation

final class PlayerService: Codable {
    
    let name: String?
    let surname: String?
    let image: String?
    let date: Date?
    
    private enum CodingKeys: String, CodingKey {
        case name, surname, image, date
    }
}
