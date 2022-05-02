//
//  ViewUtil.swift
//  Bubble Pop
//
//  Created by Jacob Elali on 27/4/2022.
//

import UIKit


//Assists with keyboard functionality.
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

