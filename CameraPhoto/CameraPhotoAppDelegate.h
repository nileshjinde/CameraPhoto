//
//  CameraPhotoAppDelegate.h
//  CameraPhoto
//
//  Created by bhuvan khanna on 29/08/11.
//  Copyright 2011 webonise software solutions pvt ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CameraPhotoViewController;

@interface CameraPhotoAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet CameraPhotoViewController *viewController;

@end
