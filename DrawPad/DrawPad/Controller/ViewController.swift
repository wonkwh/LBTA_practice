//
//  ViewController.swift
//  DrawPad
//
//  Created by wonkwh on 21/01/2019.
//  Copyright © 2019 wonkwh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let canvasView = CanvasView()
    
    let undoButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Undo", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handleUndo), for: .touchUpInside)
        return button
    }()
    
    let clearButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("clear", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handleClear), for: .touchUpInside)
        return button
    }()
    
    let yellowButton : UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .yellow
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(handleColorChange), for: .touchUpInside)
        return button
    }()

    let blueButton : UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .blue
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(handleColorChange), for: .touchUpInside)
        return button
    }()

    let redButton : UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .red
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(handleColorChange), for: .touchUpInside)
        return button
    }()

    let slider : UISlider = {
        let slider = UISlider()
        slider.minimumValue = 1
        slider.maximumValue = 10
        slider.addTarget(self, action: #selector(handleWidthChange), for: .touchUpInside)
        return slider
    }()
    
    override func loadView() {
        self.view = canvasView
    }
    
    fileprivate func setupLayout() {
        let colorsStackView = UIStackView(arrangedSubviews: [yellowButton, redButton, blueButton])
        colorsStackView.distribution = .fillEqually
        let stackView = UIStackView(arrangedSubviews: [undoButton, clearButton,colorsStackView, slider])
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupLayout()
    }
    
    @objc fileprivate func handleUndo() {
        canvasView.undo()
    }
    
    @objc fileprivate func handleClear() {
        canvasView.clear()
    }

    @objc fileprivate func handleColorChange(button: UIButton) {
        canvasView.setStrokeColor(color: button.backgroundColor ?? .black)
    }

    @objc fileprivate func handleWidthChange(slider: UISlider) {
        canvasView.setStrokeWidth(width: CGFloat(slider.value))
    }
}

