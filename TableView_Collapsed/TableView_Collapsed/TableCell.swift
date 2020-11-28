//
//  TableCell.swift
//  TableView_Collapsed
//
//  Created by IOS-Sagar on 17/01/20.
//  Copyright © 2020 IOS-Sagar. All rights reserved.
//

import UIKit

class TableCell: UITableViewCell {

    @IBOutlet weak var lblTitleSection: UILabel!
    @IBOutlet weak var hightInnerTable: NSLayoutConstraint!
    var arrModel:[Model]?
    @IBOutlet weak var tableViewChild: UITableView!
    @IBOutlet weak var lblTItle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
     self.tableViewChild.isHidden = true
        DispatchQueue.main.async {
            self.tableViewChild.reloadData()
        }
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        tableViewChild.dataSource = self
        tableViewChild.delegate = self
    }
    
    
}


extension TableCell : UITableViewDataSource,UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // self.hightInnerTable.constant = self.tableViewChild.contentSize.height
        self.hightInnerTable.constant = CGFloat(self.arrModel?.count ?? 0) * 47
        return arrModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewChild.dequeueReusableCell(withIdentifier: "cell2") as! TableCell2
        cell.lblTitle.text = arrModel?[indexPath.row].titleName
        return cell
    }
    
    
}
