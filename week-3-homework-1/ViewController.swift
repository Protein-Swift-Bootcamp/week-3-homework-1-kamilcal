//
//  ViewController.swift
//  week-3-homework-1
//
//  Created by kamilcal on 21.12.2022.
//

import UIKit

class ViewController: UIViewController, SendDataProtocol {
  
    @IBOutlet weak var label: UILabel!
    
    func sendDataToViewController(data: String) {
        label.text = data
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let notificationCenter: NotificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(notificationBack(myData: )), name: .notVC, object: nil)
    }
    
    @objc func notificationBack(myData: Notification){
        let data = myData.object as? String
        label.text = data
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ProtocolViewController {
            let vc = segue.destination as? ProtocolViewController
            vc?.delegate = self
        }
    }

}
extension Notification.Name {
    static let notVC = Notification.Name(rawValue: "NotVC")
}

