//
//  ViewController.swift
//  week-3-homework-1
//
//  Created by kamilcal on 21.12.2022.
//

import UIKit

class ViewController: UIViewController, SendDataProtocol {
  
    @IBOutlet weak var textField: UILabel!
    
    func sendDataToViewController(data: String) {
        textField.text = data
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ProtocolViewController {
            let vc = segue.destination as? ProtocolViewController
            vc?.delegate = self
        }
    }

}

