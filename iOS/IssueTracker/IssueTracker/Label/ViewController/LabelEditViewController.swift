//
//  LabelEditViewController.swift
//  IssueTracker
//
//  Created by 박성민 on 2020/10/29.
//

import UIKit

class LabelEditViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var colorTextField: UITextField!
    @IBOutlet weak var colorPickerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func colorPickerButtonDidTouch(_ sender: Any) {
        presentColorPicker()
    }
    
    private func presentColorPicker() {
        let colorPicker = UIColorPickerViewController()
        colorPicker.delegate = self
        colorPicker.selectedColor = colorPickerButton.backgroundColor ?? UIColor.systemTeal
        colorPicker.title = "Color Picker"
        self.present(colorPicker, animated: true, completion: nil)
    }
    
    @IBAction func resetButtonDidTouch(_ sender: Any) {
        titleTextField.text = ""
        descriptionTextField.text = ""
        colorTextField.text = ""
    }
    @IBAction func randomColorButtonDidTouch(_ sender: Any) {
    
    }
    @IBAction func saveButtonDidTouch(_ sender: Any) {
    }
    
    @IBAction func closeButtonDidTouch(_ sender: Any) {
        dismiss(animated: true)
    }
}

extension LabelEditViewController: UIColorPickerViewControllerDelegate {
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        
    }
    
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        DispatchQueue.main.async { [weak self] in
            self?.colorTextField.text = viewController.selectedColor.toHexString()
            self?.colorPickerButton.backgroundColor = viewController.selectedColor
        }
    }
}
