//
//  Extensions.swift
//  D-Mart Assignment
//
//  Created by Monish Chaudhari on 14/12/21.
//

import Foundation
import UIKit

//MARK:- UIViewController Extensions

extension UIViewController {
    
    @objc func showAlert(_ alert_title: String, alert_message:String) {
        let alertController = UIAlertController(title: alert_title, message: alert_message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        DispatchQueue.main.async {
            self.present(alertController, animated:true, completion:nil)
        }
    }
}
