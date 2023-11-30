//
//  DataManager.swift
//  Exchange rates
//
//  Created by Евгений Езепчук on 30.10.23.
//

import UIKit

class DataManager {
    
    static let shared = DataManager()
    
    var model: [Model] = []
    
    func fetchData() {
        APICaller.shared.fetchData { [weak self] result in
            switch result {
            case .success(let model):
                self?.model = model
            case .failure(let error):
                print(error)
            }
        }
    }
}
