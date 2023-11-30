//
//  GetStartedViewController.swift
//  Exchange rates
//
//  Created by Евгений Езепчук on 4.11.23.
//

import UIKit

class GetStartedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        viewConfigure()
    }
    
    private func viewConfigure() {
        guard let navigationController = navigationController else { return }
        navigationController.navigationBar.tintColor = .titleColor
        navigationController.navigationBar.barTintColor = .backgroundColor
        navigationController.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.titleColor]
        navigationController.navigationBar.largeTitleTextAttributes = [.foregroundColor : UIColor.titleColor]
        self.view = ViewBuilder.shared.configureGetStartesVC(navigationController)
    }
    
}
