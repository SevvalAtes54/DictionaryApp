//
//  ViewController.swift
//  DictionaryApp
//
//  Created by Macbook Air on 23.08.2023.
//
//magnifyingglass
import UIKit
import TinyConstraints

class ViewController: UIViewController ,UITextFieldDelegate,DictionaryManagerDelegate{
  
    
   
    var target: UIViewController!
    var dictionaryManager = DictionaryManager()
    
 
  
//    let label: UITextField = {
//        let textfield = UITextField()
//        textfield.placeholder = "Search anything..."
//        textfield.backgroundColor = .white
//        textfield.layer.cornerRadius = 7
//
//        return textfield
//    }()
    
    let logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "kitten")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background") // Asset ismiyle eşleştirin
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let aramaTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Search anything..."
        textfield.backgroundColor = .white
       
        textfield.layer.cornerRadius = 7
       
        return textfield
    }()
    
    let buyutecButton: UIButton = {
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.addTarget(target, action: #selector(buyutecButtonTapped), for: .touchUpInside)
        button.setImage(UIImage(named: "arama"), for: .normal)
    
        return button
    }()
    let labelpronounce: UILabel = {
        let label = UILabel()
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let labelspeech: UILabel = {
        let label = UILabel()
        label.text = "*:･ﾟ★*:･ﾟ☆*:･ﾟ★*:･ﾟ☆*:･ﾟ"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let labelSimge: UILabel = {
        let label = UILabel()
        label.text = "*:･ﾟ★*:･ﾟ☆*:･ﾟ★*:･ﾟ☆*:･ﾟ"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let textviewforMeaning: UITextView = {
        let textView = UITextView()
        textView.text = "If you type something, you will see the magic :)"
        
        textView.translatesAutoresizingMaskIntoConstraints = false
       
        return textView
    }()
    
    // var textDelegate : UITextFieldDelegate!
    override func viewDidLoad() {
        super.viewDidLoad()
        dictionaryManager.delegate = self
        buyutecButton.addTarget(self, action: #selector(buyutecButtonTapped), for: .touchUpInside)
//        view.image(UIImage(named: "background"))
        view.addSubview(logoImage)
        view.addSubview(backgroundImage)
        view.addSubview(aramaTextField)
        view.addSubview(buyutecButton)
        view.addSubview(textviewforMeaning)
        view.addSubview(labelpronounce)
        view.addSubview(labelSimge)
        buyutecButton.addTarget(target, action: #selector(buyutecButtonTapped), for: .touchUpInside)
        backgroundImage.edgesToSuperview()

        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLoad()
        super.viewDidLayoutSubviews()
         // Set the frame of the scroll view to cover the entire view

        // Add constraints to the text view to match the size of the scroll view's content
         // Use TinyConstraints or Auto Layout to set the text view's constraints

//
        aramaTextField.translatesAutoresizingMaskIntoConstraints = false
        buyutecButton.translatesAutoresizingMaskIntoConstraints = false
        textviewforMeaning.translatesAutoresizingMaskIntoConstraints = false
        labelpronounce.translatesAutoresizingMaskIntoConstraints = false
        labelspeech.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(buyutecButton)
        view.addSubview(backgroundImage)
        view.addSubview(aramaTextField)
        view.addSubview(textviewforMeaning)
        view.addSubview(labelpronounce)
        view.addSubview(labelspeech)
       
        view.addSubview(aramaTextField)
        aramaTextField.leadingToSuperview(offset:20)
        aramaTextField.width(295)
        aramaTextField.height(40)
        aramaTextField.topToSuperview(offset: 130)
        
       
        view.addSubview(buyutecButton)
        buyutecButton.topToSuperview(offset: 130)
        buyutecButton.trailingToSuperview(offset: 20)
        buyutecButton.width(40)
        buyutecButton.height(40)
        
        
        
        view.addSubview(logoImage)
        logoImage.topToSuperview(offset: 430)
        logoImage.centerXToSuperview()
        logoImage.width(200)
        logoImage.height(200)
        
        view.addSubview(labelSimge)
        labelSimge.topToBottom(of: logoImage, offset: 2)
        labelSimge.font = UIFont.systemFont(ofSize: 25,weight: .bold)
        labelSimge.leadingToSuperview(offset:25)
        
        view.addSubview(textviewforMeaning)
        textviewforMeaning.topToSuperview(offset: 300)
        textviewforMeaning.leadingToSuperview(offset:20)
        textviewforMeaning.width(300)
        textviewforMeaning.height(300)
        textviewforMeaning.backgroundColor = UIColor.clear
        textviewforMeaning.isOpaque = false
        textviewforMeaning.font = UIFont.systemFont(ofSize: 22)
        
//        let scrollView = UIScrollView()
//        view.addSubview(scrollView)
//        scrollView.addSubview(textviewforMeaning)
//        scrollView.frame = view.bounds
        
        view.addSubview(labelpronounce)
        labelpronounce.leadingToSuperview(offset:25)
        labelpronounce.topToSuperview(offset: 270)
        labelpronounce.font = UIFont.systemFont(ofSize: 25,weight: .bold)
   
        view.addSubview(labelspeech)
        labelspeech.leadingToSuperview(offset:25)
        labelspeech.bottomToTop(of: labelpronounce, offset: 2)
//labelpronounce.topToSuperview(offset: 200)
        labelspeech.font = UIFont.systemFont(ofSize: 25,weight: .bold)
      
       
        
    }
   
    @objc func buyutecButtonTapped() {
        if  let word = aramaTextField.text{
          dictionaryManager.fetchData(word: word)
           
            
        }
         
      
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return false
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if aramaTextField.text != "" {
            return true
        }
        else {
            aramaTextField.placeholder = "Search anything"
            return false
        }
        
    }
    @IBAction func buyutecButton (sender: Any?){
        aramaTextField.endEditing(true)
        
    }
    
    private func textFieldShouldBeginEditing(_ textField: UITextField)  {
        aramaTextField.placeholder = "Search anything"
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, dictionaryManager : DictionaryManager) {
//        if let word = aramaTextField.text{
//            dictionaryManager.fetchData(word: word)
//        }
        aramaTextField.text = ""
        
    }
    func handleFetchedData(veri: DictionaryModel) {
        DispatchQueue.main.async {
            self.textviewforMeaning.text = veri.description
            self.labelpronounce.text = veri.phonetic
            self.labelspeech.text = veri.speech.capitalized
            
        }
    }
   
    func didReceiveData(veri: DictionaryModel, _ manager: DictionaryManager) {
        handleFetchedData(veri: veri)
    }
    
}

