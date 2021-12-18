//
//  LoginViewController.swift
//  Landing Page
//
//  Created by macuser on 19.08.2021.
//

import UIKit
import PinLayout


final class LoginViewController: UIViewController {
  
  // MARK: - Defaults
  fileprivate enum Defaults {
    
    enum StackView {
      static let height: CGFloat = 50
      static let top: CGFloat = 50
      static let horizont: CGFloat = 50
    }
    
    enum Title {
      static let horizont: CGFloat = 20
      static let top: CGFloat = 20
    }
    
    enum Description {
      static let horizont: CGFloat = 20
      static let top: CGFloat = 20
    }
    
    enum Button {
      static let height: CGFloat = 55
      static let horizontal: CGFloat = 20
      static let bottom: CGFloat = 30
      static let cornerRadius: CGFloat = 10
    }
    
    enum TextField {
      static let height: CGFloat = 90
      static let horizontal: CGFloat = 10
      static let centerMargin: CGFloat = -50
    }
    
    enum BottomImage {
      static let height: CGFloat = 110
    }
  }
  
  // MARK: - Properties
  private let stackView: UIStackView = {
    $0.axis = .horizontal
    $0.alignment = .fill
    $0.distribution = .fillEqually
    return $0
  }(UIStackView())
  
  private let mainTitleLabel: UILabel = {
    $0.text = "Appella"
    $0.textColor = .black
    $0.font = UIFont.systemFont(ofSize: 28, weight: .black)
    return $0
  }(UILabel())
  
  private let mainTitleIconImageView: UIImageView = {
    $0.image = UIImage(named: "piano2")
    $0.contentMode = .scaleAspectFit
    return $0
  }(UIImageView())
  
  private let titleLabel: UILabel = {
    $0.text = "Let's get started."
    $0.textColor = myBlueColor
    $0.textAlignment = .center
    $0.numberOfLines = 1
    $0.font = UIFont.systemFont(ofSize: 28, weight: .heavy)
    return $0
  }(UILabel())
  
  private let descriptionLabel: UILabel = {
    $0.text = "Make the school app \nyour personal assistant"
    $0.textColor = .gray
    $0.textAlignment = .center
    $0.numberOfLines = 0
    $0.font = UIFont.systemFont(ofSize: 17, weight: .thin)
    return $0
  }(UILabel())
  
  private let button: UIButton = {
    $0.backgroundColor = .blue
    $0.layer.cornerRadius = Defaults.Button.cornerRadius
    $0.setTitle("Start", for: .normal)
    $0.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
    $0.addTarget(self, action: #selector(startAction), for: .touchUpInside)
    return $0
  }(UIButton())
  
  private let bottomImageView: UIImageView = {
    $0.image = UIImage(named: "back2")
    $0.contentMode = .scaleAspectFill
    return $0
  }(UIImageView())
  
  private let textField: TextInputFieldView = {
    let textField: TextInputFieldView = TextInputFieldView.create()
    textField.snapshot = .init(title: "username".uppercased(), leftImage: (UIImage(named: "user")?.withTintColor(myBlueColor, renderingMode: .alwaysOriginal))!, textPlaceholder: "your username")
    return textField
  }()
  
  // MARK: - Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
    setupGestureRecognizers()
  }
}

// MARK: - Private
private extension LoginViewController {
  func setup() {
    [mainTitleIconImageView, mainTitleLabel].forEach {
      stackView.addArrangedSubview($0)
    }
    [stackView, titleLabel, descriptionLabel, bottomImageView, button, textField].forEach {
      view.addSubview($0)
    }
    makePin()
  }
  
  func setupGestureRecognizers() {
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapGesture))
    view.addGestureRecognizer(tapGesture)
  }
  
  @objc func tapGesture() {
    view.endEditing(true)
  }
  
  @objc func startAction() {
  }
}

// MARK: - Constraints
private extension LoginViewController {
  func makePin() {
    //StackView
    stackView.pin.top(Defaults.StackView.top).height(Defaults.StackView.height).left(Defaults.StackView.horizont).right(Defaults.StackView.horizont)
    //Title
    titleLabel.pin.left(Defaults.Title.horizont).right(Defaults.Title.horizont).below(of: stackView).margin(Defaults.Title.top).sizeToFit(.width)
    //Description
    descriptionLabel.pin.left(Defaults.Description.horizont).right(Defaults.Description.horizont).below(of: titleLabel).margin(Defaults.Description.top).sizeToFit(.width)
    //TextField
    textField.pin.height(Defaults.TextField.height).left(Defaults.TextField.horizontal).right(Defaults.TextField.horizontal).vCenter(Defaults.TextField.centerMargin)
    //BottomView
    bottomImageView.pin.left().right().bottom().height(Defaults.BottomImage.height)
    //Button
    button.pin.height(Defaults.Button.height).left(Defaults.Button.horizontal).right(Defaults.Button.horizontal).above(of: bottomImageView).margin(Defaults.Button.bottom)
  }
}
