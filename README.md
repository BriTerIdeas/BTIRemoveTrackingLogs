# BTIRemoveTrackingLogs
by **Brian Slick**

Personal: [@BrianSlick](http://twitter.com/BrianSlick) | [Clinging To Ideas](http://clingingtoideas.blogspot.com)  
Business: [@BriTerIdeas](http://twitter.com/BriTerIdeas) | [briterideas.com](http://briterideas.com)


### What is this?

The following projects:

- [BTIRemoveTrackingLogs](https://github.com/BriTerIdeas/BTIRemoveTrackingLogs)
- [BTICommentTrackingLogs](https://github.com/BriTerIdeas/BTICommentTrackingLogs)
- [BITUncommentTrackingLogs](https://github.com/BriTerIdeas/BTIUncommentTrackingLogs)

...are a suite of companion services for [BTITrackingLogs](https://github.com/BriTerIdeas/BTITrackingLogs). Each one builds an Automator action that can then be used to make a text service.

As the name implies, this one is for removing the tracking logs created by BTITrackingLogs. This is handy in situations where you are messing with someone else's project. You are unfamiliar with the code, add some tracking logs to figure out how things work, and then are ready to commit a particular change. But you don't want these logs included, because it's not your project and the owner doesn't use this particular technique. So you can run this service, zap, they are gone.

### Usage

1. Select some text. Any text, doesn't have to just be a single method. Can be all of the text in a file.
2. Select the appropriate service from the Xcode -> Services menu
3. There is no step 3.

### Installation

- Acquire this project by the usual means
- Build the Action.  If a Mac app launches, you built the wrong thing
- Reveal the product in the Finder
- The .action file needs to be placed in ~/Library/Automator
- Launch Automator, and create a new Workflow using the Service template
- The settings at the top should be "text", "any application", and the "Output replaces selected text" checkbox should be ON
- Locate the custom action in the list. It might be in the "Recently Added" smart group. You may need to restart Automator to see it. Drag it into the workflow.
- Save. Give it a name you'll recognize, such as "Remove Tracking Logs"

This action will be available in the Services menu any time you have a text selection

Misc tip: During development I frequently found that Automator and/or the Services menu would cache previous states of the action.  Quitting Automator and sometimes Xcode, and sometimes creating an entirely new workflow, would help to see the newest code. FYI in case you modify the code and want to try it out.

### Discussion of output

- This service will remove tracking logs created by BTITrackingLogs, both the NSLog and BTITrackingLog formats.
- Since BTITrackingLogs will add a blank line after 'entering' logs and before 'leaving' logs, this service will remove those blank lines. This may not accurately reflect the original state of the code, possibly removing too many blank lines, so some additional code review may be necessary after running this service.

### Getting the code

BTIRemoveTrackingLogs can be cloned from its git repository on github. You can find the repository here: [https://github.com/BriTerIdeas/BTIRemoveTrackingLogs](https://github.com/BriTerIdeas/BTIRemoveTrackingLogs)


### Requirements and supported OS versions

- Tested on Mavericks.  Not sure how far back it will work.
- Current build target is Mavericks, which uses ARC.  If building for anything older, you have to use garbage collection.


### License

BTIRemoveTrackingLogs is distributed freely.  Use it or modify it in any way you see fit.


### Saying Thank You

If you find this code useful, then any of the following would really make me happy:

- I have an app: [SlickShopper](https://itunes.apple.com/us/app/slickshopper-2/id434077651?mt=8). Buy a copy. Tell friends and family about how great it is so they'll buy copies too.  Seriously, I'm lucky to sell one copy a week.  You could literally make my month!
- I do contract development: [BriTer Ideas LLC](http://www.briterideas.com/services.shtml). Hire me. Or if you know of anyone else looking for a developer, I'd appreciate a referral.
- A shout out on Twitter never hurt anybody.
- I will graciously accept a [PayPal](http://bit.ly/AW4Cc) donation.


### Bugs and feature requests

There is very little support offered with this code.  I am always interested in better ways of doing things, so I'll be happy to consider feature requests.  (Note, "consider" doesn't mean I will do anything).

(This README has been adapted from [MGWordCounter](https://github.com/mattgemmell/MGWordCounter) by Matt Gemmell)
