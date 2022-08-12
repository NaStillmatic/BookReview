//
//  MockUserDefaultsManagerProtocol.swift
//  BookReviewTests
//
//  Created by HwangByungJo  on 2022/08/12.
//

import Foundation

@testable import BookReview

final class MockUserDefaultsManagerProtocol: UserDefaultsManagerProtocol {
  
  var isCalledGetReviews = false
  var isCalledSetReview = false
  
  func getReview() -> [BookReview] {
    isCalledGetReviews = true
    return []
  }
  
  func setReView(_ newValue: BookReview) {
    isCalledSetReview = true
  }
}
