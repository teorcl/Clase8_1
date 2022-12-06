//
//  LoginViewController.swift
//  Clase8_1
//
//  Created by TEO on 3/12/22.
//

import UIKit

struct User{
    let name:String
    let lastname:String
    let email:String
    let password:String
    let image:String
}

class LoginViewController: UIViewController {
    
    private struct Const{
        static let failureValidationMessage = "Credenciales incorrectas"
        static let segueIdentifier = "goToHome"
    }
    
    var email = String()
    var password = String()
    let users = [
        User(name: "Homero", lastname: "Simpson", email: "homero@simpson.com", password: "Homero123*", image: "homero"),
        User(name: "Bart", lastname: "Simpson", email: "bart@simpson.com", password: "Bart123*", image: "bart"),
        User(name: "Lisa", lastname: "Simpson", email: "lisa@simpson.com", password: "Lisa123*", image: "lisa"),
        User(name: "Marge", lastname: "Simpson", email: "marge@simpson.com", password: "Marge123*", image: "marge")
    ]
    
    var validUsers = [User]()

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!


    @IBAction func loginButtonPressed() {
        processCredential()
        clearCredentials()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let homeViewController =  segue.destination as? HomeViewController {
            homeViewController.user = validUsers[0]
        }
    }
    
    private func processCredential(){
        email = emailTextField.text ?? ""
        password = passwordTextField.text ?? ""
        let areCredentialsValid = validateCredentials()
        
        processValidationResult(result: areCredentialsValid)
        
    }
    
    private func validateCredentials() -> Bool {
        var validation = false
        searchUserWithEnteredCredentials()
        
        if validUsers.count == 1 {
            validation = true
        }
        
        return validation
    }
    
    func processValidationResult(result:Bool){
        if result {
            excuteTransition()
        } else {
            executeAlertError()
        }
        
    }
    
    private func excuteTransition(){
        performSegue(withIdentifier: Const.segueIdentifier, sender: self)
    }
    
    private func clearCredentials(){
        passwordTextField.text?.removeAll()
        emailTextField.text?.removeAll()
    }
    
    private func searchUserWithEnteredCredentials(){
        validUsers = users.filter {$0.email == email && $0.password == password}
    }
    
    private func executeAlertError(){
        let alert = UIAlertController(title: "Error", message: "El usuario no existe", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel)
        alert.addAction(cancelAction)
        present(alert,animated: true)
    }
      
        
}
