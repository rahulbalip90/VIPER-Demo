//
//  ProductListViewProtocol.swift
//  VIPER-Demo
//
//  Created by JustMac on 06/10/22.
//  Copyright © 2022 JustMac. All rights reserved.
//


import UIKit

protocol ProductListViewProtocol: class {
    var presenter: ProductListPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func showProducts(with posts: [ProductResponseModel])
    
    func showError()
}

protocol ProductListWireFrameProtocol: class {
    static func getViewController() -> UIViewController
    // PRESENTER -> WIREFRAME
    func presentProductDetailScreen(from view: UIViewController, forPost post: ProductResponseModel)
}

protocol ProductListPresenterProtocol: class {
    var view: ProductListViewProtocol? { get set }
    var interactor: ProductListInteractorInputProtocol? { get set }
    var wireFrame: ProductListWireFrameProtocol? { get set }
    
    // VIEW -> PRESENTER
    func viewDidLoad()
    func showProductDetail(forProduct product: ProductResponseModel)
}

protocol ProductListInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
    func didRetrieveProducts(_ posts: [ProductResponseModel])
    func onError()
}

protocol ProductListInteractorInputProtocol: class {
    var presenter: ProductListInteractorOutputProtocol? { get set }
    var remoteDatamanager: ProductListRemoteDataManagerInputProtocol? { get set }
    
    // PRESENTER -> INTERACTOR
    func retrieveProductList()
}

protocol ProductListRemoteDataManagerInputProtocol: class {
    var remoteRequestHandler: ProductListRemoteDataManagerOutputProtocol? { get set }
    
    // INTERACTOR -> REMOTEDATAMANAGER
    func retrievePostList()
}

protocol ProductListRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
    func onPostsRetrieved(_ posts: [ProductResponseModel])
    func onError()
}

