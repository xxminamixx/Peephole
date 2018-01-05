//
//  ViewController.swift
//  Peephole
//
//  Created by 南　京兵 on 2018/01/05.
//  Copyright © 2018年 kyohei.minami. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet weak var webview: WKWebView!
    
    let redirectURI = "https://peephole.redirect.uri"
    let login = "https://discordapp.com/api/oauth2/authorize?response_type=code&client_id=398746969885114368&redirect_uri=https://peephole.redirect.uri"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webview.navigationDelegate = self
        
        webview.load(URLRequest(url: URL(string: login)!))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension ViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
        guard let url = navigationAction.request.url?.absoluteString else {
            return
        }
        
        if (url.contains(redirectURI)) {
            guard let queryItems = NSURLComponents(string: url)?.queryItems else {
                return
            }
            
            print(queryItems)
        }
        
        decisionHandler(WKNavigationActionPolicy.allow)
    }
    
}

