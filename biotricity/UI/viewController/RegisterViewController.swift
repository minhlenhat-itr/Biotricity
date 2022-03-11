//
//  RegisterViewController.swift
//  biotricity
//
//  Created by Le Minh on 11/03/2022.
//

import UIKit

class RegisterViewController: UIViewController {

    
    @IBOutlet weak var btnClose: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnNext: UIButton!
    
    var pages: [SimCardView] {
        get {
            let page1: SimCardView = Bundle.main.loadNibNamed("SimCardView", owner: self, options: nil)?.first as! SimCardView
            page1.backgroundColor = UIColor.blue
            
            let page2: SimCardView = Bundle.main.loadNibNamed("SimCardView", owner: self, options: nil)?.first as! SimCardView
            page2.backgroundColor = UIColor.red
            
            let page3: SimCardView = Bundle.main.loadNibNamed("SimCardView", owner: self, options: nil)?.first as! SimCardView
            page3.backgroundColor = UIColor.green
            
            let page4: SimCardView = Bundle.main.loadNibNamed("SimCardView", owner: self, options: nil)?.first as! SimCardView
            page4.backgroundColor = UIColor.blue
            
            return [page1,page2,page3,page4]
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView(pages)
        
        

    }
    
    private func setupScrollView(_ pages: [SimCardView]) {
    
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(pages.count), height: view.frame.height)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< pages.count {
            pages[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.addSubview(pages[i])
        }
    }

    @IBAction func onNext(_ sender: Any) {
        
    }
    @IBAction func onBack(_ sender: Any) {
        
    }
}
