//
//  MagazineTableViewCell.swift
//  MagazineViewer
//
//  Created by Hans Knöchel on 06.06.18.
//  Copyright © 2018 Hans Knöchel. All rights reserved.
//

import UIKit

class MagazineTableViewCell: UITableViewCell {

  @IBOutlet private weak var coverImageView: UIImageView!
  
  @IBOutlet private weak var bookTitleLabel: UILabel!
  
  @IBOutlet private weak var lastViewedLabel: UILabel!
  
  var magazine: Magazine?
  
  func configure(with magazine: Magazine) {
    self.coverImageView.image = UIImage(named: magazine.cover)
    self.bookTitleLabel.text = magazine.title
    self.lastViewedLabel.text = String("Last Viewed: \(formattedDate(from: magazine.lastViewed))")
    self.magazine = magazine
  }
  
  private func formattedDate(from inputDate: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .short
    dateFormatter.timeStyle = .short

    return dateFormatter.string(from: inputDate)
  }
}
