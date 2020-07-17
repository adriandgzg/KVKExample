//
//  AdvancedSearchViewController.swift
//  KavakDemoDGZ
//
//  Created by desarrollo on 16/07/20.
//  Copyright © 2020 KavakDemo. All rights reserved.
//

import UIKit

class AdvancedSearchViewController: UIViewController {
 
    var selectedPicker = -1
    let picker = UIPickerView()
    var viewModel:AdvanceSearchViewModel? = nil
    @IBOutlet weak var filterCollectionView: UICollectionView!
    @IBOutlet weak var lblText: UITextField!
    @IBOutlet weak var lblTypeFilter: UITextField!
    @IBOutlet weak var tableViewResult: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTitle()
        configurePicker()
        configureCell()
//        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
//        self.view.addGestureRecognizer(tap)
    }
    func setTitle(){
        let result = self.viewModel?.brastlewarkFilter.count
        self.title = String(result!) + " Encontrados"
    }
    @objc func handleTap(_ sender: UITapGestureRecognizer) {

        self.view.endEditing(true)
    }
    @IBAction func aaplyFilter(_ sender: Any) {
        self.view.endEditing(true)
        if lblText.text?.isEmpty ?? true {
            
            self.callAlert(title:"Atención",message:"Ingrese un texto")
            
            
            return
        }
        
        if lblTypeFilter.text?.isEmpty ?? true {
                   print("Fail")
            self.callAlert(title:"Atención",message:"Ingrese un filtro")
                   return
        }
        let selected = picker.selectedRow(inComponent: 0)
        
        if let  type = self.viewModel?.arrFilterOptions[selected] {
            let search = searchFiltersModel(type: type, text: lblText.text?.replacingOccurrences(of: " ", with: "") ?? "")
            self.viewModel?.addFilter(filter: search)
        }
            


    }
    
    func configurePicker(){
            picker.translatesAutoresizingMaskIntoConstraints = false
            picker.delegate = self
           
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        toolBar.sizeToFit()

        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(self.donePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.cancelPicker))

        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true

        lblTypeFilter.inputView = picker
        lblTypeFilter.inputAccessoryView = toolBar
    }
    @objc func donePicker(){
        let  selected = picker.selectedRow(inComponent: 0)
        if let  text = self.viewModel?.arrFilterOptions[selected] {
            lblTypeFilter.text = text.value()
        }
        
        self.view.endEditing(true)
    }
    @objc func  cancelPicker(){
        
    }
    func configureCell(){
        tableViewResult.register(UINib(nibName: "ResultSearchAdvanceTableViewCell", bundle: nil), forCellReuseIdentifier: "ResultSearchAdvanceTableViewCell")
        tableViewResult.delegate = self
        tableViewResult.dataSource = self
        tableViewResult.estimatedRowHeight = 30
        tableViewResult.rowHeight = UITableView.automaticDimension
        
        
        filterCollectionView.register(UINib.init(nibName: "FilterItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FilterItemCollectionViewCell")
        filterCollectionView.dataSource  =  self
        
        let layout = filterCollectionView.collectionViewLayout
        if let flowLayout = layout as? UICollectionViewFlowLayout {
              flowLayout.estimatedItemSize = CGSize(
                  width: 60,
                  // Make the height a reasonable estimate to
                  // ensure the scroll bar remains smooth
                height: filterCollectionView.frame.height - 10
              
              )
            flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            flowLayout.minimumInteritemSpacing = 0
            flowLayout.minimumLineSpacing = 0
            flowLayout.scrollDirection = .horizontal
          }
        
        
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

extension AdvancedSearchViewController: AdvancedSearchView{
    func error(error: String) {
        
    }
    
    func reloadData() {
        self.tableViewResult.reloadData()
        self.filterCollectionView.reloadData()
        setTitle()
    }
}

extension AdvancedSearchViewController:UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.viewModel?.numberTypeFilter() ?? 0
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return (self.viewModel?.typeFilter()[row])?.value()
    }
    
}


extension AdvancedSearchViewController:  delegateFilterCell{
    
    func deleteFilter(index: Int) {
        self.viewModel?.deleteFilter(index: index)
     }
}
