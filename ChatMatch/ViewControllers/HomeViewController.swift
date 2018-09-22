//
//  HomeViewController.swift
//  ChatMatch
//
//  Created by Daniel Yo on 9/19/18.
//  Copyright © 2018 Daniel Yo. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class HomeViewController: BaseViewController {

    // MARK: - Properties
    var labelMessage:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Lato-Bold", size: 25)
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.text = "How it works"
        return label
    }()
    
    private var buttonLogin:UIButton = {
        let button = UIButton()
        button.setTitle("LOG IN", for: UIControlState.normal)
        button.titleLabel?.font = UIFont(name: AppTheme().mainFontName(), size: 20)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.textColor = UIColor.white
        button.layer.cornerRadius = 5;
        button.layer.borderWidth = 1;
        button.layer.borderColor = AppTheme().selectedItemColor().cgColor;
        button.backgroundColor = AppTheme().selectedItemColor()
        button.addTarget(self, action: #selector(buttonLogin_touchUpInside), for: .touchUpInside)
        return button
    }()
    
    private var buttonSignup:UIButton = {
        let button = UIButton()
        button.setTitle("SIGN UP", for: UIControlState.normal)
        button.titleLabel?.font = UIFont(name: AppTheme().mainFontName(), size: 20)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.textColor = UIColor.white
        button.layer.cornerRadius = 5;
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.init(hexString: "#65c9e3").cgColor;
        button.backgroundColor = UIColor.init(hexString: "#65c9e3")
        button.addTarget(self, action: #selector(buttonSignup_touchUpInside), for: .touchUpInside)
        return button
    }()
    
    private var buttonPlay:UIButton = {
        let button = UIButton()
        button.setTitle("PLAY", for: UIControlState.normal)
        button.titleLabel?.font = UIFont(name: "Lato-Bold", size: 20)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.textColor = UIColor.white
        button.imageView?.contentMode = .scaleAspectFit
        button.layer.borderWidth = 10
        button.imageEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right:20)
        button.clipsToBounds = true
        button.layer.cornerRadius = 100 // needs to be half width
        button.layer.borderColor = UIColor.init(hexString: "#d4f2fa").cgColor;
        button.backgroundColor = UIColor.init(hexString: "#54ccec")
        button.addTarget(self, action: #selector(buttonPlay_touchUpInside), for: .touchUpInside)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Private API
    private func setup() {
        let fontFamilyNames = UIFont.familyNames
        for familyName in fontFamilyNames {
            //Check the Font names of the Font Family
            let names = UIFont.fontNames(forFamilyName: familyName )
            // Write out the Font Famaily name and the Font's names of the Font Family
            print("Font == \(familyName) \(names)")
        }
        
        self.title = "Home"
        
        // Play button
        self.view.addSubview(self.buttonPlay)
        self.buttonPlay.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.height.equalTo(200)
            make.width.equalTo(200)
        }
        
        // message
        self.view.addSubview(self.labelMessage)
        self.labelMessage.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.buttonPlay.snp.bottom).offset(10)
        }
        
        // login button
        self.view.addSubview(self.buttonLogin)
        self.buttonLogin.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(self.labelMessage.snp.bottom).offset(20)
            make.height.equalTo(50)
        }
        
        // signup button
        self.view.addSubview(self.buttonSignup)
        self.buttonSignup.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(self.buttonLogin.snp.bottom).offset(20)
            make.height.equalTo(50)
        }
        
    }
    private func playVideo() {
        guard let path = Bundle.main.path(forResource: "howitworks", ofType:"mp4") else {
            debugPrint("video not found")
            return
        }
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerController = AVPlayerViewController()
        playerController.player = player
        present(playerController, animated: true) {
            player.play()
        }
    }
    
    // MARK: UIResponder
    @objc func buttonLogin_touchUpInside(sender:UIButton!) {
        self.navigateToWebView(withURLstring: "https://my.chatmatch.me/login/")
    }

    @objc func buttonSignup_touchUpInside(sender:UIButton!) {
        self.navigateToWebView(withURLstring: "https://my.chatmatch.me/login/")
    }
    @objc func buttonPlay_touchUpInside(sender:UIButton!) {
        self.playVideo()
    }
}
