//
//  ViewBuilder.swift
//  Exchange rates
//
//  Created by Евгений Езепчук on 4.11.23.
//

import UIKit
import Lottie
import YandexMapsMobile

class ViewBuilder {
    
    static let shared = ViewBuilder()
    // MARK: - private properties
    
//    var picker: UIPickerView? = nil
//        let picker = UIPickerView()
//        picker.numberOfRows(inComponent: 5)
//        picker.translatesAutoresizingMaskIntoConstraints = false
//        return picker
//    }()
    
    // MARK: - ViewController. Loading screen animation view
    
    func configureLoadingScreen() -> UIView {
        var view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        view.backgroundColor = .white
        let imageView = LottieAnimationView()
        imageView.backgroundColor = .white
        imageView.animation = LottieAnimation.named("LoadingAnimation1")
        imageView.loopMode = .loop
        imageView.play()
        view = imageView
        return view
    }
    
    // MARK: - GetStartedViewController.
    
    func configureGetStartesVC(_ navigationController: UINavigationController) -> UIView {
        let selfView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        selfView.backgroundColor = .backgroundColor
        
        // MARK: - Configure app name label
        
        let label = UILabel()
        label.text = "coinrates"
        label.font = .systemFont(ofSize: 40, weight: .bold)
        label.textColor = .white
        selfView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: selfView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: selfView.centerYAnchor, constant: -50)
        ])
        
        // MARK: - Configure decoration circle views
        
        let circle1 = configureCircleView(icon: "$", frame: CGRect(x: 220, y: 200, width: 150, height: 150), bcgrndColor: .circleColor1, titleColor: .circleColor3)
        let circle2 = configureCircleView(icon: "€", frame: CGRect(x: 30, y: 60, width: 120, height: 120), bcgrndColor: .circleColor2, titleColor: .circleColor1)
        let circle3 = configureCircleView(icon: "¥", frame: CGRect(x: 40, y: 430, width: 100, height: 100), bcgrndColor: .circleColor3, titleColor: .circleColor2)
        
        selfView.addSubview(circle1)
        selfView.addSubview(circle2)
        selfView.addSubview(circle3)
        
        // MARK: - Configure circle view
        
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.cornerRadius = 50
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        selfView.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: selfView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: selfView.trailingAnchor),
            view.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 4),
            view.bottomAnchor.constraint(equalTo: selfView.bottomAnchor)
        ])
        
        // MARK: - Configure getStratedButton
        
        let button = UIButton(primaryAction: UIAction(handler: { _ in
            navigationController.pushViewController(SelectionViewController(), animated: true)
        }))
        button.setTitle("Get started", for: .normal)
        button.setTitleColor(.titleColor, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        button.backgroundColor = .buttonBacgrndColor
        button.layer.cornerRadius = 15
        view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 100),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -30)
        ])
        
        return selfView
    }
    
    // MARK: - Configure methods whose return circle view
    
    private func configureCircleView(icon: String, frame: CGRect, bcgrndColor: UIColor, titleColor: UIColor) -> UIView {
        let circle = UIView(frame: frame)
        circle.layer.cornerRadius = frame.width/2
        circle.backgroundColor = bcgrndColor
        let label = UILabel()
        label.text = icon
        label.textColor = titleColor
        label.font = .systemFont(ofSize: frame.width / 2, weight: .regular)
        circle.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: circle.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: circle.centerYAnchor)
        ])
        return circle
    }
    
    // MARK: - Configure selection view
    
    func configureSelectionView() -> UIView {
        let selfView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        selfView.backgroundColor = .backgroundColor
        
//        picker = UIPickerView()
//        guard let picker = picker else { return UIPickerView() }
//        picker.backgroundColor = .blue
//        selfView.addSubview(picker)
//        picker.isHidden = true
//        picker.translatesAutoresizingMaskIntoConstraints = false
//        
//        NSLayoutConstraint.activate([
//            picker.centerXAnchor.constraint(equalTo: selfView.centerXAnchor),
//            picker.centerYAnchor.constraint(equalTo: selfView.centerYAnchor),
//            picker.widthAnchor.constraint(equalToConstant: 60),
//            picker.heightAnchor.constraint(equalToConstant: 40)
//        ])
        
        
        // MARK: - Configure gesture for text field
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tap))
        
        
        
        // MARK: - Configure selection textField
        
        let textField = UITextField()
