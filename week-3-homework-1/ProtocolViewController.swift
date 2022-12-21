//
//  ProtocolViewController.swift
//  week-3-homework-1
//
//  Created by kamilcal on 21.12.2022.
//

import UIKit

protocol SendDataProtocol{
    func sendDataToViewController(data: String)
}

class ProtocolViewController: UIViewController {
    
    var delegate: SendDataProtocol?
    
    @IBOutlet weak var textLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func sendDataButton(_ sender: UIButton) {
        
        if self.delegate != nil {
            var sendText = ""
            if textLabel.text == "" || textLabel.text == nil{
                sendText = "Back To Protocol"
            } else {
                sendText = textLabel.text!
            }
            self.delegate?.sendDataToViewController(data: sendText)
            dismiss(animated: true)
        }
    }
}
