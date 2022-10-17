//
//  ProductListRouter.swift
//  VIPER-Demo
//
//  Created by JustMac on 06/10/22.
//  Copyright © 2022 JustMac. All rights reserved.
//

import Foundation
import UIKit

class ProductListRouter: ProductListRemoteDataManagerInputProtocol{
    
    var remoteRequestHandler: ProductListRemoteDataManagerOutputProtocol?
    func retrievePostList() {
        let url = URL(string: "https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline")!
         URLSession.shared.dataTask(with: url) {data, response, error in
            if let error = error {
                print("\(error)")
            } else {
                let decoder = JSONDecoder()
                var mappedData : [ProductResponseModel]?
                if let jsonPetitions =  try? decoder.decode([ProductResponseModel].self, from: data ?? Data()){
                    mappedData = jsonPetitions
                    self.remoteRequestHandler?.onPostsRetrieved(mappedData!)
                }
            }
        } .resume()
    }
}
