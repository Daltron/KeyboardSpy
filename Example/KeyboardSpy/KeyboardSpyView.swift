
//
//  KeyboardSpyView.swift
//  KeyboardSpy
//
//  Created by Dalton Hinterscher on 2/8/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import KeyboardSpy
import SnapKit
import Material

class KeyboardSpyView: UIView, KeyboardSpyAgent {

    internal var keyboardEventsToSpyOn: [KeyboardSpyEvent] = [.willShow, .willHide]
    
    private var card: Card!
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        
        let toolbar = Toolbar(rightViews: [])
        toolbar.title = "KeyboardSpy"
        toolbar.titleLabel.textAlignment = .left
        
        toolbar.detail = "Example"
        toolbar.detailLabel.textAlignment = .left
        toolbar.detailLabel.textColor = Color.blueGrey.base
        
        let usernameTextField = TextField()
        usernameTextField.placeholder = "Touch Here"
        usernameTextField.clearButtonMode = .whileEditing
        
        card = Card()
        card.toolbar = toolbar
        card.toolbarEdgeInsetsPreset = .square3
        card.toolbarEdgeInsets.bottom = 0
        card.toolbarEdgeInsets.right = 8
        card.contentView = usernameTextField
        card.contentViewEdgeInsetsPreset = .wideRectangle3
        addSubview(card)
        
        card.snp.makeConstraints { (make) in
            make.bottom.equalTo(0)
            make.width.equalToSuperview().multipliedBy(0.75)
            make.height.equalTo(200)
            make.centerX.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func keyboardSpyEventProcessed(event: KeyboardSpyEvent, keyboardInfo: KeyboardSpyInfo) {
        
        if event == .willShow {
            UIView.animate(withDuration: keyboardInfo.animationDuration, animations: {
                self.card.snp.updateConstraints { (make) in
                    make.bottom.equalTo(-keyboardInfo.keyboardHeight)
                }
                self.card.superview!.layoutIfNeeded()
            })
        } else if event == .willHide {
            UIView.animate(withDuration: keyboardInfo.animationDuration, animations: {
                self.card.snp.updateConstraints { (make) in
                    make.bottom.equalTo(0)
                }
                self.card.superview!.layoutIfNeeded()
            })
        }
    }
}
