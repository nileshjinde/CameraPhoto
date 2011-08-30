//
//  CameraPhotoViewController.h
//  CameraPhoto
//
//  Created by bhuvan khanna on 29/08/11.
//  Copyright 2011 webonise software solutions pvt ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CameraPhotoViewController : UIViewController
< UIImagePickerControllerDelegate , UINavigationControllerDelegate>
{
    IBOutlet UIImageView *imageView;
    IBOutlet UIButton *takePictureButton;
    IBOutlet UIButton *selectFromCameraRollButton;
}

@property(nonatomic,retain) UIImageView *imageView;
@property(nonatomic,retain) UIButton *takePictureButton;
@property(nonatomic,retain) UIButton *selectFromCameraRollButton;

-(IBAction)getCameraPicture:(id)sender;
-(IBAction)selectExitingPicture;

@end
