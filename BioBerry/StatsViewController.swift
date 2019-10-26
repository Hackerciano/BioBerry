//
//  StatsViewController.swift
//  BioBerry
//
//  Created by Diego Graciano on 26/10/19.
//  Copyright © 2019 Diego Graciano. All rights reserved.
//

import UIKit
import WebKit

class StatsViewController: UIViewController {

    @IBOutlet weak var topContainer: UIView!
    @IBOutlet weak var bottomContainer: UIView!
    var webView1: WKWebView!
    var webView2: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.topContainer.layer.backgroundColor = UIColor.white.cgColor
        self.bottomContainer.layer.backgroundColor = UIColor.white.cgColor
        self.topContainer.layer.cornerRadius = 20
        self.bottomContainer.layer.cornerRadius = 20
        self.topContainer.layer.shadowColor = UIColor.black.cgColor
        self.topContainer.layer.shadowOffset = .zero
        self.topContainer.layer.shadowOpacity = 0.5
        self.topContainer.layer.shadowRadius = 20
        self.bottomContainer.layer.shadowColor = UIColor.black.cgColor
        self.bottomContainer.layer.shadowOffset = .zero
        self.bottomContainer.layer.shadowOpacity = 0.5
        self.bottomContainer.layer.shadowRadius = 20
        
        // FIRST MAT LAB GRAPH
        
        webView1 = WKWebView(frame: topContainer.bounds, configuration: WKWebViewConfiguration() )
        self.webView1.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.topContainer.addSubview(webView1)
        //self.webView.allowsBackForwardNavigationGestures = true
        
        let myURL1 = URL(string: "https://thingspeak.com/channels/895281/charts/2?bgcolor=%23ffffff&color=%23d62020&dynamic=true&results=60&type=line&update=15")
        let myRequest1 = URLRequest(url: myURL1!)
        webView1.load(myRequest1)
                webView1.scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: -80)
        webView1.scrollView.minimumZoomScale = 2.0
        webView1.scrollView.maximumZoomScale = 3.0
        webView1.scrollView.bounces = false
        
        // SECOND MATH LAB GRAPH
        
        webView2 = WKWebView(frame: bottomContainer.bounds, configuration: WKWebViewConfiguration() )
        self.webView2.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.bottomContainer.addSubview(webView2)
        //self.webView.allowsBackForwardNavigationGestures = true

        let myURL2 = URL(string: "https://thingspeak.com/channels/895281/charts/3?bgcolor=%23ffffff&color=%23d62020&dynamic=true&results=60&type=line&update=15")
        let myRequest2 = URLRequest(url: myURL2!)
        webView2.load(myRequest2)
                webView2.scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: -80)
        webView2.scrollView.minimumZoomScale = 2.0
        webView2.scrollView.maximumZoomScale = 3.0
        webView2.scrollView.bounces = false
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
