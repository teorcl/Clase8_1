//
//  LoginViewController.swift
//  Clase8_1
//
//  Created by TEO on 3/12/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    private struct Const{
        static let failureValidationMessage = "Credenciales incorrectas"
        static let segueIdentifier = "goToHome"
    }
    
    var email = String()
    var password = String()

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!


    @IBAction func loginButtonPressed() {
        processCredential()
        clearCredentials()
    }
    
    private func processCredential(){
        email = emailTextField.text ?? ""
        password = passwordTextField.text ?? ""
        let areCredentialsValid = validateCredentials()
        
        processValidationResult(result: areCredentialsValid)
        
    }
    
    private func validateCredentials() -> Bool {
        // Almacenar las credenciales en una tupla y validar si esa tupla está en un arreglo
        return true
    }
    
    func processValidationResult(result:Bool){
        if result {
            excuteTransition()
        } else {
            /*if (true) {
                // funcion para por no existencia de usuario o credenciales incorrectas
            }else{
                // funcion para alerta de conexion con la nube
            }*/
            
        }
        
    }
    
    private func excuteTransition(){
        performSegue(withIdentifier: Const.segueIdentifier, sender: self)
    }
    
    private func clearCredentials(){
        passwordTextField.text?.removeAll()
        emailTextField.text?.removeAll()
    }
    
}
