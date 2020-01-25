//
//  DataMappers.swift
//  grupohasten
//
//  Created by Cristian Espes on 25/01/2020.
//  Copyright © 2020 Cristian Espes. All rights reserved.
//

import Foundation

extension SportService {
    func toSport() -> Sport {
        return Sport(title: title ?? "",
                     type: type ?? "",
                     players: players?.compactMap { $0.toPlayer() } ?? [])
    }
}

extension PlayerService {
    func toPlayer() -> Player {
        return Player(name: name ?? "",
                      surname: surname ?? "",
                      image: image ?? "",
                      date: date)
    }
}
