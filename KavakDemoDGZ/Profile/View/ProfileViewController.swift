//
//  ProfileViewController.swift
//  KavakDemoDGZ
//
//  Created by desarrollo on 17/07/20.
//  Copyright © 2020 KavakDemo. All rights reserved.
//

import UIKit
import Magnetic

class ProfileViewController: UIViewController {

    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDescripcioni: UILabel!
    @IBOutlet weak var profileCircl: UIImageView!
    
    @IBOutlet weak var btnFriends: UIButton!
    @IBOutlet weak var btnProfesiones: UIButton!
    var btnlastclick: UIButton!
    var typeMechanic:typeSearch? = nil
    
    var viewModel: ProfileViewModel? = nil
    
    var magnetic: Magnetic {
            return magneticView.magnetic
     }
     
     @IBOutlet weak var magneticView: MagneticView! {
            didSet {
                magnetic.magneticDelegate = self
                magnetic.removeNodeOnLongPress = true
            
            }
        }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title  =  "Profile"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if btnFriends != nil{
            btnclickk(btnFriends!)
        }
        configure()
    }
    
    func configure(){
        lblName.text = self.viewModel?.getName()
        lblDescripcioni.text = self.viewModel?.getDescription()
        imgProfile.setImageFromUrl(ImageURL: self.viewModel?.getImageProfile() ?? "")
        
        profileCircl.setImageFromUrl(ImageURL: self.viewModel?.getImageProfile() ?? "")
        profileCircl.layer.cornerRadius = profileCircl.frame.width / 2
    }
    var nodes: [Node] = []
    func ClearMechanic(){
      
        for node in   nodes {
            node.removeFromParent()
        }
        
        
        
    }
    
    func chargeMechanic(){
        var friends :[String] = []
        if let typeMech = typeMechanic {
            if typeMech == .friend {
                  friends   = self.viewModel?.profile?.friends ?? []
            }else if  typeMech == .professions {
                 friends   = self.viewModel?.profile?.professions ?? []
            }
        
            for  item in friends {
                self.addNode(text: item)
                
            }
        }
    }
    
    @IBAction func btnclickk(_ sender: Any) {
        let button = sender as! UIButton
        
        if btnlastclick != nil {
            configureButton(button: btnlastclick, clicked: false)
        }
        btnlastclick = button
        configureButton(button: button, clicked: true)
        
        if button == btnFriends {
            typeMechanic = .friend
        }else if button == btnProfesiones {
            typeMechanic  = .professions
        }
        ClearMechanic()
        chargeMechanic()
    }
    func configureButton(button:  UIButton,clicked: Bool){
         
         if clicked{
             button.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
             button.tintColor =  #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
             
         }else{
             button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
             button.tintColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
             
         }
         
     }
    
    func  addNode(text:String){
                let name = text
                 let color = UIColor.colors.randomItem()
                 let node = Node(text: name.capitalized, image: UIImage(named: name), color: color, radius: 40)
                 node.scaleToFitContent = true
                 node.selectedColor = UIColor.colors.randomItem()
                 magnetic.addChild(node)
                    self.nodes.append(node)
       }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}



extension ProfileViewController: MagneticDelegate {
    
    func magnetic(_ magnetic: Magnetic, didSelect node: Node) {
        let model = AdvanceSearchViewModel()
        
        
        if   let typeSearch = typeMechanic {
            if typeSearch == .friend {
                gotoNewProfile(node: node)
                return 
            }
            
            model.addFilter(filter: searchFiltersModel(type: typeSearch , text: node.text ?? ""))
            let vc = Router.shared.getSearchAdvanced(viewModel: model)
            model.view = vc
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
       
    }
    func gotoNewProfile(node: Node)
    {
        
        let result = DataSingleton.shared.brastlewarks.filter { (item) -> Bool in
            if item.name?.lowercased() == node.text?.lowercased() ?? "" {
                return true
            }
            return false
        }.first
        
        if result != nil{
            
                        let model = ProfileViewModel()
                      model.profile = result
            let vc = Router.shared.getProfileVC(viewModel: model)
                      self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func magnetic(_ magnetic: Magnetic, didDeselect node: Node) {
        print("didDeselect -> \(node)")
    }
    
    func magnetic(_ magnetic: Magnetic, didRemove node: Node) {
        print("didRemove -> \(node)")
    }
    
}
