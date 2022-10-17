//
//  ProductListWireFrame.swift
//  VIPER-Demo
//
//  Created by JustMac on 06/10/22.
//  Copyright © 2022 JustMac. All rights reserved.
//


import UIKit

class ProductListWireFrame: ProductListWireFrameProtocol {
    
    class func getViewController() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "ViewController")
        return navController
    }
    
    class func createListModule(ListRef: ViewController) {
        let presenter: ProductListPresenterProtocol & ProductListInteractorOutputProtocol = PostListPresenter()
        let interactor: ProductListInteractorInputProtocol & ProductListRemoteDataManagerOutputProtocol = PostListInteractor()
        let remoteDataManager: ProductListRemoteDataManagerInputProtocol = ProductListRouter()
        let wireFrame: ProductListWireFrameProtocol = ProductListWireFrame()
        ListRef.presenter = presenter
        presenter.view = ListRef
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.remoteDatamanager = remoteDataManager
        remoteDataManager.remoteRequestHandler = interactor
    }
    
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    
    func presentProductDetailScreen(from view: UIViewController, forPost post: ProductResponseModel) {
        let productDetailViewController = ProductDetailWireframe.createPostDetailModule(forPost: post)
        view.navigationController?.pushViewController(productDetailViewController, animated: true)
    }
    
}
