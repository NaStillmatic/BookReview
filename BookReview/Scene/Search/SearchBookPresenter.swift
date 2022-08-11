//
//  SearchViewPresenter.swift
//  BookReview
//
//  Created by HwangByungJo  on 2022/08/08.
//

import UIKit

protocol SearchBookProtocol {

  func setupViews()
  func dismiss()
  func reloadView()
}

protocol SearchBookDelegate {
  func didSelectBook(_ book: Book)
}

final class SearchBookPresenter: NSObject {
  private let viewController: SearchBookProtocol
  private let bookSearchManager = BookSearchManager()
  
  private let delegate: SearchBookDelegate
  
  private var books: [Book] = []
  
  
  init(viewController: SearchBookProtocol,
       delegate: SearchBookDelegate) {
    self.viewController = viewController
    self.delegate = delegate
  }
  
  func viewDidLoad() {
    viewController.setupViews()
  }
}

extension SearchBookPresenter: UISearchBarDelegate {
  
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    guard let searchText = searchBar.text else { return }
    
    bookSearchManager.request(from: searchText) { [weak self] newBooks in
      self?.books = newBooks
      self?.viewController.reloadView()
    }
  }
}

extension SearchBookPresenter: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return books.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   
    let cell = tableView.dequeueReusableCell(withIdentifier: "SearchBookCell", for: indexPath)
    
    let book = books[indexPath.row]
    cell.textLabel?.text = book.title
    return cell
  }
}

extension SearchBookPresenter: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {    
    let book = books[indexPath.row]
    delegate.didSelectBook(book)
    viewController.dismiss()
  }
}

