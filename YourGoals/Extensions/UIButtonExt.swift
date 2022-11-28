//
//  UIButtonExt.swift
//  YourGoals
//
//  Created by Omar Rodriguez on 11/25/22.
//

import UIKit

extension UIButton {
    func setSelectedColor(){
        self.backgroundColor = UIColor( named: "colorSelected")
        
    }
    func setDelectedColor(){
        self.backgroundColor = UIColor(named: "colorDeselected")
    }
}
