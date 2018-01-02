//
//  ViewController.swift
//  Start_dev_iOS_App
//
//  Created by 中川万莉奈 on 2017/12/09.
//  Copyright © 2017年 中川万莉奈. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  //MARK:テキストフィールド

  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var mealNameLabel: UILabel!
  @IBOutlet weak var photoImageView: UIImageView!
  @IBOutlet weak var ratingControl: RatingControl!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    nameTextField.delegate = self

  }
  
  func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason){
    mealNameLabel.text = textField.text
  }
  
  //MARK: UITextFieldDelegate
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    //レスポンダステータスを終了させる関数:キーボードを隠す
    textField.resignFirstResponder()
    return true
  }
  
  @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
    // Hide the keyboard.
    nameTextField.resignFirstResponder()
    
    // UIImagePickerController is a view controller that lets a user pick media from their photo library.
    let imagePickerController = UIImagePickerController()
    
    // Only allow photos to be picked, not taken.
    imagePickerController.sourceType = .photoLibrary
    
    // Make sure ViewController is notified when the user picks an image.
    imagePickerController.delegate = self
    present(imagePickerController, animated: true, completion: nil)
  }
  
  
  //MARK: UIImagePickerControllerDelegate
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
    // Dismiss the picker if the user canceled.
    dismiss(animated: true, completion: nil)
  }
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
    guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
      fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
    }
    photoImageView.image = selectedImage
    dismiss(animated: true, completion: nil)
  }
  
  
  
}

