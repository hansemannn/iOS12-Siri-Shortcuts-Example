//
//  MagazinesTableViewController.swift
//  MagazineViewer
//
//  Created by Hans Knöchel on 06.06.18.
//  Copyright © 2018 Hans Knöchel. All rights reserved.
//

import UIKit

class MagazinesTableViewController: UITableViewController {
    
  public enum MagazineSegues : String {
    case detail = "ShowDetailMagazine"
  }

  private var magazines: [Magazine] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.magazines.append(Magazine(identifier: "harry_potter",
                                   cover: "1-harry_potter",
                                   title: "Harry Potter And The Cursed Child",
                                   lastViewed: Date()))
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard segue.identifier == MagazineSegues.detail.rawValue, let destination = segue.destination as? MagazineDetailsViewController else {
      return
    }
    
    guard let selectedIndexPath = self.tableView.indexPathForSelectedRow else { return }
    
    destination.configure(with: self.magazines[selectedIndexPath.row])
  }
}

// MARK: - Table view data source

extension MagazinesTableViewController {
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.magazines.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "MagazineCell", for: indexPath) as? MagazineTableViewCell else {
      fatalError("Could not dequeue magazine cell")
    }
  
    cell.configure(with: self.magazines[indexPath.row])
  
    return cell
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 130
  }
}
