//
//  MenuViewController.swift
//  Test
//
//  Created by Michael Nelson on 25/07/2022.
//

import UIKit
import FirebaseAuth

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var menuTableView: UITableView!
    
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var menuBGView: UIView!
    @IBOutlet weak var drawerCapsule: UIView!
    
    let menuItems = ["About Us", "Contact Us", "Terms and Conditions", "Privacy Policy"]
    var selectedOption : Selection = .aboutUs
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        menuTableView.dataSource = self
        menuTableView.delegate = self
        signUpBtn.layer.cornerRadius = 8
        menuBGView.layer.cornerRadius = 8
        drawerCapsule.layer.cornerRadius = 2
    }
    
    @IBAction func closeBtnTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signOutUser(_ sender: Any) {
       
        do {
            try Auth.auth().signOut()
            
        } catch let error {
            print(error.localizedDescription)
        }
       
        
    }
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "menuCellId", for: indexPath) as? MenuTableViewCell {
            
            cell.setUpView(with: menuItems[indexPath.row])
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let selectedIndexPathRow = tableView.indexPathForSelectedRow {
            
            switch selectedIndexPathRow.row {
            case 0:
                selectedOption = .aboutUs
                
            case 1:
                selectedOption = .contactUs
                
            case 2: selectedOption = .termsAndConditions
                
            case 3: selectedOption = .privacyPolicy
                
            default:
                return
            }
        }
        
        performSegue(withIdentifier: "webViewSegueID", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let moreWebViewVC = segue.destination as? MoreWebViewVC {
            
            moreWebViewVC.selectedOption = selectedOption
        }
    }

}
