//
//  PlayersPresenterImpl.swift
//  grupohasten
//
//  Created by Cristian Espes on 25/01/2020.
//  Copyright © 2020 Cristian Espes. All rights reserved.
//

import Foundation

final class PlayersPresenterImpl {
    
    private let view: PlayersView
    private let getSportUseCases: GetSportUseCases
    private var sports: [Sport] = []
    
    
    init(_ view: PlayersView, getSportUseCases: GetSportUseCases) {
        self.view = view
        self.getSportUseCases = getSportUseCases
    }
}

extension PlayersPresenterImpl: PlayersPresenter {
    func initialize() {
        self.view.setupViews()
    }
    
    func update() {
        self.view.startLoading()
        
        getSportUseCases.invoke { [weak self] (error, sports) in
            
            self?.view.stopLoading()
            
            if let error = error {
                print("Error: \(error)")
                self?.view.showErrorAlert(message: "app.grupohasten.error_bad_request".localized())
                return
            }
                        
            guard let sports = sports, sports.count > 0 else {
                self?.view.stateEmpty()
                return
            }
            
            self?.sports = sports
            self?.view.stateData()
        }
    }
    
    func getNumSections() -> Int {
        return sports.count
    }
    
    func getTitleFor(_ section: Int) -> String {
        return sports[section].title
    }
    
    func getNumItems(_ section: Int) -> Int {
        return sports[section].players.count
    }
    
    func getItemFor(_ index: IndexPath) -> Player {
        return sports[index.section].players[index.row]
    }
}
