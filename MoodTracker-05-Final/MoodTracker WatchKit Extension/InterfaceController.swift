//
//  InterfaceController.swift
//  MoodTracker WatchKit Extension
//
//  Created by Greg Heo on 2014-11-20.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

import WatchKit
import Foundation

class MoodContextData {
  let moodIndex: Int

  init(moodIndex: Int) {
    self.moodIndex = moodIndex
  }
}

class InterfaceController: WKInterfaceController {

  @IBOutlet weak var moodImage: WKInterfaceImage!
  var currentMood: Int = 0
  var shouldShowAdvice = true

  override func awakeWithContext(context: AnyObject!) {
    super.awakeWithContext(context)

    // Configure interface objects here.
    NSLog("%@ awake", self)
  }

  override func willActivate() {
    // This method is called when watch view controller is about to be visible to user
    super.willActivate()
    NSLog("%@ will activate", self)
  }

  override func didDeactivate() {
    // This method is called when watch view controller is no longer visible
    NSLog("%@ did deactivate", self)
    super.didDeactivate()
  }

  func switchValueChanged(value: Bool) {
    shouldShowAdvice = value
    print("Current switch value: \(shouldShowAdvice)")
  }

  func moodSliderChanged(value: Float) {
    currentMood = Int(value)
    print("Current mood: \(currentMood)")

    updateMoodImage()
  }

  override func contextForSegueWithIdentifier(segueIdentifier: String) -> AnyObject? {
    if segueIdentifier == "RecordMoodSegue" {
      return MoodContextData(moodIndex: currentMood)
    }

    return nil
  }

  func updateMoodImage() {
    if currentMood < 0 || currentMood > 4 {
      return
    }

    moodImage.setImageNamed("rage\(currentMood)")
  }
  
  @IBAction func helpButtonTapped() {
    presentControllerWithName("HelpController", context: nil)
  }
}
