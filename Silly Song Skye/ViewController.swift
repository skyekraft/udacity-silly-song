//
//  ViewController.swift
//  Silly Song Skye
//
//  Created by AC Loaner on 9/16/16.
//  Copyright © 2016 AC Loaner. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var lyricsView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func reset(sender: AnyObject) {
        nameField.text = ""
        lyricsView.text = ""
    }
    
    @IBAction func displayLyrics(sender: AnyObject) {
        if let nameField = nameField.text {
        lyricsView.text = lyricsForName(bananaFanaTemplate, fullName: nameField)
    }

}

func shortNameFromName(fullName: String) -> String {
    let stepOne = fullName.lowercaseString.stringByFoldingWithOptions(.DiacriticInsensitiveSearch, locale: nil)
    let vowels = NSCharacterSet(charactersInString: "aeiouy")
    
    if let firstVowel = stepOne.rangeOfCharacterFromSet(vowels, options: .CaseInsensitiveSearch) {
        return stepOne.substringFromIndex(firstVowel.startIndex)
    }
    return stepOne
}


let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joinWithSeparator("\n")

func lyricsForName(bananaFanaTemplate: String, fullName: String) -> String {
    let stepOne = shortNameFromName(fullName)
    let lyrics = bananaFanaTemplate.stringByReplacingOccurrencesOfString("<FULL_NAME>", withString:  fullName).stringByReplacingOccurrencesOfString("<SHORT_NAME>", withString: stepOne)
    
    return lyrics
}
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}