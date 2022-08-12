//
//  BookReview.swift
//  BookReview
//
//  Created by HwangByungJo  on 2022/08/12.
//

import Foundation

struct BookReview: Codable {
  
  let title: String
  let contents: String
  let imageURL: URL?
}
