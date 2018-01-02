//
//  Start_dev_iOS_AppTests.swift
//  Start_dev_iOS_AppTests
//
//  Created by 中川万莉奈 on 2018/01/02.
//  Copyright © 2018年 中川万莉奈. All rights reserved.
//

import XCTest
@testable import Start_dev_iOS_App

class Start_dev_iOS_AppTests: XCTestCase {
  
  //MARK: Meal Class Tests
  //Confirm that the Meal initializer returns a Meal object when passed valid parameters
  func testmealInitializationSucceeds() {
    
    // Zero raating
    let zeroRatingMeal = Meal.init(name: "Zero", photo: nil, rating: 0)
    XCTAssertNotNil(zeroRatingMeal)
    
    //Hightest positive rating
    let positiveRatingMeal = Meal.init(name: "positive", photo: nil, rating: 5)
    XCTAssertNotNil(positiveRatingMeal)
  }
  
  func testMealInitializationFails() {
    //Negative rating
    let negativeRatingMeal = Meal.init(name: "Negative", photo: nil, rating: -1)
    XCTAssertNil(negativeRatingMeal)
    
    //Empty String
    let emptyStringMeal = Meal.init(name: "", photo: nil, rating: 0)
    XCTAssertNil(emptyStringMeal)
    
    //Rating exceed maximum
    let largeRatingMeal = Meal.init(name:"Large", photo: nil, rating: 6)
    XCTAssertNil(largeRatingMeal)
  }
    
}
