//
//  ViewController.swift
//  WebViewApp
//
//  Created by harsh Khandelwal on 21/06/21.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    let webView: WKWebView = {
        let prefs = WKWebpagePreferences()
        prefs.allowsContentJavaScript = true
        let configure = WKWebViewConfiguration()
        configure.defaultWebpagePreferences = prefs
        let webView = WKWebView(frame: .zero, configuration: configure)
        return webView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webView)
        guard let url = URL(string: "https://www.google.com") else {
            return
        }
        webView.load(URLRequest(url: url))
        DispatchQueue.main.asyncAfter(deadline: .now()+5){
            self.webView.evaluateJavaScript("document.body.innerHTML"){ result, error in
                guard let html = result as? String, error == nil
                else{
                    return
                }
                print(html)
            }
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }


}

