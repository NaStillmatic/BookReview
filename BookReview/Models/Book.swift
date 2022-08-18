//
//  Book.swift
//  BookReview
//
//  Created by HwangByungJo  on 2022/08/08.
//

import Foundation

struct Book: Decodable {
  
  let title: String
  private let image: String?
  
  var imageURL: URL? { URL(string: image ?? "") }
  
  init(title: String, imageURL: String?) {
    self.title = title
    self.image = imageURL
  }
}
