//
//  LabelEditViewController.swift
//  IssueTracker
//
//  Created by 박성민 on 2020/10/29.
//

import UIKit

class LabelEditViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var colorTextField: UITextField!
    @IBOutlet weak var labelPreviewLabel: PaddedLabel!
    @IBOutlet weak var randomColorButton: UIButton!
    
    private var isNew: Bool = true
    private var label: Label?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        colorTextField.addTarget(self, action: #selector(setColorFromTextField), for: .editingChanged)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height / 2
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func initEditView(isNew: Bool, label: Label?) {
        self.isNew = isNew
        if isNew {
            DispatchQueue.main.async { [weak self] in
                self?.nameTextField.text = ""
                self?.descriptionTextField.text = ""
                self?.setLabelColor(color: nil)
            }
        } else {
            self.label = label
            DispatchQueue.main.async { [weak self] in
                self?.nameTextField.text = label?.labelName
                self?.descriptionTextField.text = label?.description
                self?.setLabelColor(color: UIColor(hex: label?.color ?? "#000000"))
            }
        }
    }
    
    @objc func setColorFromTextField() {
        if let color = UIColor(hex: colorTextField.text ?? "") {
            setLabelColor(color: color)
        }
    }
    
    private func setLabelColor(color: UIColor?) {
        var labelColor: UIColor
        
        if let color = color {
            labelColor = color
        } else {
            labelColor = UIColor.getRandomColor()
        }
        DispatchQueue.main.async { [weak self] in
            self?.labelPreviewLabel.backgroundColor = labelColor
            self?.labelPreviewLabel.textColor = labelColor.textColor
            self?.randomColorButton.backgroundColor = labelColor
            self?.colorTextField.text = labelColor.toHexString()
        }
    }
    
    @IBAction func resetButtonDidTouch(_ sender: Any) {
        initEditView(isNew: isNew, label: self.label)
    }
    
    @IBAction func randomColorButtonDidTouch(_ sender: Any) {
        setLabelColor(color: nil)
    }
    
    @IBAction func saveButtonDidTouch(_ sender: Any) {
        guard let labelName = nameTextField.text,
              let description = descriptionTextField.text,
              let color = colorTextField.text else { return }
        
        if isNew {
            newLabelSave(label: Label(labelName: labelName, description: description, color: color))
        } else {
            label?.labelName = labelName
            label?.description = description
            label?.color = color
            if let label = label {
                editLabelSave(label: label)
            }
        }
        dismiss(animated: true, completion: nil)
    }
    
    private func newLabelSave(label: Label) {
        
        guard let labelURL = URL(string: URLs.label.rawValue) else { return }
        NetworkManager.shared.postRequest(url: labelURL, object: label, type: Label.self) { _ in

            NotificationCenter.default.post(name: .labelDidChange, object: nil)
        }
    }
    
    private func editLabelSave(label: Label) {
        //put
        NetworkManager.shared.putRequest(url: .label, updateID: label.labelId, object: label, type: Label.self) { nsDictionary in
            print(nsDictionary)
            NotificationCenter.default.post(name: .labelDidChange, object: nil)
        }
    }
    
    @IBAction func closeButtonDidTouch(_ sender: Any) {
        dismiss(animated: true)
    }
}
