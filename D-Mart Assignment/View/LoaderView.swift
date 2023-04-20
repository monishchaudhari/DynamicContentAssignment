//
//  LoaderView.swift
//  D-Mart Assignment
//
//  Created by Monish Chaudhari on 14/12/21.
//

import UIKit

class LoaderView: UIView {
    
    //MARK:- IBOutlets
    @IBOutlet weak var conatainerView: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //MARK:- Local Variables
    
    //MARK:- Life Cycle Methodes
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //MARK:- IBActions
    
    //MARK:- Other Methodes
    func remove(){
        DispatchQueue.main.async {
            self.removeFromSuperview()
        }
    }
    
    //MARK:- Delegates
    
}
