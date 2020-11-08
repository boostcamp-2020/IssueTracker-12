//
//  IsueeDetailViewController.swift
//  IssueTracker
//
//  Created by 이승진 on 2020/10/27.
//

import UIKit
import FloatingPanel

class IssueDetailViewController: UIViewController, FloatingPanelControllerDelegate {
    
    @IBOutlet weak var commentTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    
    private func configure() {
        
        let attributeFloatingPanel = FloatingPanelController()
        attributeFloatingPanel.delegate = self
        
        guard let attributeVC = storyboard?.instantiateViewController(identifier: IssueAttributeFloatingViewController.reuseIdentifier) as? IssueAttributeFloatingViewController
        else { return }
        attributeFloatingPanel.set(contentViewController: attributeVC)
        attributeFloatingPanel.addPanel(toParent: self)
        
        commentTableView.delegate = self
        commentTableView.dataSource = self
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editButtonDidTouch))
        
    }
    
    @objc func editButtonDidTouch() {
        
    }
    
}

extension IssueDetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: IssueDetailTableViewCell.reuseIdentifier, for: indexPath) as? IssueDetailTableViewCell else {
                    return UITableViewCell()
                }
        
        cell.setupView()
        return cell
    }
}

extension IssueDetailViewController: UITableViewDelegate {
    
}