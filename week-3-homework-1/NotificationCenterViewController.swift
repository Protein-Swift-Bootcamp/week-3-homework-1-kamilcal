//
//  NotificationCenterViewController.swift
//  week-3-homework-1
//
//  Created by kamilcal on 21.12.2022.
//

import UIKit

class NotificationCenterViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func sendDataButton(_ sender: UIButton) {
        var sendText = ""
        if textLabel.text == "" || textLabel.text == nil{
            sendText = "Back To Notification Center"
        } else {
            sendText = textLabel.text!
        }
        NotificationCenter.default.post(name: .notVC, object: sendText)
        dismiss(animated: true)
    }
}
