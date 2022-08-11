//
//  BookSearchResponseModel.swift
//  BookReview
//
//  Created by HwangByungJo  on 2022/08/08.
//

import Foundation


struct BookSearchResponseModel: Decodable {
  
  var items: [Book] = []
}


