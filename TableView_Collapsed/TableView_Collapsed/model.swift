//
//  model.swift
//  TableView_Collapsed
//
//  Created by IOS-Sagar on 17/01/20.
//  Copyright © 2020 IOS-Sagar. All rights reserved.
//

import Foundation
class Model
{
    var titleName:String?
    var titleSection:String?
    var names:[String] = []
    init(name:String?,section:String?)
    {
        self.titleName = name
        self.titleSection = section
    }
    
    init(section:String?,names:[String])
    {
        self.titleSection = section
        self.names = names
    }
}
