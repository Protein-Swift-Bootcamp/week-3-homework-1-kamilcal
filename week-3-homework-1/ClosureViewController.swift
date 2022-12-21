//
//  ClosureViewController.swift
//  week-3-homework-1
//
//  Created by kamilcal on 21.12.2022.
//

import UIKit

class ClosureViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UITextField!
    
    var closureDataBack: ((String) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func sendDatabutton(_ sender: UIButton) {
        var sendText = ""
        if textLabel.text == "" || textLabel.text == nil{
            sendText = "Back To Closure"
        } else {
            sendText = textLabel.text!
        }
        closureDataBack?(sendText)
        dismiss(animated: true)
    }
}

