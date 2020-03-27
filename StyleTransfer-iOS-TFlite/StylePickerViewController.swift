//
//  StylePickerViewController.swift
//  StyleTransfer-iOS-TFlite
//
//  Created by Khurram on 27/03/2020.
//  Copyright © 2020 Example. All rights reserved.
//

import UIKit

protocol StylePickerViewControllerDelgate: class {
  
func didPick(_ style: Style)
  
}

final class StylePickerViewController: UIViewController {

weak var delegate: StylePickerViewControllerDelgate?
private let allStyles = Style.allCases
private let itemsPerRow: CGFloat = 3
private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)

  
override func viewDidLoad() {
  super.viewDidLoad()
  
}

} // class StylePickerViewController

extension StylePickerViewController: UICollectionViewDelegate {
func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
  delegate?.didPick(allStyles[indexPath.item])
}
  
} // extension StylePickerViewController

extension StylePickerViewController: UICollectionViewDataSource {
  
func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
  allStyles.count
} // extension StylePickerViewController

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellIdentifier", for: indexPath)
  configure(cell, at: indexPath)
  
  return cell
}
  
} // extension StylePickerViewController

extension StylePickerViewController {
func configure(_ cell: UICollectionViewCell, at indexPath: IndexPath) {
    cell.backgroundView = UIImageView(image: UIImage(named: allStyles[indexPath.item].image))
}
  
} // extension StylePickerViewController

extension StylePickerViewController: UICollectionViewDelegateFlowLayout {
  
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
  let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
  let availableWidth = view.frame.width - paddingSpace
  let widthPerItem = availableWidth / itemsPerRow
  
  return CGSize(width: widthPerItem, height: widthPerItem)
}

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
  sectionInsets
}

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
  sectionInsets.left
}
  
} // extension StylePickerViewController
