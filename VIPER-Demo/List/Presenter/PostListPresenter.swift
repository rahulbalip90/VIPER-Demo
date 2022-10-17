//
//  PostListPresenter.swift
//  VIPER-Demo
//
//  Created by JustMac on 06/10/22.
//  Copyright © 2022 JustMac. All rights reserved.


class PostListPresenter: ProductListPresenterProtocol {
    weak var view: ProductListViewProtocol?
    var interactor: ProductListInteractorInputProtocol?
    var wireFrame: ProductListWireFrameProtocol?
    var vc: ViewController?
    
    func viewDidLoad() {
        interactor?.retrieveProductList()
    }
    
    func showProductDetail(forProduct post: ProductResponseModel) {
        wireFrame?.presentProductDetailScreen(from: self.vc!, forPost: post)
    }

}

extension PostListPresenter: ProductListInteractorOutputProtocol {
    
    func didRetrieveProducts(_ posts: [ProductResponseModel]) {
        view?.showProducts(with: posts)
    }
    
    func onError() {
        view?.showError()
    }
    
}


