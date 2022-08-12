//
//  MockReviewListViewController.swift
//  BookReviewTests
//
//  Created by HwangByungJo  on 2022/08/12.
//

import Foundation

@testable import BookReview

final class MockReviewListViewController: ReviewListPorotocol {
  
  var isCalledSetupNavigtionBar = false
  var isCalledSetupViews = false
  var isCalledPresntToReviewWriteViewController = false
  var isCalledReloadTableView = false
  
  func setupNavigationBar() {
    isCalledSetupNavigtionBar = true
  }
  
  func setupViews() {
    isCalledSetupViews = true
  }
  
  func presentToReviewWriteViewController() {
    isCalledPresntToReviewWriteViewController = true
  }
  
  func reloadTableView() {
    isCalledReloadTableView = true
  }
}

