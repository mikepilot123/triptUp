//
//  PhoneNumberVC.swift
//  Test
//
//  Created by Michael Nelson on 25/07/2022.
//

import UIKit
import FirebaseAuth

class PhoneNumberVC: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var userNameOrFullNameTxtField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var continueBtn: UIButton!
    
    var phoneNumber = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        phoneNumberTextField.delegate = self
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        phoneNumberTextField.becomeFirstResponder()
    }
    
    @IBAction func unwindToPhoneNumberVC(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        print(textField.text)
//        if let count = Int(textField.text) , count >= 10{
//
//            continueBtn.isEnabled = true
//            phoneNumberTextField.addDoneButtonOnKeyboard()
//        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if let text = textField.text {
    
            guard text.count >= 10 else {
                return true
            }
            
                continueBtn.isEnabled = true
               
            }
        print("Test")
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        phoneNumberTextField.becomeFirstResponder()
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func textFieldDidEndEditing(_ textField: UITextField) {
       
        if let text = textField.text {
            phoneNumber = text
        }
        
        print(phoneNumber)
    }
    @IBAction func continueBtnTapped(_ sender: Any) {
     
        guard let phoneNumber = phoneNumberTextField.text else{
            return
        }
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { (verificationCode,error ) in
            
            if let verificationCode = verificationCode {
                print(verificationCode)
                
                VerificationHelper.instance.verificationID = verificationCode
            }
            else if let error = error{
                print(error)
            }
        }
        
        performSegue(withIdentifier: "verificationSegueID", sender: nil)
    }
}
