//
//  ApiMyJsonError.swift
//  grupohasten
//
//  Created by Cristian Espes on 25/01/2020.
//  Copyright © 2020 Cristian Espes. All rights reserved.
//

import Foundation

enum ApiMyJsonError: Error {
    case unknown
    case authorization
    case noData
    case badRequest
    case badDecoder
}
