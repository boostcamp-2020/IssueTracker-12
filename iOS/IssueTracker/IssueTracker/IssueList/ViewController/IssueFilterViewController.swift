//
//  IssueFilterViewController.swift
//  IssueTracker
//
//  Created by 박성민 on 2020/11/05.
//

import UIKit

class IssueFilterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func cancelButtonDidTouch(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonDidTouch(_ sender: Any) {
        // 처리
        dismiss(animated: true, completion: nil)
    }
    
}
