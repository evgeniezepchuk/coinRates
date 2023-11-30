//
//  ViewController.swift
//  Exchange rates
//
//  Created by Евгений Езепчук on 28.10.23.
//

import UIKit

class ViewController: UIViewController {

    private var town: String = ""
    private var model: [Model] = []
    private var loadingView: UIView?
    
    let tableView: UITableView = {
        let tv = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height), style: .grouped)
        tv.register(RatesTableViewCell.self, forCellReuseIdentifier: RatesTableViewCell.identifire)
        tv.backgroundColor = .backgroundColor
        return tv
    }()
    
    init(town: String) {
        self.town = town
        super .init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLoadingView()
        view.backgroundColor = .backgroundColor
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.dataSource = self
        tableView.delegate = self
        startAPI()
        
    }
    
    private func configureLoadingView() {
        self.view = ViewBuilder.shared.configureLoadingScreen()
    }
    
    private func startAPI() {
        APICaller.shared.fetchRates(with: self.town) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let model):
                self.model = model
                DispatchQueue.main.async {
                    let model = self.model
                    print(model)
                    if model.count != 0 {
                        self.view.addSubview(self.tableView)
                    }
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
//    func configureTown(town: String) {
//        self.town = town
//    }

}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RatesTableViewCell.identifire) as? RatesTableViewCell else { return UITableViewCell()
        }
        cell.backgroundColor = .buttonBacgrndColor
        let view = UIView()
        view.backgroundColor = .buttonBacgrndColor
//        view.layer.cornerRadius = 13
        cell.selectionStyle = .none
//        cell.backgroundView = view
//        view.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
//            view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
//            view.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
//            view.topAnchor.constraint(equalTo: cell.topAnchor),
//            view.bottomAnchor.constraint(equalTo: cell.bottomAnchor)
//        ])
        
        let model = self.model[indexPath.section]
        cell.usdSellPrice.text = model.USD_in
        cell.usdBuyPrice.text = model.USD_out
        cell.eurSellPrice.text = model.EUR_in
        cell.eurBuyPrice.text = model.EUR_out
        title = town
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(BranchViewController(model: self.model[indexPath.section]), animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 110
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        model.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView()
        let header = UILabel()
        header.text = ("\(model[section].street_type ?? "") \(model[section].street ?? "") \(model[section].home_number ?? ""). \(model[section].filials_text ?? "")")
        header.font = UIFont.systemFont(ofSize: 18,weight: .medium)
        header.textColor = .titleColor
        header.frame = CGRect(x: 10, y: 0, width: Int(view.frame.width) / 2, height: 15)
        view.addSubview(header)
        
        header.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            header.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            header.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15)
        ])
        
        return view
    }
}
