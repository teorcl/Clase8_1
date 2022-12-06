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
        static let noUserExists = "El usuario no existe"
        static let connectionError = "Fue imposible enviar la información al servidor"
        static let errorTitle = "Error"
        static let actionTitle = "Cancelar"
        static let errorCredentials = "Credenciales incorrectas"
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
    let possibleFailures = [1,2,3]

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!


    @IBAction func loginButtonPressed() {
        runLogin()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let homeViewController =  segue.destination as? HomeViewController {
            homeViewController.user = validUsers[0]
        }
    }

    private func runLogin(){
        getCredentials()
        searchUserInDataBase()
        manageAccess()
        clearCredentials()
    }
      
    private func getCredentials(){
        email = emailTextField.text ?? ""
        password = passwordTextField.text ?? ""
    }
    
    private func searchUserInDataBase(){
        validUsers = users.filter {$0.email == email}
    }
    
    private func manageAccess(){
        let fail = Int.random(in: 1...5)
        if possibleFailures.contains(fail){
            
            executeAlert(title: Const.errorTitle, message: Const.connectionError, actionTitle: Const.actionTitle)
            
        } else if validUsers.count == 0{
            
            executeAlert(title: Const.errorTitle, message: Const.noUserExists, actionTitle: Const.actionTitle)
            
        } else {
            
            tryConnection()
            
        }
    }
    
    private func executeAlert(title: String, message: String, actionTitle: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: actionTitle, style: .cancel)
        alert.addAction(cancelAction)
        present(alert,animated: true)
    }
    
    private func tryConnection(){
        processCredential()
    }
    
    private func processCredential(){
        let areCredentialsValid = validateCredentials()
        processValidationResult(result: areCredentialsValid)
    }
    
    private func validateCredentials() -> Bool {
        return validUsers[0].email == email && validUsers[0].password == password
    }
    
    func processValidationResult(result:Bool){
        if result {
            excuteTransition()
        } else {
            executeAlert(title: Const.errorTitle, message: Const.errorCredentials, actionTitle: Const.actionTitle)
        }
        
    }
    
    private func excuteTransition(){
        performSegue(withIdentifier: Const.segueIdentifier, sender: self)
    }
    
    private func clearCredentials(){
        passwordTextField.text?.removeAll()
    }
    
}
