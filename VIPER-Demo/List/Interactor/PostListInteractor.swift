//
//  PostListInteractor.swift
//  VIPER-Demo
//
//  Created by JustMac on 06/10/22.
//  Copyright © 2022 JustMac. All rights reserved.
//

class PostListInteractor: ProductListInteractorInputProtocol {
    weak var presenter: ProductListInteractorOutputProtocol?
    var remoteDatamanager: ProductListRemoteDataManagerInputProtocol?
    
    func retrieveProductList() {
         remoteDatamanager?.retrievePostList()
    }
        
}

extension PostListInteractor: ProductListRemoteDataManagerOutputProtocol {
    
    func onPostsRetrieved(_ posts: [ProductResponseModel]) {
        presenter?.didRetrieveProducts(posts)
    }
    
    func onError() {
        presenter?.onError()
    }
    
}
