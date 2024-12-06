//
//  HitsViewModel.swift
//  ApplySWUI
//
//  Created by Jose Preatorian on 05-12-24.
//


import Foundation
import Combine

class HitsViewModel: ObservableObject {
    private let webService: webServicesHits
    
    @Published var hits: [Hit] = []  
    var reloadData: (() -> Void)?
    var showError: ((String) -> Void)?
    
    init(webService: webServicesHits = webServicesHits()) {
        self.webService = webService
    }
    
    func fetchArticules() {
        webService.getArticles { [weak self] results in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                if let results = results {
                    print("Fetched articles: \(results.count) items")
                    self.hits = results
                } else {
                    print("No articles fetched or error occurred")
                    self.showError?("Failed to load data.")
                }
            }
        }
    }
  
    func articulos(at index: Int) -> Hit? {
        guard index >= 0 && index < hits.count else { return nil }
        return hits[index]
    }
}
