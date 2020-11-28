//
//  ViewController.swift
//  TableView_Collapsed
//
//  Created by IOS-Sagar on 17/01/20.
//  Copyright © 2020 IOS-Sagar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tblViewOutlet: UITableView!
    var arrModel:[[Model]] = []
    var selectedIndex:Int = -1
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tblViewOutlet.estimatedRowHeight = 44.0
        tblViewOutlet.rowHeight = UITableView.automaticDimension
        tblViewOutlet.tableHeaderView?.isUserInteractionEnabled = true


        setData()
    }

//MARK: function set data in array
    func setData()
    {
//        let obj11 = Model(section: "section1",names: ["name1","name1","name1","name1","name1"])
//        let obj12 = Model(section: "section2",names: ["name2","name2","name2","name2","name2"])
//        let obj13 = Model(section: "section3",names: ["name3","name3","name3","name3","name3"])
//        let obj14 = Model(section: "section4",names: ["name4","name4","name4","name4","name4"])
//
//        let arr1 = [obj11,obj12,obj13,obj14]
//
//        let obj21 = Model(section: "section2",names: ["name1","name1","name2","name3","name4"])
//        let obj22 = Model(section: "section2",names: ["name1","name1","name2","name3","name4"])
//        let obj23 = Model(section: "section2",names: ["name1","name1","name2","name3","name4"])
//        let obj24 = Model(section: "section2",names: ["name1","name1","name2","name3","name4"])
//
//        let arr2 = [obj21,obj22,obj23,obj24]
//
//        let obj31 = Model(section: "section3",names: ["name1","name1","name2","name3","name4"])
//        let obj32 = Model(section: "section3",names: ["name1","name1","name2","name3","name4"])
//        let obj33 = Model(section: "section3",names: ["name1","name1","name2","name3","name4"])
//        let obj34 = Model(section: "section3",names: ["name1","name1","name2","name3","name4"])
//
//        let arr3 = [obj31,obj32,obj33,obj34]
//
//        let obj41 = Model(section: "section4",names: ["name1","name1","name2","name3","name4"])
//        let obj42 = Model(section: "section4",names: ["name1","name1","name2","name3","name4"])
//        let obj43 = Model(section: "section4",names: ["name1","name1","name2","name3","name4"])
//        let obj44 = Model(section: "section4",names: ["name1","name1","name2","name3","name4"])
//
//        let arr4 = [obj41,obj42,obj43,obj44]
//
//       arrModel = arr1
        
        let obj11 = Model(name:"name1",section: "section1")
        let obj12 = Model(name:"name1",section: "section2")
        let obj13 = Model(name:"name1",section: "section3")
        let obj14 = Model(name:"name1",section: "section4")
        
        let arr1 = [obj11,obj12,obj13,obj14]
        
        let obj21 = Model(name:"name2",section: "section2")
        let obj22 = Model(name:"name2",section: "section2")
        
        
        let arr2 = [obj21,obj22]
        
        let obj31 = Model(name:"name3",section: "section3")
        let obj32 = Model(name:"name3",section: "section3")
        let obj33 = Model(name:"name3",section: "section3")
    
        
        let arr3 = [obj31,obj32,obj33]
        
        let obj41 = Model(name:"name4",section: "section4")
        let obj42 = Model(name:"name4",section: "section4")
        let obj43 = Model(name:"name4",section: "section4")
        let obj44 = Model(name:"name4",section: "section4")
        
        let arr4 = [obj41,obj42,obj43,obj44]
        
        arrModel.append(contentsOf: [arr1,arr2,arr3,arr4])
        tblViewOutlet.reloadData()

          let tapGest = UITapGestureRecognizer(target: self, action: #selector(ViewController.isSectionSelect(_:)))
        tblViewOutlet.tableHeaderView?.addGestureRecognizer(tapGest)
        tblViewOutlet.reloadData()
    }
    
    
    //MARK: Tap gesture table section
    
    @objc func isSectionSelect(_ sender:UITapGestureRecognizer)
    {
        print("tap gesture -= -= - ")
    }
    
}

extension ViewController : UITableViewDataSource,UITableViewDelegate
{
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tblViewOutlet.dequeueReusableCell(withIdentifier: "cell") as! TableCell
        cell.arrModel = arrModel[indexPath.row]
        if self.selectedIndex == indexPath.row
        {
            if cell.tableViewChild.isHidden == true
            {
                cell.tableViewChild.isHidden = false
                
            }
            else
            {
                cell.tableViewChild.isHidden = true
            }
            
        }
        cell.tableViewChild.reloadData()
        cell.lblTitleSection.text = "section title"
        return cell
    }
    


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        self.selectedIndex = indexPath.row
        self.tblViewOutlet.reloadData()
    }
    
    
}
