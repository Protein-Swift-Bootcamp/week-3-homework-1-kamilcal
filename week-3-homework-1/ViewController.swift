//
//  ViewController.swift
//  week-3-homework-1
//
//  Created by kamilcal on 21.12.2022.
//

import UIKit

class ViewController: UIViewController, SendDataProtocol {
   
  
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    
    func sendDataToViewController(nameData: String, usernameData: String) {
        nameLabel.text = nameData
        usernameLabel.text = usernameData
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.layer.masksToBounds = true
        nameLabel.layer.cornerRadius = 20.0
        usernameLabel.layer.masksToBounds = true
        usernameLabel.layer.cornerRadius = 20.0
        
        let notificationCenter: NotificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(notificationNameBack(myNameData: )), name: .notVC, object: nil)
        notificationCenter.addObserver(self, selector: #selector(notificationUsernameBack(myUsernameData: )), name: .not2VC, object: nil)
        
    }
    
    @objc func notificationNameBack(myNameData: Notification){
        let nameData = myNameData.object as? String
        nameLabel.text = nameData
    }
    
    @objc func notificationUsernameBack(myUsernameData: Notification){
        let usernameData = myUsernameData.object as? String
        usernameLabel.text = usernameData
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ProtocolViewController {
            let vc = segue.destination as? ProtocolViewController
            vc?.delegate = self
        }
        else if segue.destination is ClosureViewController{
            let vc = segue.destination as? ClosureViewController
            vc?.closureDataBack = { name, username in
                self.nameLabel.text = name
                self.usernameLabel.text = username
            }
        }
    }

}
extension Notification.Name {
    static let notVC = Notification.Name(rawValue: "NotVC")
    static let not2VC = Notification.Name(rawValue: "Not2VC")
}

