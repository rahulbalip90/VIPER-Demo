//
//  ProductDetailViewProtocol.swift
//  VIPER-Demo
//
//  Created by JustMac on 06/10/22.
//  Copyright © 2022 JustMac. All rights reserved.
//
import UIKit

protocol PostDetailViewProtocol: class {
    var presenter: PostDetailPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func showPostDetail(forPost post: ProductResponseModel)
}

protocol PostDetailWireFrameProtocol: class {
    static func createPostDetailModule(forPost post: ProductResponseModel) -> UIViewController
}

protocol PostDetailPresenterProtocol: class {
    var view: PostDetailViewProtocol? { get set }
    var wireFrame: PostDetailWireFrameProtocol? { get set }
    var post: ProductResponseModel? { get set }
    
    // VIEW -> PRESENTER
    func viewDidLoad()
}
