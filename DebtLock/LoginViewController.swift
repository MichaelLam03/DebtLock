//
//  LoginViewController.swift
//  DebtLock
//
//  Created by Michael Lam on 25/7/2017.
//  Copyright © 2017 Michael Lam. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseAuthUI


func loginButtonTapped(_ sender: UIButton) {
    // 1
    guard let authUI = FUIAuth.defaultAuthUI()
        else { return }
    
    // 2
    authUI.delegate = self
    
    // 3
    let authViewController = authUI.authViewController()
    present(authViewController, animated: true)
}

class LoginViewController: UIViewController {
    // ...
}

extension LoginViewController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith user: User?, error: Error?) {
        print("handle user signup / login")
    }
}



