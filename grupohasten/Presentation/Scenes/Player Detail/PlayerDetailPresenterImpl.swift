//
//  PlayerDetailPresenterImpl.swift
//  grupohasten
//
//  Created by Cristian Espes on 25/01/2020.
//  Copyright © 2020 Cristian Espes. All rights reserved.
//

import Foundation

final class PlayerDetailPresenterImpl {
    
    private var view: PlayerDetailView!
    private let player: Player
    private var descriptionSport: String
    
    
    init(player: Player, descriptionSport: String) {
        self.player = player
        self.descriptionSport = descriptionSport
    }
}

extension PlayerDetailPresenterImpl: PlayerDetailPresenter {
    func setView(_ view: PlayerDetailView) {
        self.view = view
    }
    
    func initialize() {
        self.view.setupViews()
    }
    
    func getTitle() -> String {
        return "\(player.name) \(player.surname)"
    }
    
    func getName() -> String {
        return player.name
    }
    
    func getSurname() -> String {
        return player.surname
    }
    
    func getImage() -> String {
        return player.image
    }
    
    func getDate() -> Date? {
        return player.date
    }
    
    func getSport() -> String {
        return descriptionSport
    }
}
