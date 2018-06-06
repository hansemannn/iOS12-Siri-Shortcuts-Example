//
//  MagazineDetailsViewController.swift
//  MagazineViewer
//
//  Created by Hans Knöchel on 06.06.18.
//  Copyright © 2018 Hans Knöchel. All rights reserved.
//

import UIKit

class MagazineDetailsViewController: UIViewController {
  
  @IBOutlet private weak var coverImageView: UIImageView!
  
  @IBOutlet private weak var titleLabel: UILabel!

  private var magazine: Magazine?
  
  func configure(with magazine: Magazine) {
    self.magazine = magazine
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    
    guard let magazine = self.magazine else { return }
    
    self.coverImageView.image = UIImage(named: magazine.cover)
    self.titleLabel.text = magazine.title
    
    self.userActivity = NSUserActivity.viewMagazineActivity
  }
}

