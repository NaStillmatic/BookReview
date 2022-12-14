//
//  BookSearchManager.swift
//  BookReview
//
//  Created by HwangByungJo  on 2022/08/08.
//

import Foundation
import Alamofire

struct BookSearchManager {
  
  func request(from keyword: String, completionHandler: @escaping (([Book]) -> Void)) {
    guard let url = URL(string: "https://openapi.naver.com/v1/search/book.json") else { return }
    
    let parameters = BookSearchRequestModel(query: keyword)
    
    let headers: HTTPHeaders = [
      "X-Naver-Client-Id": "31Yx_S_nC13mpBeWVt2g",
      "X-Naver-Client-Secret" : "fEq9F0rhZ_"
    ]
    
    AF.request(url, method: .get, parameters: parameters, headers: headers)
      .responseDecodable(of: BookSearchResponseModel.self) { response in
        switch response.result {
          case .success(let result):
            completionHandler(result.items)
          case .failure(let error):
            print(error.localizedDescription)
        }
      }
  }
}
