//
//  ViewController.swift
//  Sample
//
//  Created by Alekh on 07/02/16.
//  Copyright © 2016 Alekh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  ///Outlets
  ///
  @IBOutlet var      listDataObject: ItemListObject!
  @IBOutlet weak var tableViewList: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    listDataObject.arrayDataList =  loadJSONFile(name: "f_one")
    tableViewList.reloadData()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  
  //MARK: Loading Files
  
  ///It load files given as input
  ///
  func loadJSONFile(name fileName:String)-> JSON?{
    
    guard let path = NSBundle.mainBundle().pathForResource(fileName, ofType: "json") else {
      return nil
    }
    do {
      let content = try String(contentsOfFile:path, encoding: NSUTF8StringEncoding)
      return JSON(data:content.dataUsingEncoding(NSUTF8StringEncoding)!)
    } catch _ as NSError {
      return nil
    }
  }
}

