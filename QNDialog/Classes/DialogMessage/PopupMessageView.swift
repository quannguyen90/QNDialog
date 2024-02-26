//
//  PopupMessageView.swift
//  TriviaLive
//
//  Created by quan nguyen on 4/25/19.
//  Copyright © 2019 quan nguyen. All rights reserved.
//

import UIKit
import SwiftMessages

class PopupMessageView: UIView {
    
    @IBOutlet weak var buttonYes: UIButton!
    @IBOutlet weak var labelDesc: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    
    var didTouchNo:(()->())?
    var didTouchYes:(()->())?
    private var message: String?
    private var title: String?

    init(frame: CGRect, message: String?, title: String?) {
        super.init(frame: frame)
        self.setupNib()
        self.title = title
        self.message = message
        self.customView()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupNib()
//        self.message = message
        self.customView()
    }
    
    @objc public override func setupNib() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: self.nibName(), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        let bindings = ["view": view]
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-25-[view]-25-|", options: [], metrics: nil, views: bindings))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|", options: [], metrics: nil, views: bindings))
    }

    
    fileprivate func customView() {
        labelTitle.text = title
        labelTitle.textColor = UIColor(red: 0.212, green: 0.212, blue: 0.212, alpha: 1)
        labelTitle.font = UIFont(name: "SanFranciscoDisplay-Semibold", size: 20)
        labelTitle.numberOfLines = 0
                
        labelDesc.textColor = UIColor(red: 0.212, green: 0.212, blue: 0.212, alpha: 1)
        labelDesc.font = UIFont(name: "SanFranciscoDisplay-Regular", size: 16)
        labelDesc.numberOfLines = 0
        labelDesc.text = message
      
        buttonYes.backgroundColor = UIColor(red: 0, green: 0.37, blue: 0.65, alpha: 1)
        buttonYes.layer.cornerRadius = 8
        buttonYes.setTitle(NSLocalizedString("Có", comment: ""), for: .normal)
        buttonYes.setTitleColor(UIColor.white, for: .normal)
        buttonYes.titleLabel?.font = UIFont(name: "SanFranciscoDisplay-Semibold", size: 16)

    }


    @IBAction func onTouchYes(_ sender: Any) {
        didTouchYes?()
        SwiftMessages.hide()
    }
}
