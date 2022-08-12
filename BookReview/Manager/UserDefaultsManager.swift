//
//  UserDefaultsManager.swift
//  BookReview
//
//  Created by HwangByungJo  on 2022/08/12.
//

import Foundation

protocol UserDefaultsManagerProtocol {
  func getReview() -> [BookReview]
  func setReView(_ newValue: BookReview)
}

struct UserDefaultsManager: UserDefaultsManagerProtocol {
  
  enum Key: String {
    case review
  }
  
  func getReview() -> [BookReview] {
    guard let data = UserDefaults.standard.data(forKey: Key.review.rawValue) else {
      return []
    }
    return (try? PropertyListDecoder().decode([BookReview].self, from: data)) ?? []
  }
  
  func setReView(_ newValue: BookReview) {
    var currentReview: [BookReview] = getReview()
    currentReview.insert(newValue, at:0)
    UserDefaults.standard.setValue(try? PropertyListEncoder().encode(currentReview), forKey: Key.review.rawValue)
  }
  
}
