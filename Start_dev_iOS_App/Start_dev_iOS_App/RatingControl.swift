
//
//  RatingControl.swift
//  Start_dev_iOS_App
//
//  Created by 中川万莉奈 on 2017/12/29.
//  Copyright © 2017年 中川万莉奈. All rights reserved.
//

import UIKit

class RatingControl: UIStackView {
    //MARK: Propaties
    private var ratingButtons = [UIButton]()
  var rating = 0 {
    didSet {
      updateButtonSelectionSatates()
    }
  }

    @IBInspectable  var starSize: CGSize = CGSize(width:44.0, height: 44.0) {
        didSet {
            setupButtons()
        }
    }
    @IBInspectable  var starCount: Int = 5 {
        didSet {
            setupButtons()
        }
    }

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

        // clear any existing buttons
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
      
      //load button image
      let bundle = Bundle(for: type(of: self))
      let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
      let emptyStar = UIImage(named: "emptyStar", in: bundle, compatibleWith: self.traitCollection)
      let highlightedStar = UIImage(named: "highlightedStar", in: bundle, compatibleWith: self.traitCollection)
      
        for _ in 0 ..< starCount {
            //create Button
            let button = UIButton()
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightedStar, for: .highlighted)
            //
            button.setImage(highlightedStar, for: [.highlighted, .selected])

            // Add constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
          
            //set the accessibilty label
            button.accessibilityLabel = "Set \(index) star rating"

            //set up button action
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)

            // Add the button to the stack
            addArrangedSubview(button)

            // Add the new button to the rating button array
            ratingButtons.append(button)
        }
      updateButtonSelectionSatates()
    }

    //MARK: Button Action
    @objc func ratingButtonTapped(button: UIButton) {
      //選択されたボタンを見つけて番号を返す関数index(of:)
      guard let index = ratingButtons.index(of: button) else {
          fatalError("The button, \(button), is not in the ratingButtons array: \(ratingButtons)")
      }
      // Calculate the rating of the selected button
      let selectRating = index + 1
      if selectRating == rating {
        // If the selected star represents the current rating, reset the rating to 0.
        self.rating = 0
      } else {
        // Otherwise set the rating to the selected star
        self.rating = selectRating
      }
    }
  
    //MARK: Button Action
  private func updateButtonSelectionSatates() {
    for (index, button) in ratingButtons.enumerated() {
      // If the index of a button is less than the rating, that button should be selected.
      button.isSelected = index < self.rating
      
      //  set the hint string for the currently selected star
      let hintString: String?
      
      if rating == index + 1 {
        hintString = "Tap to reset the rating to zero."
      } else {
        hintString = nil
      }
      
      // Calculate the value string
      let valueString: String
      switch (rating) {
      case 0:
        valueString = "No rating set."
      case 1:
        valueString = "1 star set."
      default:
        valueString = "\(rating) stars set"
        
      }
      
      //assign the hint stirng and value string
      button.accessibilityHint = hintString
      button.accessibilityValue = valueString
      
    }
  }
}
