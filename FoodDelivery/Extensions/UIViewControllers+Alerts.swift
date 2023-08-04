//
//  UIViewControllers+Alerts.swift
//  FoodDelivery
//
//  Created by Fahad Bin Raza on 25/05/2023.
//

import UIKit

extension UIViewController {
  public func showAlert(title: String?, message: String?) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
    alertController.addAction(okAction)
    present(alertController, animated: true)
  }
}

// Card Summary Debit
//lblCreditPosted.superview?.isAccessibilityElement = true
//lblCreditPosted.superview?.accessibilityLabel = Utilities.getMessage(messageId: 10183) + ","
//lblCreditPosted.superview?.accessibilityLabel? += lblCreditPosted.label.text ?? ""
//lblDebitPosted.superview?.isAccessibilityElement = true
//lblDebitPosted.superview?.accessibilityLabel = Utilities.getMessage(messageId: 10184) + ","
//lblDebitPosted.superview?.accessibilityLabel? += lblDebitPosted.label.text ?? ""

// Fee Summary Cell

//if UIAccessibility.isVoiceOverRunning {
//    configureAccessibility(subItem: subItemView)
//}

//func configureAccessibility(subItem: FeeSummaryCellSubView) {
//    subItem.isAccessibilityElement = true
//    subItem.accessibilityLabel = subItem.labelFeeDescription.label.text
//    subItem.accessibilityLabel? += ","
//    subItem.accessibilityLabel? +=  subItem.labelFeeAmount.accessibilityLabel ?? ""
//    subItem.accessibilityLabel? += "," + Utilities.getMessage(messageId: 13_089) + ","
//    subItem.accessibilityLabel? += subItem.labelFeeSubtitle.label.text ?? ""
//}


// Dynamic Review widget

// add views to stack
//if UIAccessibility.isVoiceOverRunning {
//    self.accessibilityElements = []
//}

// Biometric Authenticatioin
//
//@IBOutlet var titleContainer: UIView?
//if UIAccessibility.isVoiceOverRunning {
//    titleContainer?.accessibilityElements = [self.headingLabelWidget, self.switchWidget]
//} // Need to Add property in db for image focus remove


// Block Reissue

//func setAccessibility() {
//    viewCardReissue.isAccessibilityElement = true
//    viewCardReissue.accessibilityLabel = self.lblRessiue.accessibilityLabel ?? ""
//    viewCardReissue.accessibilityLabel? += ","
//    viewCardReissue.accessibilityLabel? +=  self.lblReissueDate.accessibilityLabel ?? ""
//}
//self.lblReissueDate.setLabelText(msg: date)
//if UIAccessibility.isVoiceOverRunning {
//    setAccessibility()
//}
