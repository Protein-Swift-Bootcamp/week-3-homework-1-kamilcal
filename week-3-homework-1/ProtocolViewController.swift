//
//  ProtocolViewController.swift
//  week-3-homework-1
//
//  Created by kamilcal on 21.12.2022.
//

import UIKit

protocol SendDataProtocol{
    func sendDataToViewController(nameData: String, usernameData: String )
}

class ProtocolViewController: UIViewController {
    
    var delegate: SendDataProtocol?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        usernameTextField.delegate = self
        nameTextField.becomeFirstResponder()
    }
    
    
    @IBAction func sendDataButton(_ sender: UIButton) {
        
        if self.delegate != nil {
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
            
            self.delegate?.sendDataToViewController(nameData: sendNameText, usernameData: sendUsernameText)
            dismiss(animated: true)
            
        }
    }
}
//MARK: -UITextFieldDelegate
    
extension ProtocolViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTextField {
            usernameTextField.becomeFirstResponder()
        }
        else if textField == usernameTextField {
            self.sendDataButton(UIButton())
        }
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

    
    
    

