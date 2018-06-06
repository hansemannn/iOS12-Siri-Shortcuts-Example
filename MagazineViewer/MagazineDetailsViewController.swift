//
//  MagazineDetailsViewController.swift
//  MagazineViewer
//
//  Created by Hans Knöchel on 06.06.18.
//  Copyright © 2018 Hans Knöchel. All rights reserved.
//

import Intents
import UIKit

class MagazineDetailsViewController: UIViewController {
  
  @IBOutlet private weak var coverImageView: UIImageView!
  
  @IBOutlet private weak var titleLabel: UILabel!
  
  @IBAction func readBookButtonTapped(_ sender: Any) {
    donateInteraction()
  }
  
  @IBAction func unwindToMagazineDetails(sender: UIStoryboardSegue) {
    // Unwind from "Reading" to "Details" (this view)
  }
  
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

  private func donateInteraction() {
    guard let magazine = self.magazine else { return }
    
    let interaction = INInteraction(intent: magazine.intent, response: nil)
    interaction.donate { error in
      guard error == nil else {
        if let error = error as NSError? {
          print("Interaction donation failed: \(error.localizedDescription)")
        } else {
          print("Interaction donation failed: Unknown error")
        }
        return
      }
      
      print("Successfully donated interaction")
    }
  }
}

