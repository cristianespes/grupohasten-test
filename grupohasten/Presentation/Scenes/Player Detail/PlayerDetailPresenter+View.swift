//
//  PlayerDetailPresenter+View.swift
//  grupohasten
//
//  Created by Cristian Espes on 25/01/2020.
//  Copyright © 2020 Cristian Espes. All rights reserved.
//

import Foundation

protocol PlayerDetailPresenter: BasePresenter {
    func setView(_ view: PlayerDetailView)
    
    func getTitle() -> String
    func getName() -> String
    func getSurname() -> String
    func getImage() -> String
    func getDate() -> Date?
    func getSport() -> String
}

protocol PlayerDetailView {
    func setupViews()
}
