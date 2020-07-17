//
//  AdvanceSearchTableManager.swift
//  KavakDemoDGZ
//
//  Created by desarrollo on 16/07/20.
//  Copyright © 2020 KavakDemo. All rights reserved.
//

import Foundation
import UIKit
extension AdvancedSearchViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.brastlewarkFilter.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableViewResult.dequeueReusableCell(withIdentifier: "ResultSearchAdvanceTableViewCell", for: indexPath) as! ResultSearchAdvanceTableViewCell
        if (self.viewModel?.brastlewarkFilter[indexPath.row]) != nil {
                cell.configureCell(item: self.viewModel!.brastlewarkFilter[indexPath.row])
                return cell
        }
        return UITableViewCell()
    }
    
    func  tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (self.viewModel?.brastlewarkFilter[indexPath.row]) != nil {
               
            let model = ProfileViewModel()
            model.profile = self.viewModel!.brastlewarkFilter[indexPath.row]
            var vc = Router.shared.getProfileVC(viewModel: model)
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
}





extension AdvancedSearchViewController: UICollectionViewDelegate, UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel?.filters.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilterItemCollectionViewCell", for: indexPath) as! FilterItemCollectionViewCell
        if let itemURL = self.viewModel?.filters[indexPath.row] {
            cell.configureCell(filter: itemURL)
            cell.index  =  indexPath.row
        }
        cell.delegate = self
        return cell
    }
}



