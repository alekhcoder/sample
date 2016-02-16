//
//  ItemListTable.swift
//  Sample
//
//  Created by Alekh on 07/02/16.
//  Copyright © 2016 Alekh. All rights reserved.
//

///This class behaves as datasource and delegate for list table

import Foundation
import UIKit

class ItemListObject : NSObject, UITableViewDelegate, UITableViewDataSource {
  
  ///
  ///Data Array Object
  var arrayDataList: JSON?
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    var cell: UITableViewCell?
    let productObject = arrayDataList?[indexPath.section]
    print(productObject)
    print(productObject?[JSONKeys.template.rawValue].stringValue)
    let templateS = ProductTypes(rawValue:(productObject?[JSONKeys.template.rawValue].stringValue) ?? "") ?? ProductTypes.ProductTypeOne
    
    switch (templateS) {
    case .ProductTypeOne : cell = tableView.dequeueReusableCellWithIdentifier("ProductTemplateOnereuse") as? ProductTemplateOne
      (cell as? ProductTemplateOne)?.renderModelForCell(model: productObject!)
    case .ProductTypeTwo : cell = tableView.dequeueReusableCellWithIdentifier("ProductTemplateTworeuse") as? ProductTemplateTwo
    (cell as? ProductTemplateTwo)?.renderModelForCell(model: productObject!)
    case .ProductTypeThree : cell = tableView.dequeueReusableCellWithIdentifier("ProductTemplateThreereuse") as? ProductTemplateThree
    (cell as? ProductTemplateThree)?.renderModelForCell(model: productObject!)
      
    }
    
    return cell!
  }
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return 1
  }
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    
    return arrayDataList?.count ?? 0
  }

  
}