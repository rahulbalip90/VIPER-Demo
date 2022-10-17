//
//  ListTableViewCell.swift
//  VIPER-Demo
//
//  Created by JustMac on 06/10/22.
//  Copyright © 2022 JustMac. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func set(forProduct product: ProductResponseModel) {
        self.selectionStyle = .none
        titleLabel?.text = product.brand.rawValue
        descLabel.text = product.productType
        if !product.imageLink.isEmpty {
            let url = URL(string: product.imageLink)!
            let data = try? Data(contentsOf: url) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            img.image = UIImage(data: data!)
        } else {
            img.image = UIImage(named: "placeholder")
        }
        

    }

}


