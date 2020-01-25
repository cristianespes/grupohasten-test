//
//  PlayersAssembler.swift
//  grupohasten
//
//  Created by Cristian Espes on 25/01/2020.
//  Copyright © 2020 Cristian Espes. All rights reserved.
//

import Foundation

protocol PlayersAssembler {
    func resolve() -> PlayersViewController
    
    func resolve() -> PlayersPresenter
    
    func resolve() -> GetSportUseCases
    
    func resolve() -> SportRepository
    
    func resolve() -> RemoteDataSource
}

extension PlayersAssembler where Self: Assembler {
    
    func resolve() -> PlayersViewController {
        return PlayersViewController(presenter: resolve(), navigator: self)
    }
    
    func resolve() -> PlayersPresenter {
        return PlayersPresenterImpl(getSportUseCases: resolve())
    }
    
    func resolve() -> GetSportUseCases {
        return GetSportUseCases(sportRepository: resolve())
    }
    
    func resolve() -> SportRepository {
        return SportRepository(remoteDataSource: resolve())
    }
    
    func resolve() -> RemoteDataSource {
        return ApiMyJsonDataSource()
    }
}
