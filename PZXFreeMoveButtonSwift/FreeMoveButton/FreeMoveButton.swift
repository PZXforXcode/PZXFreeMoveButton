//
//  FreeMoveButton.swift
//  FreeMoveButton
//
//  Created by chang he on 2021/7/7.
//

import UIKit

class FreeMoveButton: UIImageView {

    
    var startLocation : CGPoint?
    var action : String?
    var title : String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    private var titleLabel : UILabel = UILabel()
    
    var clickCompletCloser : (()->Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(tapMe))
        addGestureRecognizer(tap)
        backgroundColor = .red
        
        titleLabel = UILabel(frame: bounds)
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.textColor = .black
        addSubview(titleLabel)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let pt = touches.first?.location(in: self)
        startLocation = pt
        superview?.bringSubviewToFront(self)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let pt = touches.first?.location(in: self)
        guard let pt = pt,
              let startLocation = startLocation,
              let superview = superview else {
            return
        }
        let dx = pt.x - startLocation.x
        let dy = pt.y - startLocation.y
        var newCenter = CGPoint(x: center.x  + dx, y: center.y + dy)
        
        let halfx = self.bounds.width / 2
        newCenter.x = max(halfx, newCenter.x)
        newCenter.x = min(superview.bounds.size.width - halfx, newCenter.x)
        
        let halfy = self.bounds.height / 2
        newCenter.y = max(halfy, newCenter.y)
        newCenter.y = min(superview.bounds.size.height - halfy, newCenter.y)
        
        center = newCenter
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        changeLocation()
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        changeLocation()
    }
    
    
    private func changeLocation() {
        guard let superview = superview else {
            return
        }
        let point = center
        if point.x > superview.frame.size.width / 2 {
            UIView.animate(withDuration: 0.2) { [weak self] in
                guard let self = self else {return}
                
                self.frame = CGRect(x: superview.frame.size.width - self.frame.size.width,
                                    y: self.frame.origin.y,
                                    width: self.frame.size.width,
                                    height: self.frame.size.height)
            }
        } else {
            UIView.animate(withDuration: 0.2) { [weak self] in
                guard let self = self else {return}
                
                self.frame = CGRect(x: 0,
                                    y: self.frame.origin.y,
                                    width: self.frame.size.width,
                                    height: self.frame.size.height)
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    @objc func tapMe() {
        self.clickCompletCloser?()
    }
}
