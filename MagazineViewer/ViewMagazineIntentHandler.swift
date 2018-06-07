/*
 See LICENSE folder for this sample’s licensing information.
 
 Abstract:
 Intent handler for OrderSoupIntents delivered by the system.
 */

import UIKit

public class ViewMagazineIntentHandler: NSObject, ViewMagazineIntentHandling {
  
  public func confirm(intent: ViewMagazineIntent, completion: @escaping (ViewMagazineIntentResponse) -> Void) {
    let magazineManager = MagazineManager.shared
    
    guard let magazine = intent.magazine,
      let identifier = magazine.identifier,
      magazineManager.getMagazine(with: identifier) != nil else {
        completion(ViewMagazineIntentResponse(code: .failure, userActivity: nil))
        return
    }
    
    completion(ViewMagazineIntentResponse(code: .ready, userActivity: nil))
  }
  
  public func handle(intent: ViewMagazineIntent, completion: @escaping (ViewMagazineIntentResponse) -> Void) {
    guard let magazine = intent.magazine else {
      completion(ViewMagazineIntentResponse(code: .failure, userActivity: nil))
      return
    }
    
    // TODO: Not really the best use-case for background Siri execution,
    // but could be extended some background work here.
    print("Handled magazine with identifier = \(String(describing: magazine.identifier))")

    //  For the success case, we want to indicate a wait time to the user so that they know when their soup order will be ready.
    //  Ths sample uses a hardcoded value, but your implementation could use a time interval returned by your server.
    completion(ViewMagazineIntentResponse(code: .success, userActivity: nil))
  }
}
