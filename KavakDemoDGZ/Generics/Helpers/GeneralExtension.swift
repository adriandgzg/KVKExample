//
//  Extension.swift
//  KavakDemoDGZ
//
//  Created by desarrollo on 17/07/20.
//  Copyright © 2020 KavakDemo. All rights reserved.
//

import Foundation
import UIKit




extension UIViewController{
    
    
    func callAlert(title:String,message:String){

        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: {(action) -> Void in
        
        })

        alertController.addAction(ok)
        self.present(alertController, animated: true, completion: nil)
    }
    
}
