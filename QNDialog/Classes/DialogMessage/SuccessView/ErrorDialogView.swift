//
//  ErrorDialogView.swift
//  Pop
//
//  Created by quan nguyen on 08/06/2021.
//  Copyright © 2021 quan nguyen. All rights reserved.
//

import UIKit
import SwiftMessages

class ErrorDialogView: UIView {
    private var message: String?
    @IBOutlet weak var labelDesc: UILabel!
    @IBOutlet weak var buttonSubmit: SubmitButton!
    @IBAction func onTouchSubmit(_ sender: Any) {
        SwiftMessages.hide()
    }
    
    init(frame: CGRect, message: String) {
        super.init(frame: frame)
        self.setupNib()
        self.message = message
        self.customView()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupNib()
        self.customView()
    }
    
    @objc public override func setupNib() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: self.nibName(), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        let bindings = ["view": view]
        if isIPad() {
            let margin = (UIScreen.main.bounds.size.width  - 600)/2
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-\(margin)-[view]-\(margin)-|", options: [], metrics: nil, views: bindings))
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|", options: [], metrics: nil, views: bindings))

        } else {
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-25-[view]-25-|", options: [], metrics: nil, views: bindings))
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|", options: [], metrics: nil, views: bindings))
        }
    }

    
    fileprivate func customView() {
        labelDesc.text = message
        labelDesc.textColor = UIColor(red: 0.212, green: 0.212, blue: 0.212, alpha: 1)
        labelDesc.font = UIFont(name: "SanFranciscoDisplay-Medium", size: 18)
        labelDesc.numberOfLines = 0
        
        buttonSubmit.setTitle(NSLocalizedString("Ok", comment: ""), for: .normal)
    }

}
