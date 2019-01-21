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
    
    override func loadView() {
        self.view = canvasView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
    }
}

