//
//  WebContentView.swift
//  ApplySWUI
//
//  Created by Jose Preatorian on 05-12-24.
//


import Foundation
import SwiftUI
import WebKit

struct WebContentView: UIViewRepresentable {
    let hit: Hit

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let urlString = hit.storyURL, let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            uiView.load(request)
        } else {
            let html = """
            <html>
            <body>
            <h1>Error</h1>
            <p>Invalid or missing URL.</p>
            </body>
            </html>
            """
            uiView.loadHTMLString(html, baseURL: nil)
        }
    }
}
