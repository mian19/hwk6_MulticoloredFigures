//
//  Task1ViewController.swift
//  hwk6_MulticoloredFigures
//
//  Created by Kyzu on 13.01.22.
//
//1. Реализовать появление разноцветного кружочка на экране, по тапу на него, кружок исчезает и появляется в другом месте


import UIKit

class Task1ViewController: UIViewController {
    var customView: UIView!
    var button: UIButton!
    var backButton: UIButton!
    
    override func loadView() {
        customView = UIView(frame: UIScreen.main.bounds)
        view = customView
        view.backgroundColor = .gray
        
        button = UIButton()
        button.layer.cornerRadius = button.frame.width / 2
        button.layer.masksToBounds = true
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(onButtonClick), for: .touchUpInside)
        
        backButton = UIButton(frame: CGRect(x: view.bounds.midX-50, y: view.bounds.maxY-80, width: 100, height: 40))
        backButton.setTitle("Back", for: .normal)
        backButton.backgroundColor = .black
        backButton.addTarget(self, action: #selector(onBackButtonClick), for: .touchUpInside)
       
        view.addSubview(button)
        view.addSubview(backButton)
        
    }
    
    override func viewWillLayoutSubviews() {
        button.frame = generateCoordinatesForButton()
        button.layer.cornerRadius = button.frame.width / 2
        button.layer.masksToBounds = true
        button.backgroundColor = generateColor()
    }
    
    @objc func onButtonClick(button: UIButton) {
        button.frame = generateCoordinatesForButton()
        button.layer.cornerRadius = button.frame.width / 2
        button.layer.masksToBounds = true
        button.backgroundColor = generateColor()
    }
    
    @objc func onBackButtonClick() {
        self.dismiss(animated: true, completion: .none)
    }
    
    private func generateColor() -> UIColor {
        UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1.0)
    }
    
    private func generateCoordinatesForButton() -> CGRect{
        let diameter = generateSizeForButton()
        let width = view.bounds.maxX
        let height = view.bounds.maxY - diameter
        
        return CGRect(x: CGFloat.random(in: 0..<width-diameter), y: CGFloat.random(in: 0+diameter/2...height-80), width: diameter, height: diameter)
    }
    
    private func generateSizeForButton() -> CGFloat{
        CGFloat.random(in: 100...200)
    }
    
}
