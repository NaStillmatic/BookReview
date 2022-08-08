//
//  ReviewListPresenter.swift
//  BookReview
//
//  Created by HwangByungJo  on 2022/08/08.
//

import UIKit

protocol ReviewListPorotocol {
  func setupNavigationBar()
  func setupViews()
  func presentToReviewWriteViewController()
  func reloadTableView()
}

final class ReviewListPresenter: NSObject {
  private let viewController: ReviewListPorotocol
  
  init(viewController: ReviewListPorotocol) {
    self.viewController = viewController    
    viewController.setupNavigationBar()
  }
  
  func viewDidLoad() {
    viewController.setupNavigationBar()
    viewController.setupViews()
  }
  
  func viewWillAppear() {
    viewController.reloadTableView()
  }

  func didTabRightBarButtonItem() {
    viewController.presentToReviewWriteViewController()
  }
}

extension ReviewListPresenter: UITableViewDataSource {
    
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
    cell.textLabel?.text = "\(indexPath.row)"
    return cell
  }
  
}
