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
  func presntToSearchBookViewController()
  func updateViews(title: String, imagUrl: URL?)
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
  
  func didTapBookTitleButton() {
    viewController.presntToSearchBookViewController()
  }
}


extension ReviewWritePresenter: SearchBookDelegate {
  func didSelectBook(_ book: Book) {
    viewController.updateViews(title: book.title,
                               imagUrl: book.imageURL)
  }
}
