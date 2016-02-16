//
//  ProductTemplateOne.swift
//  Sample
//
//  Created by Alekh on 07/02/16.
//  Copyright © 2016 Alekh. All rights reserved.
//

import Foundation
import UIKit

class ProductTemplateOne : UITableViewCell {
  
  ///Outlets
  ///
  @IBOutlet weak var imageViewProduct: UIImageView!
  
  ///Method to render the Data Model to TableCell
  ///
  func renderModelForCell(model dataModel: JSON?){
    
    guard let _ = dataModel else {return}
    //let imageUrl              =  dataModel!["image"].stringValue
    let jsonArrayFirstObject  =  dataModel!["items"]
    let imageUrl              =  (jsonArrayFirstObject[0])[JSONKeys.image.rawValue].stringValue
    //let name                  =  jsonArrayFirstObject?["label"].stringValue
    imageViewProduct.sd_setImageWithURL(NSURL(string:imageUrl))
  }
}
