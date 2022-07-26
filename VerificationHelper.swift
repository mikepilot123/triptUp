//
//  NetworkService.swift
//  Test
//
//  Created by Michael Nelson on 25/07/2022.
//

import Foundation

final class VerificationHelper {
    
    static let instance = VerificationHelper()
    
    var verificationCode: String?
    var verificationID: String = "" {
        
        willSet (newValue) {
            
            NotificationCenter.default.post(name: Notification.Name("verificationCodeReceived"), object: newValue)
        }
    }
}
