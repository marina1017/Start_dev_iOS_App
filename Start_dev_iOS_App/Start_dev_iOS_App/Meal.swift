//
//  Meal.swift
//  Start_dev_iOS_App
//
//  Created by 中川万莉奈 on 2018/01/02.
//  Copyright © 2018年 中川万莉奈. All rights reserved.
//

import Foundation
import UIKit

class Meal {
  //MARK: Properties
  var name: String
  var photo: UIImage?
  var rating: Int
  
  //MARK: Initialization
  init?(name: String, photo: UIImage?, rating: Int) {
    //Initialization should fail if there is no name or if the rating is negative
    if name.isEmpty {
      return nil
    }
    
    //The rating must be between 0 and 5 inclusively
    guard (rating >= 0) && (rating <= 5) else {
      return nil
    }
    
    //Initialize stored properties
    self.name = name
    self.photo = photo
    self.rating = rating
  }
}



