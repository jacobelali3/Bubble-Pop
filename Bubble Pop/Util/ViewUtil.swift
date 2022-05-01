//
//  ViewUtil.swift
//  Bubble Pop
//
//  Created by Jacob Elali on 27/4/2022.
//

import UIKit
extension UIViewController {
    @objc func hide() {
        view.endEditing(true)
    }
    func dismissKeyboardWhenever() {
        let action: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.hide))
        action.cancelsTouchesInView = false
        view.addGestureRecognizer(action)
    }
}

