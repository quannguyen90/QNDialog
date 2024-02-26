//
//  DialogUtil.swift
//  QNDialog
//
//  Created by Quan Nguyen on 02/07/2022.
//

import Foundation
import SwiftMessages

@objc public class DialogConfig: NSObject {
    var cancelButtonColor: UIColor = UIColor(red: 0.667, green: 0.667, blue: 0.667, alpha: 1)
    var doneButtonColor: UIColor = UIColor(red: 0.02, green: 0.376, blue: 0.651, alpha: 1)
}


func isIPad() -> Bool {
    return UIDevice.current.userInterfaceIdiom == .pad
}


@objc public class DialogUtils: NSObject {

    @objc public static func showDialogTwoOption(title: NSString?,
                                                 message: NSString? = nil,
                                                 yesTitle: NSString,
                                                 noTitle: NSString,
                                                 dismissOnBlackOverlayTap: Bool = true,
                                                 config: DialogConfig = DialogConfig(),
                                                 onTouchYes: @escaping () ->(),
                                                 onTouchNo: @escaping () ->(),
                                                 didDissmiss: @escaping () ->()) {
        let titleStr = title as String?
        let messageStr = message as String?
        let yesTitleStr = yesTitle as String
        let noTitleStr = noTitle as String
        
        let alertPass = TwoOptionDialog(frame: CGRect(x: 0, y: 0, width: 300, height: 260), message: messageStr, title: titleStr, dialogConfig: config)
        alertPass.buttonYes.setTitle(yesTitleStr, for: .normal)
        alertPass.buttonNo.setTitle(noTitleStr, for: .normal)
        alertPass.didTouchNo = onTouchNo
        alertPass.didTouchYes = onTouchYes
//        alertPass.show()
        
        var config = SwiftMessages.Config()
        config.presentationStyle = .center
        config.duration = .forever
        config.dimMode = .gray(interactive: dismissOnBlackOverlayTap)
        config.interactiveHide = dismissOnBlackOverlayTap
        config.eventListeners.append() { event in
            if case .didHide = event {
                didDissmiss()
            }
        }
        
        SwiftMessages.show(config: config, view: alertPass)
    }

    @objc public static func showDialogTwoOptionAttributed(title: String?,
                                                           attributedMessage: NSAttributedString? = nil,
                                                           yesTitle: String,
                                                           noTitle: String,
                                                           dismissOnBlackOverlayTap: Bool = true,
                                                           config: DialogConfig = DialogConfig(),
                                                           onTouchYes: @escaping () ->(),
                                                           onTouchNo: @escaping () ->(),
                                                           didDissmiss: @escaping () ->()) {
        SwiftMessages.hide()
        let alertPass = TwoOptionDialog(frame: CGRect(x: 0, y: 0, width: 300, height: 260),message: nil, title: title, dialogConfig: config)
        alertPass.labelDesc.attributedText = attributedMessage
        alertPass.buttonYes.setTitle(yesTitle, for: .normal)
        alertPass.buttonNo.setTitle(noTitle, for: .normal)
        alertPass.didTouchNo = onTouchNo
        alertPass.didTouchYes = onTouchYes

        var config = SwiftMessages.Config()
        config.duration =  .forever
        config.dimMode = .gray(interactive: dismissOnBlackOverlayTap)
        config.presentationStyle = .center
        config.interactiveHide = dismissOnBlackOverlayTap
        config.eventListeners.append() { event in
            if case .didHide = event {
                didDissmiss()
            }
        }
        
        SwiftMessages.show(config: config, view: alertPass)
    }
    
    @objc public static func showDialogError(message: String,
                                             dismissOnBlackOverlayTap: Bool = true,
                                             isAutoClose: Bool = true,
                                             onTouchDone: @escaping (_ text: String?) ->(),
                                             didDissmiss: @escaping () ->()) {
        SwiftMessages.hide()
        
        let alertPass = ErrorDialogView(frame: CGRect(x: 0, y: 0, width: 300, height: 260),message: message)
        
        var config = SwiftMessages.Config()
        config.duration = isAutoClose ? .seconds(seconds: 5) : .forever
        config.dimMode = .gray(interactive: dismissOnBlackOverlayTap)
        config.presentationStyle = .center
        config.interactiveHide = dismissOnBlackOverlayTap
        config.eventListeners.append() { event in
            if case .didHide = event {
                didDissmiss()
            }
        }

        SwiftMessages.show(config: config, view: alertPass)
    }

    @objc public static func showDialog(dialogView: UIView,
                                             dismissOnBlackOverlayTap: Bool = true,
                                             isAutoClose: Bool = true,
                                        didDissmiss: @escaping () ->()) {
        var config = SwiftMessages.Config()
        config.duration = isAutoClose ? .seconds(seconds: 5) : .forever
        config.dimMode = .gray(interactive: dismissOnBlackOverlayTap)
        config.presentationStyle = .center
        config.interactiveHide = dismissOnBlackOverlayTap
        config.eventListeners.append() { event in
            if case .didHide = event {
                didDissmiss()
            }
        }

        SwiftMessages.show(config: config, view: dialogView)
    }

    @objc public static func hideMessage() {
        SwiftMessages.hide()
    }
}


