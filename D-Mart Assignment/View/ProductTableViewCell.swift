//
//  ProductTableViewCell.swift
//  D-Mart Assignment
//
//  Created by Monish Chaudhari on 12/12/21.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    //MARK:- IBOutlets
    @IBOutlet weak var addToListBtn: UIButton!
    @IBOutlet weak var selectQuantityBtn: UIButton!
    @IBOutlet weak var addToCartBtn: UIButton!
    
    @IBOutlet weak var productNameLbl: UILabel!
    @IBOutlet weak var mrpBGView: UIView!
    @IBOutlet weak var mrpStrikeThroughLineView: UIView!
    @IBOutlet weak var mrpLbl: UILabel!
    @IBOutlet weak var dmartPriceLbl: UILabel!
    @IBOutlet weak var saveLbl: UILabel!
    
    @IBOutlet weak var productImgView: UIImageView!
    @IBOutlet weak var vegNonVegIndicatorImgView: UIImageView!
    
    //MARK:- Local Variables
    var dataObject = ProductCellModel() {
        didSet {
            //            self.addToListBtn
            //            self.addToCartBtn
            self.productNameLbl.text = dataObject.name ?? "No Name Available"
            
            if dataObject.availableQuantity.count > 0 {
                var quantityData = ProductQuantityModel()
                if let selectedQt = dataObject.availableQuantity.first(where: {$0.isSelected ?? false}) {
                    quantityData = selectedQt
                } else {
                    quantityData = dataObject.availableQuantity.first!
                }
                
                self.selectQuantityBtn.setTitle(quantityData.description, for: UIControl.State())
                self.mrpLbl.text = "MRP ₹" + String(format: "%.2f", (quantityData.mrp ?? 0.0))
                if let dmrtPrice = quantityData.dmartPrice, dmrtPrice != 0.0 {
                    self.dmartPriceLbl.isHidden = false
                    self.saveLbl.isHidden = false
                    self.mrpStrikeThroughLineView.isHidden = false
                    self.dmartPriceLbl.text = "DMart ₹" + String(format: "%.2f", dmrtPrice)
                    let savings = (quantityData.mrp ?? 0.0) - dmrtPrice
                    self.saveLbl.text = "Save ₹" + String(format: "%.2f", savings)
                } else {
                    self.dmartPriceLbl.isHidden = true
                    self.saveLbl.isHidden = true
                    self.mrpStrikeThroughLineView.isHidden = true
                }
            } else {
                self.dmartPriceLbl.isHidden = true
                self.saveLbl.isHidden = true
                self.mrpStrikeThroughLineView.isHidden = true
            }
            if let url = URL(string: dataObject.imageURL ?? "") {
                self.productImgView?.kf.setImage(with: url)
            }
            if dataObject.shouldShowVegIcon ?? false {
                self.vegNonVegIndicatorImgView.isHidden = false
                self.vegNonVegIndicatorImgView.isHighlighted = false
            } else if dataObject.shouldShowNonVegIcon ?? false {
                self.vegNonVegIndicatorImgView.isHidden = false
                self.vegNonVegIndicatorImgView.isHighlighted = true
            } else {
                self.vegNonVegIndicatorImgView.isHidden = true
            }
        }
    }
    
    //MARK:- Life Cycle Methodes
    override func awakeFromNib() {
        super.awakeFromNib()
        
        addToListBtn.layer.cornerRadius = 5.0
        selectQuantityBtn.layer.cornerRadius = 5.0
        addToCartBtn.layer.cornerRadius = 5.0
        
        selectQuantityBtn.layer.borderWidth = 1.0
        selectQuantityBtn.layer.borderColor = UIColor(red: 42/255, green: 162/255, blue: 75/255, alpha: 1.0).cgColor
    }
    
    //MARK:- IBActions
    
    //MARK:- Other Methodes
    
    //MARK:- Delegates
    
}
