//
//  ReviewWritePresenter.swift
//  BookReview
//
//  Created by HwangByungJo  on 2022/08/08.
//

import Foundation

protocol ReviewWriteProtocol {
  func setupNavigationBar()
  func showCloseAlertController()
  func close()
  func setupViews()
}

final class ReviewWritePresenter: NSObject {
  
  private let viewController: ReviewWriteProtocol
  
  init(viewController: ReviewWriteProtocol) {
    self.viewController = viewController
  }
  
  func viewDidLoad() {
    viewController.setupNavigationBar()
    viewController.setupViews()
  }
    
  func didTapLeftBarButton() {
    viewController.showCloseAlertController()
  }
  
  func didTapRightBarButton() {
    viewController.close()
  }
}
