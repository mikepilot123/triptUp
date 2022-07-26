//
//  ViewController.swift
//  Test
//
//  Created by Michael Nelson on 23/07/2022.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    @IBOutlet weak var signInOrUpBGView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        signInOrUpBGView.layer.cornerRadius = 10
        
    }

    @IBAction func guestAccountBtnTapped(_ sender: UIButton) {
    
        Auth.auth().signInAnonymously { authResult, error in
            
            if let anonymousUserAccount = authResult?.user {
                
                sender.isEnabled = true
                self.performSegue(withIdentifier: "signInSegue", sender: nil)
            }
            else if let error = error {
                print(error.localizedDescription)
            }
        }
   
    }
    @IBAction func phoneNumberBtnTapped(_ sender: Any) {
        
        
        performSegue(withIdentifier: "phoneNumberVCSegueID", sender: nil)
    }
    
    @IBAction func unwindToLandingScreen(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
    }
}

