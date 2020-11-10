//
//  assigneeView.swift
//  IssueTracker
//
//  Created by 박성민 on 2020/11/10.
//

import UIKit

@IBDesignable
class AssigneeView: UIView {
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            self.commonInit()
        }

        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            self.commonInit()
        }

        private func commonInit(){
            let bundle = Bundle.init(for: self.classForCoder)
            let view = bundle.loadNibNamed("AssigneeView",
                                           owner: self,
                                           options: nil)?.first as! UIView
            self.addSubview(view)
        }

}
