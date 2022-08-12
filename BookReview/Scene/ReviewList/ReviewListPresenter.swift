//
//  ReviewListPresenter.swift
//  BookReview
//
//  Created by HwangByungJo  on 2022/08/08.
//

import UIKit
import Kingfisher

protocol ReviewListPorotocol {
  func setupNavigationBar()
  func setupViews()
  func presentToReviewWriteViewController()
  func reloadTableView()
}

final class ReviewListPresenter: NSObject {
  private let viewController: ReviewListPorotocol
  private let userDefaultsmanager: UserDefaultsManagerProtocol
  
  private var review: [BookReview] = []
  
  init(viewController: ReviewListPorotocol,
       userDefaultsmanager: UserDefaultsManagerProtocol = UserDefaultsManager()) {
    self.viewController = viewController
    self.userDefaultsmanager = userDefaultsmanager
         
    viewController.setupNavigationBar()
  }
  
  func viewDidLoad() {
    viewController.setupNavigationBar()
    viewController.setupViews()
  }
  
  func viewWillAppear() {
    review = userDefaultsmanager.getReview()
    viewController.reloadTableView()
  }

  func didTabRightBarButtonItem() {
    viewController.presentToReviewWriteViewController()
  }
}

extension ReviewListPresenter: UITableViewDataSource {
    
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return review.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
    let data = review[indexPath.row]
    cell.textLabel?.text = data.title
    cell.detailTextLabel?.text = data.contents
    cell.imageView?.kf.setImage(with: data.imageURL,
                                placeholder: .none) { _ in
      cell.setNeedsLayout()
    }
    return cell
  }
  
}
