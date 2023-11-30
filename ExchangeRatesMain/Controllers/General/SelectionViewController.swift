//
//  SelectionViewController.swift
//  Exchange rates
//
//  Created by Евгений Езепчук on 28.10.23.
//

import UIKit

class SelectionViewController: UIViewController {

    // MARK: - Private properties
    
    private var model: Model? = nil
    
    private var town: String = "Александрия"
    
    private let textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Выберите населенный пункт"
        textField.font = .systemFont(ofSize: 17)
        textField.textAlignment = .center
        textField.layer.cornerRadius = 5
        textField.textColor = .titleColor
        textField.backgroundColor = .buttonBacgrndColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let picker: UIPickerView = {
        let picker = UIPickerView()
        picker.backgroundColor = .clear
//        picker.tintColorDidChange()
//        picker.tintColor = .titleColor
        picker.setValue(UIColor.titleColor, forKey: "textColor")
        picker.layer.cornerRadius = 15
        return picker
    }()
    
    private let button: UIButton = {
        let btn = UIButton(type: .system)
        btn.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        btn.setTitle("Далее", for: .normal)
        btn.setTitleColor(.titleColor, for: .normal)
        btn.backgroundColor = .buttonBacgrndColor
        btn.layer.cornerRadius = 10
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    // MARK: - Lifecycle view controller
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        picker.setValue(UIColor.tintColor, forKey: "textColor")
        loadAllMethods()
    }
    
    // MARK: - Private methods
    
    private func loadAllMethods() {
        view.addSubview(picker)
        view.addSubview(button)
        view.addSubview(textField)
        picker.isHidden = true
        tapButton()
        picker.delegate = self
        picker.dataSource = self
        view.backgroundColor = .white
        picker.center = view.center
        setConstraints()
        addActionTextField()
        viewAddAction()
        view.backgroundColor = .backgroundColor
        print(DataManager.shared.model)
    }
    
    private func addActionTextField() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tap))
        textField.addGestureRecognizer(tapGesture)
    }
    
    private func viewAddAction() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapView))
        view.addGestureRecognizer(tapGesture)
    }
    
    private func tapButton() {
        let action: UIAction? = UIAction { [self] _ in
            navigationController?.pushViewController(ViewController(town: town), animated: true)
        }
        self.button.addAction(action!, for: .touchUpInside)
    }
    
    // MARK: - @objc methods for gesture
    
    @objc func tapView() {
        picker.isHidden = true
        textField.isHidden = false
    }
    
    @objc func tap() {
        picker.isHidden = false
        textField.isHidden = true
    }
    
    // MARK: - Configure constraints
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 60),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -(UIScreen.main.bounds.height / 6)),
//            button.topAnchor.constraint(equalTo: picker.bottomAnchor, constant: 100)
        ])
        
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textField.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 70),
            textField.heightAnchor.constraint(equalToConstant: 40)
//            textField.topAnchor.constraint(equalTo: picker.bottomAnchor, constant: 100)
        ])
    }
}

// MARK: - Extensions

extension SelectionViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return helpersArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textField.placeholder = helpersArray[row]
        self.town = helpersArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return helpersArray[row]
    }
}


