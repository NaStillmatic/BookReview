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
  func presentToSearchBookViewController()
  func updateViews(title: String, imageURL: URL?)
}

final class ReviewWritePresenter: NSObject {
  
  private let viewController: ReviewWriteProtocol
  private let userDefaultsManager: UserDefaultsManagerProtocol
  var book: Book?
  
  let contentsTextViewPlaceHolderText = "내용을 입력해주세요."
  
  init(viewController: ReviewWriteProtocol,
       userDefaultsManager: UserDefaultsManagerProtocol = UserDefaultsManager()) {
    self.viewController = viewController
    self.userDefaultsManager = userDefaultsManager
  }
  
  func viewDidLoad() {
    viewController.setupNavigationBar()
    viewController.setupViews()
  }
  
  func didTapLeftBarButton() {
    viewController.showCloseAlertController()
  }
  
  func didTapRightBarButton(contentsText: String?) {
    
    guard let book = book,
          let contentsText = contentsText,
          contentsText != contentsTextViewPlaceHolderText else { return }
    let bookReview = BookReview(title: book.title,
                                contents: contentsText,
                                imageURL: book.imageURL)
    userDefaultsManager.setReView(bookReview)
    viewController.close()
  }
  
  func didTapBookTitleButton() {
    viewController.presentToSearchBookViewController()
  }
}


extension ReviewWritePresenter: SearchBookDelegate {
  func didSelectBook(_ book: Book) {
    self.book = book
    viewController.updateViews(title: book.title,
                               imageURL: book.imageURL)
  }
}
