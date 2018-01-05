//
//  ViewController.swift
//  Peephole
//
//  Created by 南　京兵 on 2018/01/05.
//  Copyright © 2018年 kyohei.minami. All rights reserved.
//

import UIKit
import WebKit
import Sword

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
            print(queryItems[1])
        }
        
        decisionHandler(WKNavigationActionPolicy.allow)
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        
            let url = navigationResponse.response.url
//            let cookie = navigationResponse
//            print(cookie)
    }
    
    func webView(_ webView: WKWebView, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        let cred = URLCredential(user: "pencil3215@gmail.com", password: "vocapho28", persistence: URLCredential.Persistence.none)
        completionHandler(URLSession.AuthChallengeDisposition.useCredential, cred)
    }
    
}

