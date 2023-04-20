//
//  BannerTableViewCell.swift
//  D-Mart Assignment
//
//  Created by Monish Chaudhari on 12/12/21.
//

import UIKit
import Kingfisher

protocol ReloadCellDelegate: AnyObject {
    func reloadRowAt(indexPathRow row: Int)
}

class BannerTableViewCell: UITableViewCell {
    
    //MARK:- IBOutlets
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var imgViewHeight: NSLayoutConstraint!
    
    //MARK:- Local Variables
    weak var reloadDelegate:ReloadCellDelegate?
    
    var dataObject = BannerCellModel() {
        didSet {
            if let url = URL(string: dataObject.url ?? "") {
                self.imgView.kf.setImage(with: url, placeholder: nil, options: nil, completionHandler: { result in
                    switch result {
                    case .success(let val):
                        let img = val.image
                        let ratio = img.size.width / img.size.height
                        let newHeight = self.imgView.frame.width / ratio
                        self.imgViewHeight.constant = newHeight
                        self.layoutIfNeeded()
                        print("Cache Type: \(val.cacheType)")
                        if !(self.dataObject.didLoaded ?? false) {
                            self.reloadDelegate?.reloadRowAt(indexPathRow: self.imgView.tag)
                        }
                        self.dataObject.didLoaded = true
                        break
                    case .failure(let err):
                        break
                    }
                    
                })
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
