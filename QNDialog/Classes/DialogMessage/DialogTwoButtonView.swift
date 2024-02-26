//
//  DialogTwoButtonView.swift
//  Skyline
//
//  Created by quan nguyen on 9/21/19.
//  Copyright © 2019 quan nguyen. All rights reserved.
//

import UIKit

class DialogTwoButtonView: UIView {

    let tagOverlayView = -9999
    var didDismiss: (()->())?
    var isTouchOverlay = false

    @IBOutlet weak var buttonCancel: SubmitButton!
    @IBOutlet weak var buttonDone: SubmitButton!
    @IBOutlet weak var labelTitleView: UILabel!{
        didSet {
            labelTitleView.text = NSLocalizedString("", comment: "")
            labelTitleView.textColor = UIColor(red: 0.212, green: 0.212, blue: 0.212, alpha: 1)
            labelTitleView.font = UIFont(name: "SanFranciscoDisplay-Semibold", size: 17)
        }
    }
    
    @IBOutlet weak var labelDesc: UILabel!{
        didSet {
            labelDesc.textColor = UIColor(red: 0.212, green: 0.212, blue: 0.212, alpha: 1)
            labelDesc.font = UIFont(name: "SanFranciscoDisplay-Medium", size: 15)
            labelDesc.text = NSLocalizedString("", comment: "")
        }
    }
    var onTouchDone: (()->())?
    var dismissOnBlackOverlayTap = true
    
    
    @IBAction func onTouchCancel(_ sender: Any) {
    }
    
    @IBAction func onTouchDone(_ sender: Any) {
        onTouchDone?()
    }
    
    public init(frame: CGRect, title: String, message: String) {
        super.init(frame: frame)
        self.setupNib()
        self.customView()
        labelDesc.text = message
        labelTitleView.text = title
    }
    
    public init(frame: CGRect, title: String, attributed: NSAttributedString) {
        super.init(frame: frame)
        self.setupNib()
        self.customView()
        labelDesc.attributedText = attributed
        labelTitleView.text = title
    }
    
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupNib()
        self.customView()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func customView() {
        buttonDone.layer.cornerRadius = 4
        buttonDone.layer.masksToBounds = true
        buttonDone.backgroundColor = UIColor(red: 0.02, green: 0.376, blue: 0.651, alpha: 1)
        buttonDone.titleLabel?.font = UIFont(name: "SanFranciscoDisplay-Semibold", size: 17)
        buttonDone.setTitle("Có", for: .normal)
        buttonDone.setTitleColor(UIColor.white, for: .normal)
        
        buttonCancel.layer.cornerRadius = 4
        buttonCancel.layer.masksToBounds = true
        buttonCancel.backgroundColor = UIColor(red: 239.0/255, green: 239.0/255, blue: 239.0/255, alpha: 1.0)
        buttonCancel.titleLabel?.font = UIFont(name: "SanFranciscoDisplay-Semibold", size: 17)
        buttonCancel.setTitle("Không", for: .normal)
        buttonCancel.setTitleColor(UIColor(red: 128.0/255, green: 128.0/255, blue: 128.0/255, alpha: 1.0), for: .normal)
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
    

    
}
