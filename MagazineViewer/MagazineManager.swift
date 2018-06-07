//
//  MagazineManager.swift
//  MagazineViewer
//
//  Created by Hans Knöchel on 07.06.18.
//  Copyright © 2018 Hans Knöchel. All rights reserved.
//

import UIKit

final class MagazineManager {

  static let shared = MagazineManager()
  
  private init() { /**/ }
  
  var magazines: [Magazine] = []
  
  func add(magazine: Magazine) {
    
  }
  
  func remove(magazine: Magazine) {
    
  }
  
  func getMagazine(with identifier: String) -> Magazine? {
    return nil
  }
}
