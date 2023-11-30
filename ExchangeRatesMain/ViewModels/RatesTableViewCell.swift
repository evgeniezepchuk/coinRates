//
//  RatesTableViewCell.swift
//  Exchange rates
//
//  Created by Евгений Езепчук on 1.11.23.
//

import UIKit

class RatesTableViewCell: UITableViewCell {
    
    static let identifire = "Cell"
    
    // MARK: - Configure name of street label
    
    let streetLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 17, weight: .heavy)
        lbl.text = "Название улицы"
//        lbl.textColor = .titleColor  
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    // MARK: - Stacks configure
    
    let usdStack: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .equalCentering
//        stack.backgroundColor = UIColor.purple
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let eurStack: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .equalCentering
//        stack.backgroundColor = UIColor.purple
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let titleStack: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .equalCentering
//        stack.backgroundColor = .green
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let generalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    // MARK: - Configure USD currency
    
    let currencyUSD: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 17, weight: .bold)
        lbl.text = "USD $ 🇺🇸"
        lbl.textColor = .titleColor
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var usdSellPrice: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 17, weight: .semibold)
        lbl.text = "3.2"
        lbl.textColor = .titleColor
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var usdBuyPrice: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 17, weight: .semibold)
        lbl.text = "3.29"
        lbl.textColor = .titleColor
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    // MARK: - Configure EUR currency
    
    let currencyEUR: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 17, weight: .bold)
        lbl.text = "EUR € 🇪🇺"
        lbl.textColor = .titleColor
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var eurSellPrice: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 17, weight: .semibold)
        lbl.text = "3.2"
        lbl.textColor = .titleColor
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var eurBuyPrice: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 17, weight: .semibold)
        lbl.text = "3.29"
        lbl.textColor = .titleColor
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    // MARK: - Configure titles currency
    
    let titleCurrency: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 17, weight: .semibold)
        lbl.text = "Валюта"
        lbl.textColor = .titleColor
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let sellTitle: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 17, weight: .semibold)
        lbl.text = "Сдать"
        lbl.textColor = .titleColor
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let buyTitle: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 17, weight: .semibold)
        lbl.text = "Купить"
        lbl.textColor = .titleColor
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        configureAllView()
//        contentView.layer.cornerRadius = 20
//        contentView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.height - 60, height: 135)
        print(contentView.bounds)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureConstraints()
    }
    
    // MARK: - Private methods
    
    private func configureAllView() {
//        addSubview(streetLabel)
        addSubview(generalStack)
        
        usdStack.addArrangedSubview(currencyUSD)
        usdStack.addArrangedSubview(usdSellPrice)
        usdStack.addArrangedSubview(usdBuyPrice)
        
        eurStack.addArrangedSubview(currencyEUR)
        eurStack.addArrangedSubview(eurSellPrice)
        eurStack.addArrangedSubview(eurBuyPrice)
        
        titleStack.addArrangedSubview(titleCurrency)
        titleStack.addArrangedSubview(sellTitle)
        titleStack.addArrangedSubview(buyTitle)
        
        generalStack.addArrangedSubview(titleStack)
        generalStack.addArrangedSubview(usdStack)
        generalStack.addArrangedSubview(eurStack)

        configureConstraints()
    }
    
    private func configureConstraints() {
        
        // MARK: - Configure constraints single hStack
        
        NSLayoutConstraint.activate([
            titleStack.heightAnchor.constraint(equalToConstant: 30),
            titleStack.rightAnchor.constraint(equalTo: generalStack.rightAnchor),
            titleStack.leftAnchor.constraint(equalTo: generalStack.leftAnchor),
//            titleCurrency.leadingAnchor.constraint(equalTo: titleStack.leftAnchor, constant: 15)
        ])
        
        NSLayoutConstraint.activate([
            usdStack.heightAnchor.constraint(equalToConstant: 30),
            usdStack.rightAnchor.constraint(equalTo: generalStack.rightAnchor),
            usdStack.topAnchor.constraint(equalTo: titleStack.bottomAnchor),
            usdStack.leftAnchor.constraint(equalTo: generalStack.leftAnchor)
        ])
        
        NSLayoutConstraint.activate([
            eurStack.heightAnchor.constraint(equalToConstant: 30),
            eurStack.rightAnchor.constraint(equalTo: generalStack.rightAnchor),
            eurStack.topAnchor.constraint(equalTo: usdStack.bottomAnchor),
            eurStack.leftAnchor.constraint(equalTo: generalStack.leftAnchor),
            eurStack.bottomAnchor.constraint(equalTo: generalStack.bottomAnchor)
        ])
        
        // MARK: - Configure constraints general vStack
        
        NSLayoutConstraint.activate([
            generalStack.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 25),
//            generalStack.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            generalStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
//            generalStack.heightAnchor.constraint(equalToConstant: contentView.bounds.height - 20),
            generalStack.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 50),
            generalStack.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 25)
        ])
        
//        NSLayoutConstraint.activate([
//            streetLabel.widthAnchor.constraint(equalToConstant: 100),
//            streetLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
//            streetLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30)
//        ])
        
    }

}

