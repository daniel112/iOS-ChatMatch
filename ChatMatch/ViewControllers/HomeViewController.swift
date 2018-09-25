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
        label.text = "See 'How it works' Video"
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
        let button = UIButton(type: UIButtonType.custom)
        let image = UIImage(named: "home_video_button")
        button.setImage(image, for: UIControlState.normal)
        button.addTarget(self, action: #selector(buttonPlay_touchUpInside), for: .touchUpInside)
        return button
    }()
    
    private var scrollView:UIScrollView = {
       let scrollview = UIScrollView()
        return scrollview
    }()
    
    fileprivate var imageViewBackground:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "background")
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }

    
    override func viewWillAppear(_ animated: Bool) {
    }
    override func viewWillDisappear(_ animated: Bool) {
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Private API
    private func setup() {
        
        self.title = "Home"
        
//        self.view.addSubview(self.imageViewBackground)
//        self.imageViewBackground.snp.makeConstraints { (make) in
//            make.edges.equalToSuperview()
//        }
        
        // scrollview
        self.view.addSubview(self.scrollView)
        self.scrollView.snp.makeConstraints { (make) in
            //make.edges.equalToSuperview()
            make.top.left.right.equalToSuperview()
        }
        
        // content
        let contentView = UIView()
        self.scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalToSuperview()

        }
        
        // Play button
        contentView.addSubview(self.buttonPlay)
        self.buttonPlay.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(300)
            make.width.equalTo(300)
        }
        
        // message
        contentView.addSubview(self.labelMessage)
        self.labelMessage.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.buttonPlay.snp.bottom).offset(10)
        }
        
        // login button
        contentView.addSubview(self.buttonLogin)
        self.buttonLogin.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(self.labelMessage.snp.bottom).offset(20)
            make.height.equalTo(50)
        }
        
        // signup button
        contentView.addSubview(self.buttonSignup)
        self.buttonSignup.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview()
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
