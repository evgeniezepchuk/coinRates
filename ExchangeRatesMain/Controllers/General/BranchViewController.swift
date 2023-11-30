//
//  TestViewController.swift
//  Exchange rates
//
//  Created by Евгений Езепчук on 5.11.23.
//

import UIKit
import YandexMapsMobile

class BranchViewController: UIViewController {
    
    let model: Model
    
    init(model: Model) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundColor
        configureView()
    }
    
    private func configureView() {
        
        title = (model.street_type ?? "") + " " + (model.street ?? "") + " " + (model.home_number ?? "")
        
        
        let backView = ViewBuilder.shared.configureBranchVC(model)
        backView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backView)
        
        
        NSLayoutConstraint.activate([
            backView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            backView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
