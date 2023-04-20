//
//  GridItemCollectionViewCell.swift
//  D-Mart Assignment
//
//  Created by Monish Chaudhari on 14/12/21.
//

import UIKit
import Kingfisher

class GridItemCollectionViewCell: UICollectionViewCell {
    
    //MARK:- IBOutlets
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var productNameLbl: UILabel!
    
    //MARK:- Local Variables
    var dataObject = GridItemModel() {
        didSet {
            self.productNameLbl.text = dataObject.productName ?? ""
             
            if let url = URL(string: dataObject.productURL ?? "") {
                self.imgView?.kf.setImage(with: url)
            }
        }
    }
    
    //MARK:- Life Cycle Methodes
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    //MARK:- IBActions
    
    //MARK:- Other Methodes
    
    //MARK:- Delegates
    
}
