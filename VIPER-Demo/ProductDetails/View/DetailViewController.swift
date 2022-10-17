//
//  DetailViewController.swift
//  VIPER-Demo
//
//  Created by JustMac on 04/10/22.
//  Copyright © 2022 JustMac. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    var presenter: PostDetailPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Hide title from navigation back button
    self.navigationController?.navigationBar.topItem?.title = ""
        
        presenter?.viewDidLoad()
    }
    

    

}
extension DetailViewController: PostDetailViewProtocol {
    
    func showPostDetail(forPost post: ProductResponseModel) {
        titleLabel?.text = "\(post.brand) \(post.productType)".capitalized
        
        descriptionLabel.text = post.welcomeDescription
        price.text = "Rs. \(post.price)"
        if !post.imageLink.isEmpty {
            let url = URL(string: post.imageLink)!
            let data = try? Data(contentsOf: url) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            img.image = UIImage(data: data!)
        } else {
            img.image = UIImage(named: "placeholder")
        }
    
    }
    
}
