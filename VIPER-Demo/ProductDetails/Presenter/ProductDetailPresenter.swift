//
//  ProductDetailPresenter.swift
//  VIPER-Demo
//
//  Created by JustMac on 06/10/22.
//  Copyright © 2022 JustMac. All rights reserved.
//

class ProductDetailPresenter: PostDetailPresenterProtocol {
    
    weak var view: PostDetailViewProtocol?
    var wireFrame: PostDetailWireFrameProtocol?
    var post: ProductResponseModel?
    
    func viewDidLoad() {
        view?.showPostDetail(forPost: post!)
    }
    
}

