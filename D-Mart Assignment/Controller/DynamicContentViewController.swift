//
//  DynamicContentViewController.swift
//  D-Mart Assignment
//
//  Created by Monish Chaudhari on 12/12/21.
//

import UIKit
import Kingfisher

class DynamicContentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ReloadCellDelegate {
    
    //MARK:- IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK:- Local Variables
    var dataSourceArray = [AnyObject]()
    
    //MARK:- Life Cycle Methodes
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        getDataOfDynamicTable()
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
        print("DynamicContentViewController deinit called")
    }
    
    //MARK:- IBActions
    
    //MARK:- Other Methodes
    
    ///This function will create data source array using local JSON
    func getDataOfDynamicTable() {
        
        let loaderView: LoaderView = Bundle.main.loadNibNamed("LoaderView", owner: self, options: nil)![0] as! LoaderView
        loaderView.frame = self.view.bounds
        loaderView.messageLabel.text = "Loading..."
        view.addSubview(loaderView)
        
        if let jsonArr = getJSONDataObjFromLocalJSONFile(fileName: "Response") {
            for obj in jsonArr {
                do {
                    let json = try JSONSerialization.data(withJSONObject: obj)
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .useDefaultKeys
                    if let productCell = try? decoder.decode(ProductCellModel.self, from: json) {
                        self.dataSourceArray.append(productCell)
                    } else if let gridCell = try? decoder.decode(GridCellModel.self, from: json) {
                        self.dataSourceArray.append(gridCell)
                    } else if let bannerCell = try? decoder.decode(BannerCellModel.self, from: json) {
                        self.dataSourceArray.append(bannerCell)
                    }
                } catch {
                    self.showAlert("", alert_message: "Could not parse response.")
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
                self.tableView.reloadData()
                loaderView.remove()
            })
        }
    }
    
    ///This function will parse local JSON file and return object array
    func getJSONDataObjFromLocalJSONFile(fileName:String, ext:String = "json") -> NSArray? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: ext) {
            let data = try! Data(contentsOf: url)
            let JSON = try! JSONSerialization.jsonObject(with: data, options: [])
            if let jsonDict = JSON as? [String: AnyObject], let jsonArr = jsonDict["Data"] as? NSArray {
                return jsonArr
            }
        }
        return nil
    }
    
    //MARK:- Delegates
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourceArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if let data = dataSourceArray[indexPath.row] as? GridCellModel {
            return (tableView.frame.size.width/CGFloat(data.rowCount ?? 0) + CGFloat((data.rowCount ?? 0) * 30))
        } else {
            return tableView.rowHeight
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let data = dataSourceArray[indexPath.row] as? BannerCellModel {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "BannerTableViewCell", for: indexPath) as! BannerTableViewCell
            cell.imgView.tag = indexPath.row
            cell.reloadDelegate = self
            cell.dataObject = data
            return cell
            
        } else if let data = dataSourceArray[indexPath.row] as? ProductCellModel {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as! ProductTableViewCell
            cell.dataObject = data
            return cell
            
        } else if let data = dataSourceArray[indexPath.row] as? GridCellModel {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "GridTableViewCell", for: indexPath) as! GridTableViewCell
            cell.dataObject = data
            return cell
            
        } else {
            return tableView.dequeueReusableCell(withIdentifier: "BannerTableViewCell", for: indexPath) as! BannerTableViewCell
        }
    }
    
    func reloadRowAt(indexPathRow row: Int) {
        DispatchQueue.main.async {
            self.tableView?.beginUpdates()
            self.tableView.reloadRows(at: [IndexPath(row: row, section: 0)], with: .automatic)
            self.tableView?.endUpdates()
        }
    }
}
