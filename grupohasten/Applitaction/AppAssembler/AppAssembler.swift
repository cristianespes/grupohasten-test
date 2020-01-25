//
//  AppAssembler.swift
//  grupohasten
//
//  Created by Cristian Espes on 25/01/2020.
//  Copyright © 2020 Cristian Espes. All rights reserved.
//

import Foundation

protocol Assembler: PlayersAssembler, PlayerDetailAssembler { }

final class AppAssembler: Assembler { }
