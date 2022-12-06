//
//  HomeViewController.swift
//  Clase8_1
//
//  Created by TEO on 3/12/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let user = self.user{
            let fullName = "\(user.name) \(user.lastname)"
            let email = "\(user.email)"
            emailLabel.text = email
            fullNameLabel.text = fullName
            image.image = UIImage(named: user.image)
        }
    }

    @IBAction func onLogOutButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
}
