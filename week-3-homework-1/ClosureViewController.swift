//
//  ClosureViewController.swift
//  week-3-homework-1
//
//  Created by kamilcal on 21.12.2022.
//

import UIKit

class ClosureViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    
    
    var closureDataBack: ((String, String) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        usernameTextField.delegate = self
        nameTextField.becomeFirstResponder()
    }
    
    @IBAction func sendDatabutton(_ sender: UIButton) {
        var sendNameText = ""
        var sendUsernameText = ""
        
        if nameTextField.text == "" || nameTextField.text == nil{
            sendNameText = "No Name Entered"
        } else {
            sendNameText = nameTextField.text!
        }
        if usernameTextField.text == "" || usernameTextField.text == nil{
            sendUsernameText = "No Surname Entered"
        } else {
            sendUsernameText = usernameTextField.text!
        }
        
        closureDataBack!(sendNameText, sendUsernameText)
        dismiss(animated: true)
    }
    
}

//MARK: -UITextFieldDelegate
    
extension ClosureViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTextField {
            usernameTextField.becomeFirstResponder()
        }
        else if textField == usernameTextField {
            self.sendDatabutton(UIButton())
        }
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

    
