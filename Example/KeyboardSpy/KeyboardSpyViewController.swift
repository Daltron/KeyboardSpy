
//
//  ViewController.swift
//  KeyboardSpy
//
//  Created by Daltron on 02/07/2017.
//  Copyright (c) 2017 Daltron. All rights reserved.
//

import UIKit
import KeyboardSpy

class KeyboardSpyViewController: UIViewController {
    
    private var keyboardSpyView: KeyboardSpyView!
    
    init() {
        super.init(nibName: nil, bundle: nil)
        keyboardSpyView = KeyboardSpyView()
        view = keyboardSpyView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        KeyboardSpy.spy(on: keyboardSpyView)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        KeyboardSpy.unspy(on: keyboardSpyView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

