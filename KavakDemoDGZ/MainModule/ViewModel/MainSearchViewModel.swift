//
//  MainSearchViewModel.swift
//  KavakDemoDGZ
//
//  Created by desarrollo on 16/07/20.
//  Copyright © 2020 KavakDemo. All rights reserved.
//

import Foundation

protocol  MainViewModel {
    func fetchElements()
    func clickElement()
 
}


protocol  ViewModelSearch {
    func error(error:String)
    func  updateView()
}


class MainSearchViewModel:MainViewModel{
    var brastlewarks : [Brastlewark] = []
    var view: ViewModelSearch?  = nil
    var professions : Set = [""]

    func fetchElements() {
        
        ServiceManager.shared.GetData(completion: { (response:Items) in
            self.brastlewarks = response.brastlewark ?? []
            DataSingleton.shared.brastlewarks = self.brastlewarks
            self.filterElement()
            
            
        }) { (error) in
            self.view?.error(error: error)
        }
    }
    func filterElement(){
        
        let result  = self.brastlewarks.map { (it) -> [String] in
            return (it.professions ?? [""])
        }
        
        for item in  result {
                for prof in item{
                professions.insert(prof)
            }
        }
        
        professions = professions.filter({ (item) -> Bool in
            return item != "" ? true : false
        })
    
        self.view?.updateView()
    }
    func clickElement() {
        print("click")
    }
    
    


}