//        textField.addAction(UIAction(handler: { _ in
//            print("tap")
//        }), for: .touchUpInside)
        textField.addGestureRecognizer(tapGesture)
        textField.placeholder = "Александрия"
        textField.textAlignment = .center
        textField.textColor = .titleColor
        textField.backgroundColor = .subViewBackgrndColor
        textField.layer.cornerRadius = 7
        selfView.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textField.heightAnchor.constraint(equalToConstant: 30),
            textField.widthAnchor.constraint(equalTo: selfView.widthAnchor, constant: -80),
            textField.centerXAnchor.constraint(equalTo: selfView.centerXAnchor),
            textField.centerYAnchor.constraint(equalTo: selfView.centerYAnchor)
        ])
        
        return selfView
    }
    
    @objc func tap() {
      print("tap")
    }
    
    // MARK: - configure BranchViewController.
    
    func configureBranchVC(_ model: Model) -> UIView {
        
       // MARK: - Configure label
        
        let label2: UILabel = {
            let lbl = UILabel()
            lbl.font = .systemFont(ofSize: 12)
            lbl.textAlignment = .left
//            lbl.contentMode = .
            lbl.numberOfLines = 0
            lbl.textColor = .titleColor
            lbl.clipsToBounds = true
            lbl.translatesAutoresizingMaskIntoConstraints = false
            return lbl
        }()
        
        let modelWT = model.info_worktime ?? ""
        
        var endString = "Режим работы:\n"
        for value in modelWT {
            if value != "|" {
                endString += String(value)
            } else {
                endString += "\n"
            }
        }
        label2.text = endString
        
        // MARK: - Configure descriptionView
        
        let descriptionView: UIView = {
            let view = UIView()
            view.backgroundColor = .clear
            view.layer.cornerRadius = 20
            view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        // MARK: - Configure mapView
        
        let mapView: YMKMapView = {
            let view = YMKMapView()
            view.backgroundColor = .gray
            view.translatesAutoresizingMaskIntoConstraints = false
            view.layer.cornerRadius = 20
            view.clipsToBounds = true
            
            view.mapWindow.map.move(
                   with: YMKCameraPosition(
                    // 53.921881, 27.436302
                       target: YMKPoint(latitude: 53.921422, longitude: 27.436412),
                       zoom: 17,
                       azimuth: 0,
                       tilt: 0
                   ),
                   animation: YMKAnimation(type: YMKAnimationType.smooth, duration: 8),
                   cameraCallback: nil)
            addPlacemark(view.mapWindow.map)
            
            return view
        }()
        
        func addPlacemark(_ map: YMKMap) {
            let image = UIImage(named: "placemark_icon1") ?? UIImage()
            let placemark = map.mapObjects.addPlacemark()
            placemark.geometry = YMKPoint(latitude: 53.921422, longitude: 27.436412)
            placemark.setIconWith(image)
        }
        
        // MARK: - Configure backView
        
        let backView: UIView = {
            let view = UIView()
            view.backgroundColor = .buttonBacgrndColor
            view.layer.cornerRadius = 20
            view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        // MARK: - Configure card views
        
        func createLabel(labelTitle: String, labelText: String) -> UILabel {
            let lbl = UILabel()
            lbl.font = .systemFont(ofSize: 12)
            lbl.numberOfLines = 0
            lbl.textAlignment = .left
            lbl.preferredMaxLayoutWidth = 160
            lbl.textColor = .titleColor
            lbl.clipsToBounds = true
            lbl.translatesAutoresizingMaskIntoConstraints = false
            lbl.text = "\(labelTitle)\n\(labelText)"
            
            return lbl
        }
        
        func configRectangle() -> UIView {
            let rectView = UIView()
            rectView.backgroundColor = .backgroundColor
            rectView.layer.cornerRadius = 20
            rectView.translatesAutoresizingMaskIntoConstraints = false
            rectView.clipsToBounds = true
            return rectView
        }
        
        let label3 = createLabel(labelTitle: "Адрес:", labelText: "\(model.name_type ?? "")\(model.name ?? "") \n\(model.street_type ?? ",")\(model.street ?? "") \(model.home_number ?? "")")
        
        
        
        let rect1 = configRectangle()
        let rect2 = configRectangle()
        let rect3 = configRectangle()
        let rect4 = configRectangle()
        
        // MARK: - Configure constraints
        
        backView.addSubview(mapView)
        backView.addSubview(descriptionView)
        descriptionView.addSubview(rect1)
        descriptionView.addSubview(rect2)
        descriptionView.addSubview(rect3)
        descriptionView.addSubview(rect4)
        rect2.addSubview(label2)
        rect3.addSubview(label3)
        
        
        NSLayoutConstraint.activate([
            mapView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 10),
            mapView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -10),
            mapView.bottomAnchor.constraint(equalTo: backView.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            mapView.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        NSLayoutConstraint.activate([
            descriptionView.topAnchor.constraint(equalTo: backView.topAnchor, constant: 10),
            descriptionView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 10),
            descriptionView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -10),
            descriptionView.bottomAnchor.constraint(equalTo: mapView.topAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            label2.centerXAnchor.constraint(equalTo: rect2.centerXAnchor),
            label2.centerYAnchor.constraint(equalTo: rect2.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            label3.centerXAnchor.constraint(equalTo: rect3.centerXAnchor),
            label3.centerYAnchor.constraint(equalTo: rect3.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            rect1.leadingAnchor.constraint(equalTo: descriptionView.leadingAnchor),
            rect1.topAnchor.constraint(equalTo: descriptionView.topAnchor),
            rect1.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width / 2) - 15),
            rect1.bottomAnchor.constraint(equalTo: rect3.topAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            rect2.trailingAnchor.constraint(equalTo: descriptionView.trailingAnchor),
            rect2.topAnchor.constraint(equalTo: descriptionView.topAnchor),
            rect2.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width / 2) - 15),
            rect2.heightAnchor.constraint(equalToConstant: 150),
            rect2.bottomAnchor.constraint(equalTo: rect4.topAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            rect3.leadingAnchor.constraint(equalTo: descriptionView.leadingAnchor),
            rect3.topAnchor.constraint(equalTo: rect1.bottomAnchor, constant: 10),
            rect3.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width / 2) - 15),
            rect3.heightAnchor.constraint(equalToConstant: 150),
            rect3.bottomAnchor.constraint(equalTo: descriptionView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            rect4.trailingAnchor.constraint(equalTo: descriptionView.trailingAnchor),
//            rect4.topAnchor.constraint(equalTo: rect2.bottomAnchor, constant: 10),
            rect4.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width / 2) - 15),
//            rect4.heightAnchor.constraint(equalToConstant: 150),
            rect4.bottomAnchor.constraint(equalTo: descriptionView.bottomAnchor)
        ])
        
//        print("dv height ", descriptionView.bounds.height)
        return backView
    }
        
}
