//
//  DataModel.swift
//  D-Mart Assignment
//
//  Created by Monish Chaudhari on 12/12/21.
//

import Foundation
import UIKit


//Banner - Cell
class BannerCellModel: Codable {
    var cellCategory: String?
    var url: String?
    var didLoaded: Bool?
}

//Product - Cell
class ProductCellModel: Codable {
    var cellCategory: String?
    var name: String?
    var id: String?
    var imageURL: String?
    var shouldShowVegIcon: Bool?
    var shouldShowNonVegIcon: Bool?
    var availableQuantity = [ProductQuantityModel]()
}

class ProductQuantityModel: Codable {
    var description: String?
    var mrp: Double?
    var dmartPrice: Double?
    var isAddedToList: Bool?
    var isAddedToCart: Bool?
    var isSelected: Bool?
}

//Grid - Cell
class GridCellModel: Codable {
    var cellCategory: String?
    var columnCount: Int?
    var rowCount: Int?
    var gridItems = [GridItemModel]()
}

class GridItemModel: Codable {
    var id: String?
    var productName: String?
    var productURL: String?
}
