//
//  LoginViewController.swift
//  HomeWork_2.3
//
//  Created by Никита Гуляев on 26.08.2021.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userTextView: UITextField!
    @IBOutlet weak var userPasswordTextView: UITextField!
    
//    MARK: - Private properties
    private let user = "User"
    private let password = "Password"
    
//    MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.user = user
    }
    
//    MARK - IBAction
    
    @IBAction func logInView() {
        if userTextView.text != user || userPasswordTextView.text != password {
            showAlert(
                title: "Invalid login or password",
                message: "Please, enter correct login and password",
                textField: userPasswordTextView
            )
        }
    }
    
    @IBAction func forgotUserName(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(title: "Oops!", message: "Your name is \(user) 😁")
        : showAlert(title: "Oops!", message: "Your password is \(password) 😁")
    }
    
    @IBAction func unwindSegue(segue : UIStoryboardSegue) {
        userTextView.text = ""
        userPasswordTextView.text = ""
    }
    
//    MARK - Private Methods
//    extension LoginViewController {
            private func showAlert(title: String, message: String, textField: UITextField? = nil) {
                let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default) { _ in
                    textField?.text = ""
                }
                alert.addAction(okAction)
                present(alert, animated: true)
        }
//    }
    
//    MARK: UITextFieldDelegate
//    extension LoginViewController: UITextFieldDelegate {
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            super.touchesBegan(touches, with: event)
            view.endEditing(true)
        }
        func UITextFieldDelegate (_textField: UITextField) -> Bool {
            if userTextView == userTextView {
            userPasswordTextView.becomeFirstResponder()
            } else {
                logInView()
                performSegue(withIdentifier: "showWelcomeWC", sender: nil)
            }
            return true
        }
    }
//}
