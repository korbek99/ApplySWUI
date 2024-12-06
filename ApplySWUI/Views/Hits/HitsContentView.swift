//
//  HitsContentView.swift
//  ApplySWUI
//
//  Created by Jose Preatorian on 05-12-24.
//

import Foundation
import CoreData
import SwiftUI

struct HitsContentView: View {
    @StateObject private var viewModel = HitsViewModel()
    @State private var utils = UtilsDates()
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.hits.isEmpty {
                    Text(NSLocalizedString("LOADING_TITLE", comment: "error message"))
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    List {
                        ForEach(viewModel.hits, id: \.objectID) { hit in
                            NavigationLink(destination: WebContentView(hit: hit)) {
                                VStack(alignment: .leading) {
                                    Text(hit.storyTitle ?? hit.title ?? NSLocalizedString("HIT_VC_ERROR_CONTEXT", comment: "error message"))
                                        .font(.headline)
                                        .multilineTextAlignment(.leading)
                                        .lineLimit(nil)
                                        .truncationMode(.tail)
                                    if let author = hit.author, let createdAt = hit.createdAt {
                                        Text("\(author) - \(utils.timerAgoSet(from: createdAt))")
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                                    }
                                }
                                .padding(.vertical, 4)
                            }
                        }
                        .onDelete(perform: deleteHit)
                    }
                    .refreshable {
                        viewModel.fetchArticules()
                    }
                }
            }
            .navigationTitle("")
            .onAppear {
                viewModel.fetchArticules()
            }
        }
    }
    
    func deleteHit(at offsets: IndexSet) {
        viewModel.hits.remove(atOffsets: offsets)
    }
}

struct HitsContentView_Previews: PreviewProvider {
    static var previews: some View {
        HitsContentView()
    }
}
