//
//  PlayerDetailAssembler.swift
//  grupohasten
//
//  Created by Cristian Espes on 25/01/2020.
//  Copyright © 2020 Cristian Espes. All rights reserved.
//

import Foundation

protocol PlayerDetailAssembler {
    func resolve(player: Player, descriptionSport: String) -> PlayerDetailViewController
    
    func resolve(player: Player, descriptionSport: String) -> PlayerDetailPresenter
}

extension PlayerDetailAssembler {
    func resolve(player: Player, descriptionSport: String) -> PlayerDetailViewController {
        return PlayerDetailViewController(presenter: resolve(player: player, descriptionSport: descriptionSport))
    }
    
    func resolve(player: Player, descriptionSport: String) -> PlayerDetailPresenter {
        return PlayerDetailPresenterImpl(player: player, descriptionSport: descriptionSport)
    }
}
