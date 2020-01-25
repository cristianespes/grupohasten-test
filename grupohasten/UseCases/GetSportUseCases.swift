//
//  GetSportUseCases.swift
//  grupohasten
//
//  Created by Cristian Espes on 25/01/2020.
//  Copyright © 2020 Cristian Espes. All rights reserved.
//

import Foundation

final class GetSportUseCases {
    
    private let remoteDataSource: RemoteDataSource
    
    init(sportRepository: SportRepository) {
        self.remoteDataSource = sportRepository.remoteDataSource
    }
    
    func invoke(completion: @escaping (Error?, [Sport]?) -> Void) {
        return remoteDataSource.getSports(completion: completion)
    }
}
