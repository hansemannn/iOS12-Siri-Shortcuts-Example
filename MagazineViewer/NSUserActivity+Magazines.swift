//
//  NSUserActivity+Magazines.swift
//  MagazineViewer
//
//  Created by Hans Knöchel on 06.06.18.
//  Copyright © 2018 Hans Knöchel. All rights reserved.
//

import CoreSpotlight
import Foundation
import UIKit

// CREDITS: Based on the advanced Apple example

extension NSUserActivity {
  
  public struct ActivityKeys {
    public static let magazines = "magazines"
    public static let segueId = "segueID"
  }
  
  private static let searchableItemContentType = "Magazine"
  
  public static let viewMagazineActivityType = "de.hansknoechel.MagazineViewer.viewMagazine"
  
  public static var viewMagazineActivity: NSUserActivity {
    let userActivity = NSUserActivity(activityType: NSUserActivity.viewMagazineActivityType)
    
    userActivity.title = "View Magazine"
    userActivity.isEligibleForSearch = true
    userActivity.isEligibleForPrediction = true
    
    let attributes = CSSearchableItemAttributeSet(itemContentType: NSUserActivity.searchableItemContentType)
    attributes.thumbnailData = UIImage(named: "book")!.pngData()
    attributes.keywords = userActivity.viewMagazineSearchableKeywords
    attributes.displayName = "View Magazine"
    attributes.contentDescription = "Looks really good!"
    
    userActivity.contentAttributeSet = attributes
    // userActivity.suggestedInvocationPhrase = "Try this magazine?"
  
    return userActivity
  }
  
  private var viewMagazineSearchableKeywords: [String] {
    return [NSLocalizedString("VIEW", bundle: Bundle.main, comment: "Searchable keyword"),
            NSLocalizedString("MAGAZINE", bundle: Bundle.main, comment: "Searchable keyword")
    ]
  }
}
