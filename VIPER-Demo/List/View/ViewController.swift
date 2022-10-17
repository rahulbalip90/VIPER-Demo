//
//  ViewController.swift
//  VIPER-Demo
//
//  Created by JustMac on 04/10/22.
//  Copyright © 2022 JustMac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK :- IBOutlet
    @IBOutlet weak var productListTableView: UITableView!
    
    // MARK :- Parameters
    var presenter: ProductListPresenterProtocol?
    var productList: [ProductResponseModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.title = "Product List"
        ProductListWireFrame.createListModule(ListRef: self)
        presenter?.viewDidLoad()
        productListTableView.tableFooterView = UIView()
        productListTableView.rowHeight = 150
        
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        productList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as! ListTableViewCell
        
        let post = productList[indexPath.row]
        cell.set(forProduct: post)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.wireFrame?.presentProductDetailScreen(from: self, forPost: productList[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
}

extension ViewController: ProductListViewProtocol {
    
    func showProducts(with posts: [ProductResponseModel]) {
        productList = posts
        DispatchQueue.main.async {
            self.productListTableView.reloadData()
        }
    }
    
    func showError() {
        print("Internet not connected")
    }
    
}
