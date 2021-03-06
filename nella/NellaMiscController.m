#import "Global.h"
#include "NellaMiscController.h"

UIColor *originalTint;
UIWindow *settingsView;

@implementation NellaMiscController

- (id)specifiers {
    if (_specifiers == nil) {
        _specifiers = [[self loadSpecifiersFromPlistName:@"NellaMiscPrefs" target:self] retain];
    }
    return _specifiers;
}

- (void)loadView {
	[super loadView];
	[UISwitch appearanceWhenContainedIn: self.class, nil].onTintColor = NELLA_BLUE;
	[UISegmentedControl appearanceWhenContainedIn: self.class, nil].tintColor = NELLA_BLUE;
}

- (void)viewWillAppear:(BOOL)animated {
	settingsView = [[UIApplication sharedApplication] keyWindow];
	originalTint = settingsView.tintColor;
	settingsView.tintColor = NELLA_BLUE;
}

- (void)viewWillDisappear:(BOOL)animated {
	settingsView.tintColor = originalTint;
}

@end
