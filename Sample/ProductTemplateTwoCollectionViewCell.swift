//
//  ProductTemplateTwoCollectionViewCell.swift
//  Sample
//
//  Created by Alekh on 07/02/16.
//  Copyright © 2016 Alekh. All rights reserved.
//

import Foundation

class ProductTemplateTwoCollectionViewCell: UICollectionViewCell {
  
  //MARK: Outlets
  @IBOutlet weak var imageViewAdver: UIImageView!
  @IBOutlet weak var labelHeading: UILabel!
  
  ///Method to render the Data Model to eCell
  ///
  func renderModelForCell(model dataModel: JSON?){
    
    guard let _ = dataModel else {return}
    print(dataModel)
    let imageUrl              =  (dataModel![JSONKeys.image.rawValue]).stringValue
    let trimmedString = imageUrl.stringByReplacingOccurrencesOfString(" ", withString: "")
    print(trimmedString)
    let imageHeading          =  (dataModel![JSONKeys.label.rawValue]).stringValue
    imageViewAdver.sd_setImageWithURL(NSURL(string: trimmedString))
    guard let _ = labelHeading else {return}
    labelHeading.text = imageHeading
  }
  
}
