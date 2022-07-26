//
//  MoreWebViewVC.swift
//  Test
//
//  Created by Michael Nelson on 25/07/2022.
//

import UIKit
import WebKit

enum Selection {
    case aboutUs
    case termsAndConditions
    case privacyPolicy
    case contactUs

}

class MoreWebViewVC: UIViewController {

    @IBOutlet weak var webView:WKWebView!
    
    @IBOutlet weak var header: UILabel!
    
    var selectedOption: Selection?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        guard let selectedOption = selectedOption else {
            return
        }
     
        verifySelectionAndOpenRequiredWebView(from: selectedOption)
    }

    func verifySelectionAndOpenRequiredWebView(from selection: Selection) {
        
        
       let aboutUsURL = URL(string: "https://www.gettriptup.com/aboutus")!
        let termsAndConditionsURL = URL(string: "https://www.gettriptup.com/terms")!
        let privacyPolicyURL = URL(string: "https://www.gettriptup.com/privacypolicy")!
        
        var urlRequest = URLRequest(url: URL(string: "www.placeholder.com")!)
        
        switch selection {
            
        case .aboutUs:
             urlRequest = URLRequest(url: aboutUsURL)
            header.text = "About Us"
           
        case .termsAndConditions:
           
             urlRequest = URLRequest(url: termsAndConditionsURL)
            
            header.text = "Terms and Conditions"
            
        case .privacyPolicy:
             urlRequest = URLRequest(url: privacyPolicyURL)
            
            header.text = "Privacy Policy"
            
        default:
            return
        }
        
        webView.load(urlRequest)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func backBtnTapped(_ sender: Any) {
       dismiss(animated: true, completion: nil)
    }
}
