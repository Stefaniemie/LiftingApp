//
//  Data.swift
//  Projekt_LiftingApp
//
//  Created by Stefanie Miebach / BBS2H20A on 21.12.21.
//

import Foundation

let exercisedata = loadData()

func loadData() -> [Model] {

var data: Data

    guard let file = Bundle.main.url(forResource: "data", withExtension: "json") else {
        fatalError("JSON Error")
    }
    
data = try! Data(contentsOf: file)
    let decoder = JSONDecoder()
    return try! decoder.decode([Model].self, from: data)

}
