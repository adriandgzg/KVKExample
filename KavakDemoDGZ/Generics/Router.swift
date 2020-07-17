//
//  Router.swift
//  KavakDemoDGZ
//
//  Created by desarrollo on 16/07/20.
//  Copyright © 2020 KavakDemo. All rights reserved.
//

import Foundation


import Foundation
import UIKit

enum StoryboardNames : String {
    
    case Main          = "Main"
    case Profile      = "Profile"
    
    func getString()-> String{
        return self.rawValue
    }
    
}
class Router{
        static let shared = Router()
    
    init(){
    }
    func getStoryboardWith(name:String)-> UIStoryboard {
        let storyboard = UIStoryboard(name: name , bundle: nil)
        return storyboard
    }
    func getSearchAdvanced(viewModel:AdvanceSearchViewModel)-> AdvancedSearchViewController{
        let storyboard = getStoryboardWith(name: StoryboardNames.Main.getString() )
        let viewController:AdvancedSearchViewController = storyboard.instantiateViewController(withIdentifier: String(describing: AdvancedSearchViewController.self) ) as! AdvancedSearchViewController
        viewController.viewModel = viewModel

        return viewController
    }
    
    func  getProfileVC(viewModel:ProfileViewModel)-> ProfileViewController{
        let storyboard = getStoryboardWith(name: StoryboardNames.Profile.getString() )
        let viewController:ProfileViewController = storyboard.instantiateViewController(withIdentifier: String(describing: ProfileViewController.self) ) as! ProfileViewController
        viewController.viewModel = viewModel

        return viewController
    }
   
    

}
