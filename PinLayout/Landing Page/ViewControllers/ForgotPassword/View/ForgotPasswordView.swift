//
//  ForgotPasswordView.swift
//  Landing Page
//
//  Created by macuser on 25.08.2021.
//  
//

import UIKit


// MARK: - ForgotPasswordViewDelegate

protocol ForgotPasswordViewDelegate: class {
  
  func viewContinueAction(view: ForgotPasswordViewProtocol)
}


// MARK: - ForgotPasswordViewProtocol

protocol ForgotPasswordViewProtocol: UIView {
  
  func setState(_ state:TextInputFieldView.State)
  var delegate: ForgotPasswordViewDelegate? { get set }
}


// MARK: - ForgotPasswordView

class ForgotPasswordView: UIView, ForgotPasswordViewProtocol {
  
  let inputMailView: TextInputFieldView = TextInputFieldView.create()
  
  func setState(_ state: TextInputFieldView.State) {
    inputMailView.snapshot = state
  }
  
  
  // MARK: - ForgotPasswordView interface methods
  
  @IBOutlet private weak var titleLabel: UILabel!
  @IBOutlet private weak var viewForInputMail: UIView!
  @IBOutlet private weak var continueButton: UIButton!
  
  weak var delegate: ForgotPasswordViewDelegate?
  
  
  // MARK: - Overrided methods
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    setupUI()
    setValuesForgotPasswordView()
  }
  
  @IBAction func continueButton(_ sender: Any) {
    self.delegate?.viewContinueAction(view: self)
  }
}

private extension ForgotPasswordView {
  func setupUI() {
    viewForInputMail.addSubview(inputMailView)
    inputMailView.translatesAutoresizingMaskIntoConstraints = false
    inputMailView.layoutAttachAll(to: viewForInputMail)
  }
  
  func setValuesForgotPasswordView() {
    titleLabel.text = "Forgot password?"
    titleLabel.font = UIFont.systemFont(ofSize: 28, weight: .heavy)
    continueButton.layer.cornerRadius = 10
    continueButton.backgroundColor = myBlueColor
  }
}
