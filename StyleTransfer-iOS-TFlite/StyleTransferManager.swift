//
//  StyleTransferManager.swift
//  StyleTransfer-iOS-TFlite
//
//  Created by Khurram on 28/03/2020.
//  Copyright © 2020 Example. All rights reserved.
//

import Foundation

private let dispatchQueue = DispatchQueue(label: "StyleTransfer-iOS-TFlite.backgroundQeue")

final class StyleTransferManager {

  
}

extension StyleTransferManager {
  
static func newInstance(completion: @escaping ((StyleTransferManager?) -> Void)) {
  dispatchQueue.async {
    
  }
}
  
} // extension StyleTransferManager
