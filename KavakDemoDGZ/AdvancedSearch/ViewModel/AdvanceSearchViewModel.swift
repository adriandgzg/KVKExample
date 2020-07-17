//
//  AdvanceSearchViewModel.swift
//  KavakDemoDGZ
//
//  Created by desarrollo on 16/07/20.
//  Copyright © 2020 KavakDemo. All rights reserved.
//

import Foundation

protocol AdvancedSearchView {
    func error(error:String)
    func reloadData()
    
}


class AdvanceSearchViewModel{
    
    var arrFilterOptions: [typeSearch] = [typeSearch.age,typeSearch.name, typeSearch.weight,typeSearch.height,typeSearch.hair_color,typeSearch.professions,typeSearch.genre,  typeSearch.friend]
    var filters : [searchFiltersModel] = []
    var brastlewarkFilter : [Brastlewark]  = []
    var view:AdvancedSearchView? =  nil
    
    
    init(){
        
    }
    
    func deleteFilter(index: Int) {
        
        if index < filters.count {
            filters.remove(at: index)
            ApplyFilter()
        }
    }
    func addFilter(filter: searchFiltersModel) {
        filters.append(filter)
        ApplyFilter()
    }
       
    
    func ApplyFilter(){
      
         self.brastlewarkFilter  = DataSingleton.shared.brastlewarks
        for filter in filters {
            
            self.brastlewarkFilter = self.brastlewarkFilter.filter({ (item) -> Bool in
                
                switch filter.type {
                    case .professions:
                                let  resuld =  item.professions!.filter({ (prof) -> Bool in
                                    return prof.uppercased() == filter.text.uppercased() ? true : false
                                })
                                return  resuld.count > 0 ? true : false
                                
                    case .name:
                        return item.name?.uppercased().contains(filter.text.uppercased()) ?? false
                    
                    case .age:
                        if  let age =  Int(filter.text){
                            return item.age ==  age
                        }
                        return  false
                        
                    case .weight:
                        if  let weight =  Double(filter.text){
                            return item.weight == weight
                        }
                        return false
                        
                        
                    case .height:
                         if  let height =  Double(filter.text){
                            return item.height == height
                         }
                         return false
                        
                    case .hair_color:
                        return item.hair_color?.uppercased() == filter.text.uppercased()
        
                case .genre:
                    return item.gender?.uppercased() == filter.text.uppercased()
                case .friend:
                    let  resuld =  item.friends!.filter({ (prof) -> Bool in
                                                   return prof.uppercased() == filter.text.uppercased() ? true : false
                                               })
                    return  resuld.count > 0 ? true : false
                }
                
            })
        }
        
        self.view?.reloadData()
    }
    
    func numberTypeFilter() -> Int {
        return  arrFilterOptions.count
    }
    
    func typeFilter() -> [typeSearch] {
        return self.arrFilterOptions
    }

}
