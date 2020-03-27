//
//  ViewController.swift
//  StyleTransfer-iOS-TFlite
//
//  Created by Khurram on 27/03/2020.
//  Copyright © 2020 Example. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
  
private let dispatchQueue = DispatchQueue(label: "StyleTransfer-iOS-TFlite.backgroundQeue")
private let imagePicker = UIImagePickerController()
private var style = Style.style0
  
@IBAction func onSelectPictureButtonTap(_ sender: Any) {
  let controller = UIAlertController(title: "Picture Source", message: "Select picture from", preferredStyle: .actionSheet)
  if UIImagePickerController.isCameraDeviceAvailable(.front)
    || UIImagePickerController.isCameraDeviceAvailable(.rear){
    let cameraAction = UIAlertAction(title: "Camera", style: .default) { _ in
      self.capture(.camera)
    }
    controller.addAction(cameraAction)
  }
  let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default) { _ in
    self.capture(.photoLibrary)
  }
  controller.addAction(photoLibraryAction)
  present(controller, animated: true, completion: nil)
}
override func viewDidLoad() {
  super.viewDidLoad()
  imagePicker.delegate = self
}
  
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
  guard let stylPickerController = segue.destination as? StylePickerViewController else { return }
  stylPickerController.delegate = self
}

} // class ViewController

extension ViewController {
  
private func performStyleTransfer(_ image: UIImage) {
  
}
  
private func capture(_ sourceType: UIImagePickerController.SourceType) {
  imagePicker.sourceType = sourceType
  
}
  
} // extension ViewController

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
  guard let pickedImage = info[.originalImage] as? UIImage else { return }
  dispatchQueue.async {
    self.performStyleTransfer(pickedImage)
  }
}
  
} // extension ViewController

extension ViewController: StylePickerViewControllerDelgate {
func didPick(_ style: Style) {
  self.style = style
  dismiss(animated: true, completion: nil)
  dump(style)
}
  
} // extension ViewController
