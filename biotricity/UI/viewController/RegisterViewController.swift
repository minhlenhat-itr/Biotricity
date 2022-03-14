//
//  RegisterViewController.swift
//  biotricity
//
//  Created by Le Minh on 11/03/2022.
//

import UIKit

class RegisterViewController: UIViewController {

    
    @IBOutlet weak var btnClose: UIButton!
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.delegate = self
        }
    }
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnNext: UIButton!
    
    var pages: [UIView] {
        get {
            let page1: SimCardView = Bundle.main.loadNibNamed("SimCardView", owner: self, options: nil)?.first as! SimCardView
            
            let page2: CarrierWebPortalView = Bundle.main.loadNibNamed("CarrierWebPortalView", owner: self, options: nil)?.first as! CarrierWebPortalView
            
            let page3: InstallFirmWareView = Bundle.main.loadNibNamed("InstallFirmWareView", owner: self, options: nil)?.first as! InstallFirmWareView
            
            let page4: DeviceIDView = Bundle.main.loadNibNamed("DeviceIDView", owner: self, options: nil)?.first as! DeviceIDView
            let page5: CellularSignalView = Bundle.main.loadNibNamed("CellularSignalView", owner: self, options: nil)?.first as! CellularSignalView
            
            let page6: FunctionTestView = Bundle.main.loadNibNamed("FunctionTestView", owner: self, options: nil)?.first as! FunctionTestView
            
            let page7: BatteryView = Bundle.main.loadNibNamed("BatteryView", owner: self, options: nil)?.first as! BatteryView
            
            let page8: PackageDeviceView = Bundle.main.loadNibNamed("PackageDeviceView", owner: self, options: nil)?.first as! PackageDeviceView
            return [page1,page2,page3,page4, page5, page6, page7, page8]
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView(pages)
    }
    
    private func setupScrollView(_ pages: [UIView]) {
        print("scrollView: width: \(scrollView.frame.width), height: \(scrollView.frame.height)")
        print("View: width: \(view.frame.width), height: \(view.frame.height)")
    
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: scrollView.frame.height)
        scrollView.contentSize = CGSize(width: (scrollView.frame.width) * CGFloat(pages.count), height: scrollView.frame.height)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< pages.count {
            pages[i].frame = CGRect(x: scrollView.frame.width * CGFloat(i), y: 0, width: scrollView.frame.width, height: scrollView.frame.height)
            print("pagesView: width: \(pages[i].frame.width), height: \(pages[i].frame.height)")
            scrollView.addSubview(pages[i])
        }
    }

    @IBAction func onNext(_ sender: Any) {
        if scrollView.contentOffset.x < scrollView.bounds.width * 7  {
            UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseOut, animations: {
                self.scrollView.contentOffset.x += self.scrollView.bounds.width
                self.view.layoutIfNeeded()}, completion: nil)
        }
        
        print("rolling: next: \(scrollView.contentOffset.x)")
    }
    @IBAction func onBack(_ sender: Any) {
        if scrollView.contentOffset.x > 0 {
            
            UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseIn, animations: {
                self.scrollView.contentOffset.x -= self.scrollView.bounds.width
                self.view.layoutIfNeeded()}, completion: nil)
        }
        print("rolling: back: \(scrollView.contentOffset.x)")
    }
}

extension RegisterViewController : UIScrollViewDelegate {

}
