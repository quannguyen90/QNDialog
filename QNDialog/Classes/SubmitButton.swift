//
//  SubmitButton.swift
//  TZFood
//
//  Created by Quan.nv on 9/7/18.
//  Copyright © 2018 Foodbook.vn. All rights reserved.
//

import UIKit

class SubmitButton: UIButton {
    
    var title: String?

    override func draw(_ rect: CGRect) {
    }
        
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
 
    var titleButton: String?
    var bkgColor: UIColor? = UIColor(red: 0, green: 0.37, blue: 0.65, alpha: 1)

    override func awakeFromNib() {
        self.layer.cornerRadius = 12
        self.layer.masksToBounds = true
        self.backgroundColor = UIColor(red: 0, green: 0.37, blue: 0.65, alpha: 1)
        self.tintColor = UIColor(red: 0, green: 0.37, blue: 0.65, alpha: 1)
        self.setTitleColor(UIColor.white, for: .normal)
        self.titleLabel?.font = UIFont(name: "SanFranciscoDisplay-Semibold", size: 16)
    }
    
}
