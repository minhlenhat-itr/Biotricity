//
//  SimCardView.swift
//  biotricity
//
//  Created by Le Minh on 11/03/2022.
//

import Foundation
import UIKit

class SimCardView : UIView {
    @IBOutlet var contentView: UIView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupXib()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupXib()
    }

    func setupXib() {
        
        let bundle = Bundle(for: SimCardView.self)
        bundle.loadNibNamed("SimCardView", owner: self, options: nil)
        self.contentView.frame = self.bounds
        self.contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    
        addSubview(self.contentView)
        
    }
}
