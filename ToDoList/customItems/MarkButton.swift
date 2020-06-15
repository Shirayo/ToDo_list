//
//  CustomButton.swift
//  Shirayo's_To_Do_List
//
//  Created by Shirayo on 08.06.2020.
//  Copyright © 2020 Shirayo. All rights reserved.
//

import Foundation
import UIKit
import CoreMotion

class MarkButton: UIButton {
    
    var status: Bool = false {
        didSet {
            self.update()
        }
    }
    
    var onImage = UIImage(named: "approved")
    var offImage = UIImage(named: "not approved")
    
    override init(frame: CGRect) {
           super.init(frame: frame)
           self.setStatus(false)
    }
       
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        //fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: functions
    
    func update() {
           UIView.transition(with: self, duration: 0.10, options: .transitionCrossDissolve, animations: {
            self.status ? self.setImage(self.onImage, for: .normal) : self.setImage(self.offImage, for: .normal)
        }, completion: nil)
    }
    
    func setStatus(_ status: Bool) {
        self.status = status
        if status {
            self.setImage(UIImage(named: "approved"), for: .normal)
        } else {
            self.setImage(UIImage(named: "not approved"), for: .normal)
        }
    }
    
    func toggle() {
        self.status ? self.setStatus(false) : self.setStatus(true)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        self.sendHapticFeedback()
        self.toggle()
    }
    
    func sendHapticFeedback() {
        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .heavy)
        impactFeedbackgenerator.prepare()
        impactFeedbackgenerator.impactOccurred()
    }
    
}
