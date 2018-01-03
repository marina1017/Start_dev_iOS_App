//
//  MealTableViewCell.swift
//  Start_dev_iOS_App
//
//  Created by 中川万莉奈 on 2018/01/03.
//  Copyright © 2018年 中川万莉奈. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {
  //MARK: Properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoImgeView: UIImageView!
    @IBOutlet weak var ratingControl: UIStackView!
  
    var meals = [Meal]()
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
