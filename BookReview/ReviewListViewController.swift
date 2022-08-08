//
//  ReviewListViewController.swift
//  BookReview
//
//  Created by HwangByungJo  on 2022/08/08.
//

import UIKit

final class ReviewListViewController: UIViewController {

  private lazy var presenter = ReviewListPresenter(viewController: self)
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
}

extension ReviewListViewController: ReviewListPorotocol {
  
}

