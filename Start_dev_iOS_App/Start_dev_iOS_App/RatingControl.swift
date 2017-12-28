
//
//  RatingControl.swift
//  Start_dev_iOS_App
//
//  Created by 中川万莉奈 on 2017/12/29.
//  Copyright © 2017年 中川万莉奈. All rights reserved.
//

import UIKit

class RatingControl: UIStackView {

    //MARK: Initialization
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init(coder: NSCoder) {
    super.init(coder: coder)
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: Private Methods
  private func setupButtons() {
    //create Button
    let button = UIButton()
    button.backgroundColor = .red
  }
  
  // Add constraints
  
}
