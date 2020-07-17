//
//  TypeSearch.swift
//  KavakDemoDGZ
//
//  Created by desarrollo on 16/07/20.
//  Copyright © 2020 KavakDemo. All rights reserved.
//

import Foundation

enum typeSearch : String{
    case name  = "Nombre"
    case age = "Edad"
    case weight  = "Peso"
    case height  = "Altura"
    case hair_color = "Color de cabello"
    case professions = "Profesión"
    case genre = "Genero"
    case friend = "Amigos"
    
    func value()-> String{
        return self.rawValue
    }
}



struct searchFiltersModel{
        
    var type:typeSearch
    var text: String

}
