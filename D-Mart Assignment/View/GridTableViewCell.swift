//
//  GridTableViewCell.swift
//  D-Mart Assignment
//
//  Created by Monish Chaudhari on 12/12/21.
//

import UIKit

class GridTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    //MARK:- IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK:- Local Variables
    var dataObject = GridCellModel() {
        didSet {
            
        }
    }
    
    //MARK:- Life Cycle Methodes
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    //MARK:- IBActions
    
    //MARK:- Other Methodes
    
    //MARK:- Delegates
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataObject.gridItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridItemCollectionViewCell", for: indexPath) as! GridItemCollectionViewCell
        cell.dataObject = dataObject.gridItems[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width / CGFloat(dataObject.columnCount ?? 0)
        let const = 10.0
        return CGSize(width: width - const, height: width - const)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout
                        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
}
