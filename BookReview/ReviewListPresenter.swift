//
//  ReviewListPresenter.swift
//  BookReview
//
//  Created by HwangByungJo  on 2022/08/08.
//

import Foundation

protocol ReviewListPorotocol {
  
}

final class ReviewListPresenter {
  private let viewController: ReviewListPorotocol
  
  init(viewController: ReviewListPorotocol) {
    self.viewController = viewController
  }
}
