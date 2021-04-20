//
//  CreateTaskViewController.swift
//  ToDoist
//
//  Created by Artem Bazhanov on 15.04.2021.
//

import UIKit

class NewTaskViewController: UIViewController {
    
    @IBOutlet weak var nameTaskTF: UITextField!
    @IBOutlet weak var descriptionTaskTF: UITextField!
    
    @IBOutlet weak var lowImportant: UISwitch!
    @IBOutlet weak var normalImportant: UISwitch!
    @IBOutlet weak var emergencyImportant: UISwitch!
    
    var delegate: TaskDataManagerImpl!
    var statusImportant: ImportantStatus = .low
    
    @IBAction func statusImortant(_ sender: UISwitch) {
        print(sender)
        switch sender {
        case lowImportant:
            if lowImportant.isOn {
                normalImportant.isOn = false
                emergencyImportant.isOn = false
                
                statusImportant = .low
            } else {
                lowImportant.isOn = true
            }
        case normalImportant:
            if normalImportant.isOn {
                lowImportant.isOn = false
                emergencyImportant.isOn = false
                
                statusImportant = .normal
            } else {
                normalImportant.isOn = true
            }
            
        default:
            if emergencyImportant.isOn {
                lowImportant.isOn = false
                normalImportant.isOn = false
                
                statusImportant = .emergency
            } else {
                emergencyImportant.isOn = true
            }
        }
    }
    
    @IBAction func createPressed() {
        if nameTaskTF.text == "" {
            showAlert(with: "Ошибка!", and: "Заполните поле название задачи")
            return
        }
    
        delegate.insertTask(task:
            Task(
                name: nameTaskTF.text!,
                description: descriptionTaskTF.text ?? "",
                estimateDate: NSDate() as Date,
                status: Status.undone,
                importantStatus: statusImportant)
        )
    }
    
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
