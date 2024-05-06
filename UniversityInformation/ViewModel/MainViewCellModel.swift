//
//  MainViewCellModel.swift
//  UniversityInformation
//
//  Created by Hakan Hardal on 6.05.2024.
//

import Foundation

struct MainViewCellModel{
    private let model : University
    
    init(model: University) {
        self.model = model
    }
    
    var url : URL?{
        return URL(string: model.webPages.first ?? "Https://www.google.com")
    }
    var name : String{
        return model.name
    }
}
