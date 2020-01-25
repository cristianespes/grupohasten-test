//
//  PlayersPresenter+View.swift
//  grupohasten
//
//  Created by Cristian Espes on 25/01/2020.
//  Copyright © 2020 Cristian Espes. All rights reserved.
//

import Foundation

protocol PlayersPresenter: BasePresenter {
    func getNumSections() -> Int
    func getTitleFor(_ section: Int) -> String
    func getNumItems(_ section: Int) -> Int
    func getItemFor(_ index: IndexPath) -> Player
}

protocol PlayersView {
    func setupViews()
    func startLoading()
    func stopLoading()
    func showErrorAlert(message: String)
    func stateData()
    func stateEmpty()
    func navigateToDetail()
}
