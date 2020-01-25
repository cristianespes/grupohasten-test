//
//  Player.swift
//  grupohasten
//
//  Created by Cristian Espes on 25/01/2020.
//  Copyright © 2020 Cristian Espes. All rights reserved.
//

import Foundation

final class Player {
    
    let name: String
    let surname: String
    let image: String
    let date: Date?
    
    init(name: String, surname: String, image: String, date: Date?) {
        self.name = name
        self.surname = surname
        self.image = image
        self.date = date
    }
}
