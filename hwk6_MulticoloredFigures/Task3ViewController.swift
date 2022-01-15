//
//  Task3ViewController.swift
//  hwk6_MulticoloredFigures
//
//  Created by Kyzu on 14.01.22.
//

import UIKit

class Task3ViewController: UIViewController {

    var customView: UIView!
    var viewForCircle: UIView!
    var circle: UIView!
    var leftButton: UIButton!
    var rightButton: UIButton!
    var topButton: UIButton!
    var bottomButton: UIButton!
    var backButton: UIButton!

    override func loadView() {
        customView = UIView(frame: UIScreen.main.bounds)
        view = customView
        view.backgroundColor = UIColor(red: 0.8196, green: 0.6745, blue: 0.5137, alpha: 1.0)
        
        viewForCircle = UIView()
        viewForCircle.backgroundColor = UIColor(red: 1, green: 0.8078, blue: 0.6275, alpha: 1.0)
        
        circle = UIView()
        circle.backgroundColor = .brown
        
        backButton = UIButton()
        backButton.backgroundColor = .black
        backButton.setTitle("Back", for: .normal)
        backButton.addTarget(self, action: #selector(onBackButton), for: .touchUpInside)
        
        leftButton = UIButton()
        let leftButtonImage = UIImage(named: "left")
        leftButton.setImage(leftButtonImage, for: .normal)
        leftButton.addTarget(self, action: #selector(onLeftButton), for: .touchUpInside)
        
        topButton = UIButton()
        topButton.setImage(UIImage(named: "top"), for: .normal)
        topButton.addTarget(self, action: #selector(onTopButton), for: .touchUpInside)
        
        bottomButton = UIButton()
        bottomButton.setImage(UIImage(named: "bottom"), for: .normal)
        bottomButton.addTarget(self, action: #selector(onBottomButton), for: .touchUpInside)
        
        rightButton = UIButton()
        rightButton.setImage(UIImage(named: "right"), for: .normal)
        rightButton.addTarget(self, action: #selector(onRightButton), for: .touchUpInside)
    
        view.addSubview(viewForCircle)
        view.addSubview(circle)
        view.addSubview(backButton)
        view.addSubview(leftButton)
        view.addSubview(topButton)
        view.addSubview(bottomButton)
        view.addSubview(rightButton)
    }
    
    override func viewWillLayoutSubviews() {
        viewForCircle.frame = CGRect(x: view.bounds.minX, y: view.safeAreaLayoutGuide.layoutFrame.minY, width: view.bounds.maxX, height: view.bounds.maxY-70)
        
        circle.frame = CGRect(x: viewForCircle.bounds.midX - 100, y: viewForCircle.bounds.midY - 100, width: 200, height: 200)
        circle.layer.cornerRadius = circle.bounds.width / 2
        circle.layer.masksToBounds = true
        
        backButton.frame = CGRect(x: view.bounds.midX - 180, y: view.bounds.maxY - 45, width: 60, height: 40)
        
        let leftButtonRect = backButton.frame.offsetBy(dx: 75, dy: 0)
        leftButton.frame = leftButtonRect
        
        let topButtonRect = leftButton.frame.offsetBy(dx: 75, dy: 0)
        topButton.frame = topButtonRect
        
        let bottomButtonRect = topButton.frame.offsetBy(dx: 75, dy: 0)
        bottomButton.frame = bottomButtonRect
        
        let rightButtonRect = bottomButton.frame.offsetBy(dx: 75, dy: 0)
        rightButton.frame = rightButtonRect
    }
    
    @objc func onBackButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func onLeftButton() {
        if circle.frame.minX > viewForCircle.bounds.minX + 10 {
            
            circle.frame.origin.x -= 10
        } else if circle.frame.minX >= viewForCircle.bounds.minX {
            circle.frame.origin.x = 0
        }
    }
    
    @objc func onTopButton() {
        if circle.frame.minY > viewForCircle.frame.minY + 10 {
            print(circle.frame.minY)
            print(viewForCircle.frame.minY)
            circle.frame.origin.y -= 10
            print(circle.frame.origin.y)
            
        } else if circle.frame.minY >= viewForCircle.bounds.minY {
            print(viewForCircle.bounds.minY)
            circle.frame.origin.y = viewForCircle.frame.minY
        }
    }

    @objc func onBottomButton() {
        if circle.frame.maxY < viewForCircle.frame.maxY - 10 {
            circle.frame.origin.y += 10
        } else if circle.frame.maxY <= viewForCircle.frame.maxY {
            circle.frame.origin.y = viewForCircle.frame.maxY - circle.frame.height
        }
    }
    
    @objc func onRightButton() {
        if circle.frame.maxX < viewForCircle.bounds.maxX - 10 {
            circle.frame.origin.x += 10
        } else if circle.frame.maxX <= viewForCircle.bounds.maxX {
            circle.frame.origin.x = viewForCircle.bounds.maxX - circle.frame.width
        }
    }


}
