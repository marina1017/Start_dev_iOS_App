
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
    setupButtons()
  }
  
  required init(coder: NSCoder) {
    super.init(coder: coder)
    setupButtons()
  }
  
  //MARK: Private Methods
  private func setupButtons() {
    //create Button
    let button = UIButton()
    button.backgroundColor = .red

    // Add constraints
    button.translatesAutoresizingMaskIntoConstraints = false
    button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
    button.widthAnchor.constraint(equalToConstant: 44.0).isActive = true

    // Add the button to the stack
    addArrangedSubview(button)

    //set up button action
    button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)

  }

    //MARK: Button Action
    @objc func ratingButtonTapped(button: UIButton) {
        print("押されました")
    }



  


}
