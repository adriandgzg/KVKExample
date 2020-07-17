//
//  ProfileViewModel.swift
//  KavakDemoDGZ
//
//  Created by desarrollo on 17/07/20.
//  Copyright © 2020 KavakDemo. All rights reserved.
//

import Foundation
import Magnetic
protocol profileVMToView{
    func  upateData()
}

class ProfileViewModel{
    var profile : Brastlewark? = nil

    var view  : profileVMToView? = nil
    init(){
        
    }
        
    func getDescription()-> String{
        
        var profile = ""
        
        profile = profile + "\n"
        
        profile = profile + "Peso             :" + "\(self.profile?.weight ?? 0.0)" + " kg \n"
        profile = profile + "Altura           :" + "\(self.profile?.height  ?? 0.0)" + " pies \n"
        profile = profile + "Color de Cabello :" + "\(self.profile?.hair_color ?? "SN")" + "\n"
        profile = profile + "Edad             :" + "\(self.profile?.age  ?? 1)" + " años \n"
        profile = profile + "Genero           :" + "\(self.profile?.gender  ?? "Female")"
        
        
        
        return profile
        // lglDescripcion.text = "Profesion : \n" + ( item.professions?.joined(separator: "\n") ?? "" )
    }
    
    func getName()-> String{
        return profile?.name ?? ""
    }
    
    func getImageProfile()->String{
        return  profile?.thumbnail ?? ""
    }
    
    
    
}
