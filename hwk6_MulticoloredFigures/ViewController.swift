//
//  ViewController.swift
//  hwk6_MulticoloredFigures
//
//  Created by Kyzu on 13.01.22.
//

import UIKit

class ViewController: UIViewController {
    var customView: UIView!
    var task1Button: UIButton!
    var task2Button: UIButton!
    var task3Button: UIButton!
    lazy var task1VC: Task1ViewController = getTask1VC()
    lazy var task2VC: Task2ViewController = getTask2VC()
    lazy var task3VC: Task3ViewController = getTask3VC()
    
    override func loadView() {
        customView = UIView(frame: UIScreen.main.bounds)
        customView.backgroundColor = UIColor(red: 1.00, green: 0.95, blue: 0.74, alpha: 1.00)
        view = customView
        
        task1Button = UIButton()
        task1Button.backgroundColor = .systemYellow
        task1Button.setTitle("Task 1", for: .normal)
        task1Button.titleLabel?.font = UIFont(name: "GillSans-Italic", size: 30)
        task1Button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        task1Button.setTitleColor(.systemBlue, for: .normal)
        task1Button.addTarget(self, action: #selector(onTask1Button), for: .touchUpInside)
        
        task2Button = UIButton()
        task2Button.backgroundColor = .systemYellow
        task2Button.setTitle("Task 2", for: .normal)
        task2Button.titleLabel?.font = UIFont(name: "GillSans-Italic", size: 30)
        task2Button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        task2Button.setTitleColor(.systemBlue, for: .normal)
        task2Button.addTarget(self, action: #selector(onTask2Button), for: .touchUpInside)
        
        task3Button = UIButton()
        task3Button.backgroundColor = .systemYellow
        task3Button.setTitle("Task 3", for: .normal)
        task3Button.titleLabel?.font = UIFont(name: "GillSans-Italic", size: 30)
        task3Button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        task3Button.setTitleColor(.systemBlue, for: .normal)
        task3Button.addTarget(self, action: #selector(onTask3Button), for: .touchUpInside)
        
        view.addSubview(task1Button)
        view.addSubview(task2Button)
        view.addSubview(task3Button)
    }
    
    override func viewWillLayoutSubviews() {
        task1Button.frame = CGRect(x: view.bounds.midX-75, y: view.bounds.midY-140, width: 150, height: 80)
        
        let task2ButtonRect = task1Button.frame.offsetBy(dx: 0, dy: 100)
        task2Button.frame = task2ButtonRect
        
        let task3ButtonRect = task2Button.frame.offsetBy(dx: 0, dy: 100)
        task3Button.frame = task3ButtonRect
    }
    
    @objc func onTask1Button() {
        self.present(task1VC, animated: true, completion: nil)
    }
    
    @objc func onTask2Button() {
        self.present(task2VC, animated: true, completion: nil)
    }
    
    @objc func onTask3Button() {
        self.present(task3VC, animated: true, completion: nil)
    }
    
    private func getTask1VC() -> Task1ViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewC = storyboard.instantiateViewController(withIdentifier: "Task1")
        viewC.modalPresentationStyle = .fullScreen
        return viewC as! Task1ViewController
    }
    
    private func getTask2VC() -> Task2ViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewC = storyboard.instantiateViewController(withIdentifier: "Task2")
        viewC.modalPresentationStyle = .fullScreen
        return viewC as! Task2ViewController
    }
    
    private func getTask3VC() -> Task3ViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewC = storyboard.instantiateViewController(withIdentifier: "Task3")
        viewC.modalPresentationStyle = .fullScreen
        return viewC as! Task3ViewController
    }

    
    }
    
 
    


