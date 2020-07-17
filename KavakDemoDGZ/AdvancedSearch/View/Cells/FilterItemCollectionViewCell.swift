//
//  FilterItemCollectionViewCell.swift
//  KavakDemoDGZ
//
//  Created by desarrollo on 16/07/20.
//  Copyright © 2020 KavakDemo. All rights reserved.
//

import UIKit
protocol delegateFilterCell {
    func deleteFilter(index:Int)
}
class FilterItemCollectionViewCell: UICollectionViewCell {

    var index :Int = -1
    var delegate : delegateFilterCell? = nil
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var lblFilter: UILabel!
    
    @IBAction func deleteFilter(_ sender: Any) {
        self.delegate?.deleteFilter(index: self.index)
    }
    
    
    func configureCell(filter:searchFiltersModel){
        lblFilter.text = filter.type.value() + " : " + filter.text
    }
}
