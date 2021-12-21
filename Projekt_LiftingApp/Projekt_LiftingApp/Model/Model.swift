//
//  Model.swift
//  Projekt_LiftingApp
//
//  Created by Stefanie Miebach / BBS2H20A on 21.12.21.
//

import Foundation

struct Model: Decodable {
    
    var übung: String
    var körpergruppe: String
    var ausführung: String
    var wiederholungen: String
    var imageName: String
}
