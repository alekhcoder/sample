//
//  ProductTemplateThree.swift
//  Sample
//
//  Created by Alekh on 10/02/16.
//  Copyright © 2016 Alekh. All rights reserved.
//

import Foundation
import UIKit

class ProductTemplateThree : UITableViewCell,UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  
  ///Outlets
  ///
  @IBOutlet weak var collectionView: UICollectionView!
  
  //Data model
  var dataItemsArray:JSON?
  
  
  ///Method to render the Data Model to TableCell
  ///
  func renderModelForCell(model dataModel: JSON?){
    
    guard let _ = dataModel else {return}
    self.dataItemsArray  =  dataModel!["items"]
    collectionView.reloadData()
  }
  
  //MARK: Data Source and delegates
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    return self.dataItemsArray?.count ?? 0
  }
  
  func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    
    var cell: ProductTemplateTwoCollectionViewCell?
    let productObject = dataItemsArray?[indexPath.item]
    print(dataItemsArray)
    print(productObject)
    cell = collectionView.dequeueReusableCellWithReuseIdentifier("ProductTemplateTwoCollectionViewCellreuse", forIndexPath: indexPath) as? ProductTemplateTwoCollectionViewCell
    cell?.renderModelForCell(model: productObject)
    return cell!
  }
  
  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
    let width = collectionView.bounds.width
    return CGSize(width: width, height:150)
  }
}

