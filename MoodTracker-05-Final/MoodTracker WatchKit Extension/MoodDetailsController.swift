//
//  MoodDetailsController.swift
//  MoodTracker
//
//  Created by Greg Heo on 2014-11-24.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

import Foundation
import WatchKit

class MoodDetailsController: WKInterfaceController {

  let moodNames = ["OK", "Not Bad", "Hmmm", "Anger", "RAWR"]
  var currentMood = 0

  @IBOutlet weak var moodImage: WKInterfaceImage!
  @IBOutlet weak var moodNameLabel: WKInterfaceLabel!
  @IBOutlet weak var moodDescriptionLabel: WKInterfaceLabel!
  @IBOutlet weak var moodAdviceLabel: WKInterfaceLabel!

  override func awakeWithContext(context: AnyObject!) {
    super.awakeWithContext(context)

    if let moodContextData = context as? MoodContextData {
      currentMood = moodContextData.moodIndex
    }
  }

  override func willActivate() {
    super.willActivate()

    moodImage.setImageNamed("rage\(currentMood)")
    let moodName = moodNames[currentMood]
    moodNameLabel.setText(moodName)
    moodDescriptionLabel.setText("You are feeling SO \(moodName), eh?")
  }
}













