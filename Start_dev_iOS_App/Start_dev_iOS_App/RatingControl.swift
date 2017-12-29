
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
    var rating = 0

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

        for _ in 0 ..< starCount {
            //create Button
            let button = UIButton()
            button.backgroundColor = .red

            // Add constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true

            //set up button action
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)

            // Add the button to the stack
            addArrangedSubview(button)

            // Add the new button to the rating button array
            ratingButtons.append(button)
        }
    }

    //MARK: Button Action
    @objc func ratingButtonTapped(button: UIButton) {
        print("押されました")
    }
}
