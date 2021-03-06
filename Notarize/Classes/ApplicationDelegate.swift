/*******************************************************************************
 * The MIT License (MIT)
 * 
 * Copyright (c) 2018 Jean-David Gadina - www.xs-labs.com
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 ******************************************************************************/

import Cocoa
import GitHubUpdates

@NSApplicationMain class ApplicationDelegate: NSObject, NSApplicationDelegate
{
    private var mainWindowController:  MainWindowController?
    private var aboutWindowController: AboutWindowController?
    
    @IBOutlet private var updater: GitHubUpdater!
    
    func applicationDidFinishLaunching( _ notification: Notification )
    {
        self.mainWindowController = MainWindowController()
        
        if Preferences.shared.lastStart == nil
        {
            self.mainWindowController?.window?.center()
        }
        
        Preferences.shared.lastStart = Date()
        
        self.mainWindowController?.window?.makeKeyAndOrderFront( nil )
        
        self.updater.checkForUpdatesInBackground()
    }

    func applicationWillTerminate( _ notification: Notification )
    {}
    
    func applicationShouldTerminateAfterLastWindowClosed( _ sender: NSApplication ) -> Bool
    {
        return true
    }
    
    @IBAction func showAboutWindow( _ sender: Any? )
    {
        if self.aboutWindowController == nil
        {
            self.aboutWindowController = AboutWindowController()
            
            self.aboutWindowController?.window?.center()
        }
        
        self.aboutWindowController?.window?.makeKeyAndOrderFront( sender )
    }
}

