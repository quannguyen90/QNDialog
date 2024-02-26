//
//  TwoOptionDialog.swift
//  Pop
//
//  Created by Quan Nguyen on 10/08/2021.
//  Copyright © 2021 quan nguyen. All rights reserved.
//

import UIKit
import SwiftMessages
import QNQuantityTextField

public class TwoOptionDialog: UIView {
    
    @IBOutlet weak var buttonNo: SubmitButton!
    @IBOutlet weak var buttonYes: SubmitButton!
    @IBOutlet weak var labelDesc: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    
    var didTouchNo:(()->())?
    var didTouchYes:(()->())?
    private var message: String?
    private var title: String?
    private var dialogConfig: DialogConfig = DialogConfig()

    public init(frame: CGRect, message: String?, title: String?, dialogConfig: DialogConfig) {
        super.init(frame: frame)
        
        self.setupNib()
        self.dialogConfig = dialogConfig
        self.title = title
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
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.26
        
        labelTitle.attributedText = NSAttributedString(string: title ?? "", attributes: [NSAttributedString.Key.paragraphStyle : paragraphStyle])
        labelTitle.textColor = UIColor(red: 0.212, green: 0.212, blue: 0.212, alpha: 1)
        labelTitle.font = UIFont(name: "SanFranciscoDisplay-Semibold", size: 20)
        labelTitle.numberOfLines = 0
                
        labelDesc.textColor = UIColor(red: 0.212, green: 0.212, blue: 0.212, alpha: 1)
        labelDesc.font = UIFont(name: "SanFranciscoDisplay-Regular", size: 16)
        labelDesc.numberOfLines = 0
        labelDesc.textAlignment = .left
        labelDesc.text = message
        
        buttonNo.backgroundColor = dialogConfig.cancelButtonColor
        buttonNo.layer.cornerRadius = 8
        buttonNo.setTitle(NSLocalizedString("Không", comment: ""), for: .normal)
        buttonNo.setTitleColor(UIColor(red: 0.212, green: 0.212, blue: 0.212, alpha: 1), for: .normal)
        buttonNo.titleLabel?.font = UIFont(name: "SanFranciscoDisplay-Semibold", size: 16)
        
        buttonYes.backgroundColor = dialogConfig.doneButtonColor
        buttonYes.layer.cornerRadius = 8
        buttonYes.setTitle(NSLocalizedString("Có", comment: ""), for: .normal)
        buttonYes.setTitleColor(UIColor.white, for: .normal)
        buttonYes.titleLabel?.font = UIFont(name: "SanFranciscoDisplay-Semibold", size: 16)

    }

    @IBAction func onTouchNo(_ sender: Any) {
        didTouchNo?()
        SwiftMessages.hide()
    }
    
    @IBAction func onTouchYes(_ sender: Any) {
        didTouchYes?()
        SwiftMessages.hide()
    }
    
    func showFrom(sourceView: UIView, onTouchDone: @escaping () ->()) {
        show()
    }
    
    public func show() {
        var config = SwiftMessages.Config()
        config.presentationStyle = .center
        config.duration = .forever
        config.dimMode = .gray(interactive: true)
        SwiftMessages.show(config: config, view: self)
    }
    
    func updateFrame() {
        let heightScreen = UIScreen.main.bounds.size.height
        self.layoutIfNeeded()
        let frame = self.frame
        self.frame.origin.y = heightScreen
        UIView.animate(withDuration: 0.25) {
            //            overlayView.alpha = 0.65
            self.frame = CGRect(origin: CGPoint(x: frame.origin.x, y: heightScreen - frame.size.height), size: frame.size)
        }
    }
    
   
    
    func hide() {
        SwiftMessages.hide()
    }
}
