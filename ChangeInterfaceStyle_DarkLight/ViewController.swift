//
//  ViewController.swift
//  ChangeInterfaceStyle_DarkLight
//
//  Created by Maruf Howlader on 9/16/20.
//  Copyright © 2020 Creative Young. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let segment: UISegmentedControl = {
        let segment = UISegmentedControl()
        return segment
    }()
    let label : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 60, weight: .thin)
        label.tintColor = .label
        label.textAlignment = .center
        return label
    }()
    let defaults: UserDefaults? = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        segment.insertSegment(withTitle: "Dark", at: 0, animated: true)
        segment.insertSegment(withTitle: "Light", at: 1, animated: true)
        segment.selectedSegmentIndex = 0
        view.addSubview(segment)
        view.addSubview(label)
        loadCurrentInterfaceStyle()
        view.backgroundColor = .secondarySystemBackground
        segment.addTarget(self, action: #selector(changeInterfaceStyle), for: .valueChanged)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        segment.frame = CGRect(x: 50, y: 50, width: view.frame.width-100, height: 60)
        label.frame = CGRect(x: (view.frame.width-200)/2, y: (view.frame.height-100)/2, width: view.frame.width-200, height: 100)
    }
    private func loadCurrentInterfaceStyle(){
        guard let currentDefaults = defaults?.string(forKey: "interfaceStyle") else {
           overrideUserInterfaceStyle = .dark
           label.text = "Dark"
           segment.selectedSegmentIndex = 0
           return
        }
        if currentDefaults == "Light"{
            overrideUserInterfaceStyle = .light
            label.text = "Light"
            segment.selectedSegmentIndex = 1
            
        }else{
            overrideUserInterfaceStyle = .dark
            label.text = "Dark"
            segment.selectedSegmentIndex = 0
        }
//         print("Current User Defaults: \(currentDefaults)")
    }
    @objc private func changeInterfaceStyle(){
//        print(segment.selectedSegmentIndex)
        overrideUserInterfaceStyle = segment.selectedSegmentIndex == 0 ? .dark : .light
        label.text = segment.selectedSegmentIndex == 0 ? "Dark" : "Light"
        UserDefaults.standard.setValue(segment.selectedSegmentIndex == 0 ? "Dark" : "Light", forKey: "interfaceStyle")
    }
    
}
