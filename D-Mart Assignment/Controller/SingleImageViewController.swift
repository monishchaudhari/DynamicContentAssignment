//
//  SingleImageViewController.swift
//  D-Mart Assignment
//
//  Created by Monish Chaudhari on 12/12/21.
//

import UIKit
import Kingfisher

class SingleImageViewController: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imgViewHeight: NSLayoutConstraint!
    
    //MARK:- Local Variables
    
    
    //MARK:- Life Cycle Methodes
    override func viewDidLoad() {
        super.viewDidLoad()
        /* Image with more height: https://media.idownloadblog.com/wp-content/uploads/2018/08/iPhone-XS-marketing-wallpaper.jpg
         
         Image with low height: https://img.dmart.in/images/rwd/banners/hmpg/1dec21-carousel-ds.jpg
         */
        
        let loaderView: LoaderView = Bundle.main.loadNibNamed("LoaderView", owner: self, options: nil)![0] as! LoaderView
        loaderView.frame = self.view.bounds
        loaderView.messageLabel.text = "Downloading Image..."
        view.addSubview(loaderView)
        
        if let url = URL(string: "https://media.idownloadblog.com/wp-content/uploads/2018/08/iPhone-XS-marketing-wallpaper.jpg") {
            self.imageView.kf.setImage(with: url, placeholder: nil, options: [.forceRefresh], completionHandler: { result in
                switch result {
                    
                case .success(let val):
                    let img = val.image
                    DispatchQueue.main.async {
                        //Calculating image height to reset container height
                        let ratio = img.size.width / img.size.height
                        let newHeight = self.imageView.frame.width / ratio
                        self.imgViewHeight.constant = newHeight
                        self.imageView.image = img
                        self.view.layoutIfNeeded()
                    }
                    loaderView.remove()
                    break
                    
                case .failure(let err):
                    loaderView.remove()
                    break
                }
                
            })
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    deinit {
        print("SingleImageViewController deinit called")
    }
    
    //MARK:- IBActions
    
    
    //MARK:- Other Methodes
   
    
    //MARK:- Delegates
    
    
}
