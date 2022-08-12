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
  private let userDefaultManger = UserDefaultsManager()
  private var book: Book?
  
  let contentsTextViewPlaceHodler = "내용을 입력해주세요."
  
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
  
  func didTapRightBarButton(contentsText: String?) {
  
    guard let book = book else { return }
    let bookReview = BookReview(title: book.title,
                                contents: contentsText ?? "",
                                imageURL: book.imageURL)
    userDefaultManger.setReView(bookReview)
    viewController.close()
  }
  
  func didTapBookTitleButton() {
    viewController.presntToSearchBookViewController()
  }
}


extension ReviewWritePresenter: SearchBookDelegate {
  func didSelectBook(_ book: Book) {
    self.book = book
    viewController.updateViews(title: book.title,
                               imagUrl: book.imageURL)
  }
}
