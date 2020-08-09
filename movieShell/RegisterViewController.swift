//
//  RegisterViewController.swift
//  movieShell
//
//  Created by Funa Nnoka on 7/12/20.
//  Copyright © 2020 Funa Nnoka. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth


class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorReportLabel: UILabel!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var passwordView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailView.layer.cornerRadius = emailView.frame.size.height / 2
        passwordView.layer.cornerRadius = passwordView.frame.size.height / 2
        // Do any additional setup after loading the view.
    }

    @IBAction func registerButton(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    self.errorReportLabel.text = e.localizedDescription //change to pop up
                } else {
                    self.performSegue(withIdentifier: K.registerHomeSegue, sender: self)

                }
            }
        }
        
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
