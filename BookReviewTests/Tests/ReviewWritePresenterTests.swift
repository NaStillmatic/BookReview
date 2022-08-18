//
//  ReviewWritePresenterTests.swift
//  BookReviewTests
//
//  Created by HwangByungJo  on 2022/08/12.
//

import XCTest
@testable import BookReview

class ReviewWritePresenterTests: XCTestCase {
  var sut: ReviewWritePresenter!
  var viewController: MockReviewWriteViewController!
  var userDefaultsManager: MockUserDefaultsManager!
  
  override func setUp() {
    super.setUp()
    
    viewController = MockReviewWriteViewController()
    userDefaultsManager = MockUserDefaultsManager()
    
    sut = ReviewWritePresenter(viewController: viewController,
                               userDefaultsManager: userDefaultsManager)
  }
  
  override func tearDown() {
    sut = nil
    viewController = nil
    userDefaultsManager = nil
    
    super.tearDown()
  }
  
  func test_viewDidLoad가_호출될때() {
    sut.viewDidLoad()
    
    XCTAssertTrue(viewController.isCalledSetupNavigationBar)
    XCTAssertTrue(viewController.isCalledSetupViews)
  }
  
  func test_didTapLeftBarButton이_호출될_때() {
    sut.didTapLeftBarButton()
    XCTAssertTrue(viewController.isCalledShowCloseAlertController)
  }
  
  func test_didTapRightBarButton이_호출될_때_book이_존재하지않으면() {
    sut.book = nil
    sut.didTapRightBarButton(contentsText: "참 공부하기 좋은 책이에요.")
    XCTAssertFalse(userDefaultsManager.isCalledSetReview)
    XCTAssertFalse(viewController.isCalledClose)
  }
  
  func test_didTapRightBarButton이_호출될_때_book이_존재하고_contentsTex가_존재하지_않으면() {
    sut.book = nil
    sut.didTapRightBarButton(contentsText: nil)
    XCTAssertFalse(userDefaultsManager.isCalledSetReview)
    XCTAssertFalse(viewController.isCalledClose)
  }
  
  func test_didTapRightBarButton이_호출될_때_book이_존재하고_contentsTex가_placeHolder와_같으면() {
    sut.book = Book(title: "스위프트", imageURL: "")
    sut.didTapRightBarButton(contentsText: sut.contentsTextViewPlaceHolderText)
    XCTAssertFalse(userDefaultsManager.isCalledSetReview)
    XCTAssertFalse(viewController.isCalledClose)
  }
  
  func test_didTapRightBarButton이_호출될_때_book이_존재하고_contentsText가_placeHolder와_같지않게_존재하면() {
    sut.book = Book(title: "스위프트", imageURL: "")
    sut.didTapRightBarButton(contentsText: "참 공부하기 좋은 책이에요.")
    
    XCTAssertTrue(viewController.isCalledClose)
  }
  
  func test_ditTapBookTitleButon이_호출될_때() {
    sut.didTapBookTitleButton()
    XCTAssertTrue(viewController.isCalledPresentToSearchBookViewController)
  }
}


final class MockReviewWriteViewController: ReviewWriteProtocol {
    
  var isCalledSetupNavigationBar = false
  var isCalledShowCloseAlertController = false
  var isCalledClose = false
  var isCalledSetupViews = false
  var isCalledPresentToSearchBookViewController = false
  var isCalledUpdateViews = false

  func setupNavigationBar() {
      isCalledSetupNavigationBar = true
  }

  func showCloseAlertController() {
      isCalledShowCloseAlertController = true
  }

  func close() {
      isCalledClose = true
  }

  func setupViews() {
      isCalledSetupViews = true
  }

  func presentToSearchBookViewController() {
    isCalledPresentToSearchBookViewController = true
  }

  func updateViews(title: String, imageURL: URL?) {
      isCalledUpdateViews = true
  }
}
