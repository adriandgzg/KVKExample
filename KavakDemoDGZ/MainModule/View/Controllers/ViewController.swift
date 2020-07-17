//
//  ViewController.swift
//  KavakDemoDGZ
//
//  Created by desarrollo on 16/07/20.
//  Copyright © 2020 KavakDemo. All rights reserved.
//

import UIKit
import Magnetic

class ViewController: UIViewController, ViewModelSearch {
   
    var viewModel: MainSearchViewModel? = nil
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
        // Do any additional setup after loading the view.
        self.viewModel = MainSearchViewModel()
        
        self.viewModel?.fetchElements()
        self.viewModel?.view = self
        self.title = "Profesions"
    }

    func  addNode(text:String){
             let name = text
              let color = UIColor.colors.randomItem()
              let node = Node(text: name.capitalized, image: UIImage(named: name), color: color, radius: 40)
              node.scaleToFitContent = true
              node.selectedColor = UIColor.colors.randomItem()
              magnetic.addChild(node)
    }

    func error(error: String) {
            
    }
       
    func updateView() {
        
        for item in self.viewModel!.professions {
            addNode(text: item)
        }
    }
       
}


extension ViewController: MagneticDelegate {
    
    func magnetic(_ magnetic: Magnetic, didSelect node: Node) {
        print("didSelect -> \(node)")
        
        let model = AdvanceSearchViewModel()
        model.addFilter(filter: searchFiltersModel(type: .professions, text: node.text ?? ""))
        
        let vc = Router.shared.getSearchAdvanced(viewModel: model)
        model.view = vc
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func magnetic(_ magnetic: Magnetic, didDeselect node: Node) {
        print("didDeselect -> \(node)")
    }
    
    func magnetic(_ magnetic: Magnetic, didRemove node: Node) {
        print("didRemove -> \(node)")
    }
    
}
