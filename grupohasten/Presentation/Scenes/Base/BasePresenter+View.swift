//
//  BasePresenter+View.swift
//  grupohasten
//
//  Created by Cristian Espes on 25/01/2020.
//  Copyright © 2020 Cristian Espes. All rights reserved.
//

import Foundation

protocol BasePresenter {
    func initialize()
    func update()
    func pause()
    func destroy()
}

extension BasePresenter {
    func initialize() {}
    func update() {}
    func pause() {}
    func destroy() {}
}
