//
//  ReviewListPresenterTests.swift
//  BookReviewTests
//
//  Created by HwangByungJo  on 2022/08/08.
//

import XCTest
@testable import BookReview

class ReviewListPresenterTests: XCTestCase {
  
  var sut: ReviewListPresenter!
  var viewController: MockReviewListViewController!
  var userDefaultsManager: MockUserDefaultsManagerProtocol!
  
  override func setUp() {
    super.setUp()
    
    viewController = MockReviewListViewController()
    userDefaultsManager = MockUserDefaultsManagerProtocol()
    sut = ReviewListPresenter(viewController: viewController,
                              userDefaultsmanager: userDefaultsManager)
  }
  
  override func tearDown() {
    sut = nil
    viewController = nil
    super.tearDown()
  }
  
  func test_viewDlidLoad가_호출될_때() {
    sut.viewDidLoad()
    
    XCTAssertTrue(viewController.isCalledSetupNavigtionBar)
    XCTAssertTrue(viewController.isCalledSetupViews)
  }
  
  func test_viewWillAppear가_호출될_때() {
    sut.viewWillAppear()
    
    XCTAssertTrue(userDefaultsManager.isCalledGetReviews)
    XCTAssertTrue(viewController.isCalledReloadTableView)
  }
  
  func test_didTapRightBarButtonItem이_호출될_때() {
    sut.didTabRightBarButtonItem()
    XCTAssertTrue(viewController.isCalledPresntToReviewWriteViewController)
  }
}

