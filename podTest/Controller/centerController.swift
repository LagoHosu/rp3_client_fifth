//
//  centerController.swift
//  podTest
//
//  Created by Lago on 2021/08/10.
//

import UIKit

class centerController : UITableViewController, cellDelegate {
    func didPressButton(_ tag: Int) {
        print("hello")
    }
    
    
    //MARK: - Properties
    
    @IBOutlet weak var table : UITableView!
    
    //var delegate: createController?
    
    var nameData = [] as Array
    var addressData = [] as Array
    var phoneData = [] as Array
    
    
    
    //MARK: - Actions
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell

            
//        var currentCellWeather = dataList[indexPath.row]
        cell.centerName.text = nameData[indexPath.row] as? String
        cell.address.text = addressData[indexPath.row] as? String
        cell.phoneNumber.text = phoneData[indexPath.row] as? String
        
        cell.cellDelegate = self
     

        return cell
     }
    
    
//    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 95
//    }
    
    
    //MARK: - Life cycle
    
    
    //MARK: - Helper
    

    override func viewDidLoad() {
        //print("center view appeared")
        
        tableView.delegate = self
        tableView.dataSource = self
      
        let nibName = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "TableViewCell")
        
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 95

    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("center view appeared")

    }
}
