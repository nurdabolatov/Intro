//
//  ViewController.swift
//  Intro
//
//  Created by Nurdaulet on 12/22/2016.
//  Copyright (c) 2016 Nurdaulet. All rights reserved.
//

import UIKit
import Intro

final class ViewController: UIViewController {

    fileprivate var showButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        configureShowButton()
    }

    fileprivate func configureShowButton() {
        showButton.setTitle("Show", for: .normal)
        showButton.setTitleColor(.blue, for: .normal)
        showButton.addTarget(self, action: #selector(showIntro), for: .touchUpInside)
        view.addSubview(showButton)
        showButton.frame = CGRect(x: 0, y: 0, width: 100, height: 20)
        showButton.center = view.center
    }

    @objc fileprivate func showIntro() {
        let vc = IntroViewController()
        let lorem = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor"
        vc.items = [
            (lorem, UIImage(named: "1")),
            (lorem, UIImage(named: "2")),
            (lorem, UIImage(named: "3")),
            (lorem, UIImage(named: "4")),
            (lorem, UIImage(named: "5")),
            (lorem, UIImage(named: "6")),
            (lorem, UIImage(named: "7")),
            (lorem, UIImage(named: "8")),
            (lorem, UIImage(named: "9")),
            (lorem, UIImage(named: "10"))
        ]
        vc.animationType = .rotate
        vc.titleColor = .black
        vc.titleFont = .systemFont(ofSize: 20)
        vc.imageContentMode = .scaleAspectFit
        vc.closeTitle = "READY"
        vc.closeColor = .white
        vc.closeBackgroundColor = .black
        vc.closeBorderWidth = 0
        vc.closeBorderColor = UIColor.black.cgColor
        vc.closeCornerRadius = 2
        vc.didClose = {
            self.showButton.setTitle("Show again", for: .normal)
        }
        present(vc, animated: true, completion: nil)
    }

}

