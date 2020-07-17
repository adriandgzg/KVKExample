//
//  ResultSearchAdvanceTableViewCell.swift
//  KavakDemoDGZ
//
//  Created by desarrollo on 16/07/20.
//  Copyright © 2020 KavakDemo. All rights reserved.
//

import UIKit
import AlamofireImage

class ResultSearchAdvanceTableViewCell: UITableViewCell {
    @IBOutlet var imgItem: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lglDescripcion: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(item:Brastlewark){
        lblName.text = item.name
        lglDescripcion.text = "Profesion : \n" + ( item.professions?.joined(separator: "\n") ?? "" )
        guard let url = item.thumbnail  else { return }
        
        self.imgItem.backgroundColor = UIColor.colors.randomItem()
        self.imgItem.setImageFromUrl(ImageURL: url)
        
        
    }

    override func prepareForReuse() {
        self.imgItem.image = UIImage(named: "PlaceholderImage")
    }
}


extension UIImageView{
    
    func setImageFromUrl(ImageURL :String) {
       URLSession.shared.dataTask( with: NSURL(string:ImageURL)! as URL, completionHandler: {
          (data, response, error) -> Void in
          DispatchQueue.main.async {
             if let data = data {
                self.image = UIImage(data: data)
             }
          }
       }).resume()
    }
    
}
