//
//  ApiMyJsonDataSource.swift
//  grupohasten
//
//  Created by Cristian Espes on 25/01/2020.
//  Copyright © 2020 Cristian Espes. All rights reserved.
//

import Foundation

final class ApiMyJsonDataSource: RemoteDataSource {
    
    private let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        
        return decoder
    }()
    
    func getSports(completion: @escaping (Error?, [Sport]?) -> Void) {
        
        let urlStr = "https://api.myjson.com/bins/66851"
        
        guard let url = URL(string: urlStr) else {
            completion(ApiMyJsonError.badRequest, nil)
            return
        }
                
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            DispatchQueue.main.async {
                
                if let error = error {
                    completion(error, nil)
                    return
                }
                
                guard let data = data else {
                    completion(ApiMyJsonError.noData, nil)
                    return
                }
                
                
                do {
                    let response = try self.decoder.decode([SportService].self, from: data)
                    
                    let sport = response.compactMap { $0.toSport() }
                    completion(nil, sport)
                } catch let error as NSError {
                    completion(error, nil)
                }
            
            }
        }.resume()
        
    }
}
