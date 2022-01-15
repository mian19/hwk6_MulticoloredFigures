//
//  Task2ViewController.swift
//  hwk6_MulticoloredFigures
//
//  Created by Kyzu on 14.01.22.
//

import UIKit

class Task2ViewController:  UIViewController {
    
    var customView: UIView!
    var viewForSquares: UIView!
    var square: UIView!
    var fillButton: UIButton!
    var clearButton: UIButton!
    var backButton: UIButton!
    
    
    override func loadView() {
        customView = UIView(frame: UIScreen.main.bounds)
        view = customView
        view.backgroundColor = UIColor(red: 0.6039, green: 0.8549, blue: 0.8863, alpha: 1.0)
        
        viewForSquares = UIView()
        viewForSquares.backgroundColor = .white
        
        backButton = UIButton(frame: CGRect(x: view.bounds.midX-170, y: view.bounds.maxY - 80, width: 100, height: 40))
        backButton.setTitle("Back", for: .normal)
        backButton.backgroundColor = .black
        backButton.addTarget(self, action: #selector(onBackButton), for: .touchUpInside)
        
        fillButton = UIButton()
        let fillButtonRect = backButton.frame.offsetBy(dx: 120, dy: 0)
        fillButton.frame = fillButtonRect
        fillButton.setTitle("Fill", for: .normal)
        fillButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        fillButton.backgroundColor = UIColor(red: 0.3961, green: 0.2078, blue: 0.749, alpha: 1.0)
        fillButton.addTarget(self, action: #selector(onFillButton), for: .touchUpInside)
        
        clearButton = UIButton()
        let clearButtonRect = fillButton.frame.offsetBy(dx: 120, dy: 0)
        clearButton.frame = clearButtonRect
        clearButton.setTitle("Clear", for: .normal)
        clearButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        clearButton.backgroundColor = UIColor(red: 0.2039, green: 0.5098, blue: 0.1412, alpha: 1.0)
        clearButton.addTarget(self, action: #selector(onClearButton), for: .touchUpInside)
        
        view.addSubview(viewForSquares)
        view.addSubview(backButton)
        view.addSubview(fillButton)
        view.addSubview(clearButton)
    }
    
    override func viewWillLayoutSubviews() {
        viewForSquares.frame = CGRect(x: view.safeAreaLayoutGuide.layoutFrame.minX, y: view.safeAreaLayoutGuide.layoutFrame.minY, width: view.bounds.width, height: view.safeAreaLayoutGuide.layoutFrame.maxY-100)
    }
    
    @objc func onBackButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func onFillButton() {
        
        var x = viewForSquares.bounds.minX
        var y = viewForSquares.bounds.minY
        let maxX = viewForSquares.bounds.maxX
        let maxY = viewForSquares.bounds.maxY
        var isEmptyPlace = true
        
        while isEmptyPlace {
            square = UIView(frame: CGRect(x: x, y: y, width: 50, height: 50))
            square.backgroundColor = generateColor()
            if x < maxX && y < maxY && (maxY-y) >= square.frame.height {
                viewForSquares.addSubview(square)
                x += square.frame.width
            } else if x < maxX && (maxY-y) < square.frame.height {
                square.frame.size = CGSize(width: 50, height: maxY-y)
                viewForSquares.addSubview(square)
                x += square.frame.width
            }
            else if x >= maxX && y < maxY-square.frame.height {
                x = viewForSquares.frame.minX
                y += square.frame.height
            } else if y >= maxY-square.frame.height {
                isEmptyPlace.toggle()
            }
        }
    }
    
    @objc func onClearButton() {
        for elem in viewForSquares.subviews {
            elem.removeFromSuperview()
        }
    }
    
    private func generateColor() -> UIColor {
        UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1.0)
    }
    
}
