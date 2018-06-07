//
//  Magazine.swift
//  MagazineViewer
//
//  Created by Hans Knöchel on 06.06.18.
//  Copyright © 2018 Hans Knöchel. All rights reserved.
//

import Foundation
import Intents

public struct Magazine: Codable {

  public let identifier: String

  public let cover: String

  public let title: String
  
  public let lastViewed: Date
  
  public init(identifier: String, cover: String, title: String, lastViewed: Date) {
    self.identifier = identifier
    self.cover = cover
    self.title = title
    self.lastViewed = lastViewed
  }
}

// MARK: View Magazine Intent

extension Magazine {

  public var intent: ViewMagazineIntent {
    let viewMagazineIntent = ViewMagazineIntent()
    viewMagazineIntent.magazine = INObject(identifier: identifier, display: title)
    viewMagazineIntent.suggestedInvocationPhrase = "Try this soup!"
    
    return viewMagazineIntent
  }
}
