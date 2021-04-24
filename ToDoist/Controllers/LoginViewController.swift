//
//  LoginViewController.swift
//  ToDoist
//
//  Created by Anton on 22.04.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    var user = TaskDataManager.self

    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var userPasswordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let addUserVC = segue.destination as? AddUserViewController else {return}
        
    }
}
