//
//  ProductDetailWireframe.swift
//  VIPER-Demo
//
//  Created by JustMac on 06/10/22.
//  Copyright © 2022 JustMac. All rights reserved.
//

import UIKit

class ProductDetailWireframe: PostDetailWireFrameProtocol {
    
    class func createPostDetailModule(forPost post: ProductResponseModel) -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "DetailViewController")
        if let view = viewController as? DetailViewController {
            let presenter: PostDetailPresenterProtocol = ProductDetailPresenter()
            let wireFrame: PostDetailWireFrameProtocol = ProductDetailWireframe()
            
            view.presenter = presenter
            presenter.view = view
            presenter.post = post
            presenter.wireFrame = wireFrame
            
            return viewController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
}
