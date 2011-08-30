//
//  CameraPhotoViewController.m
//  CameraPhoto
//
//  Created by bhuvan khanna on 29/08/11.
//  Copyright 2011 webonise software solutions pvt ltd. All rights reserved.
//

#import "CameraPhotoViewController.h"

@implementation CameraPhotoViewController

@synthesize imageView;
@synthesize takePictureButton;
@synthesize selectFromCameraRollButton;

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{];
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


//------------------------------------------------------------------
-(IBAction)getCameraPicture:(id)sender
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsImageEditing = YES;
   // picker.sourceType = (sender == takePictureButton) ?    UIImagePickerControllerSourceTypeCamera :UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self presentModalViewController: picker animated:YES];
    [picker release];
    
  /*UIImageView *overlay = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"overlay.png"]] autorelease];
      
	UIImagePickerController *picker = [[UIImagePickerController alloc] init];
	picker.delegate = self;
	picker.allowsEditing = NO;
	picker.sourceType =UIImagePickerControllerSourceTypeCamera;
    picker.cameraOverlayView = overlay;
	
    
	//	[camera setSourceType:UIImagePickerControllerSourceTypeCamera];
	/*picker.showsCameraControls = NO;
	picker.navigationBarHidden = YES;
	picker.toolbarHidden = YES;
	picker.wantsFullScreenLayout = YES;
    
	// make a custom capture button
	UIImage *buttonImageNormal = [UIImage imageNamed:@"Capture_Icon-normal.png"];
    UIImage *buttonImagePressed = [UIImage imageNamed:@"Capture_Icon-pressed.png"];
	UIButton *captureButton = [[UIButton buttonWithType:UIButtonTypeCustom] retain];
	captureButton.backgroundColor = [UIColor clearColor];
   [captureButton setTitle:@"Click Me!" forState:UIControlStateNormal];
	captureButton.frame = CGRectMake(200, 100, 100,30);
    
    [captureButton setBackgroundImage:buttonImageNormal forState:UIControlStateNormal];
    [captureButton setBackgroundImage:buttonImagePressed forState:UIControlStateHighlighted];
    
	[captureButton 
     addTarget:self action:@selector(didFinishPickingMediaWithInf:)
     forControlEvents:UIControlEventTouchUpInside];
	[picker.cameraOverlayView addSubview:captureButton];
	
	[self presentModalViewController:picker animated:YES];
	[picker release];*/
}

-(IBAction)selectExitingPicture
{
    if([UIImagePickerController isSourceTypeAvailable:
        UIImagePickerControllerSourceTypePhotoLibrary])
    {
        UIImagePickerController *picker= [[UIImagePickerController alloc]init];
        picker.delegate = self;
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentModalViewController:picker animated:YES];
        [picker release];
    }
}

-(void)imagePickerController:(UIImagePickerController *)picker
      didFinishPickingImage : (UIImage *)image
                 editingInfo:(NSDictionary *)editingInfo
{
    if (picker.sourceType == UIImagePickerControllerSourceTypePhotoLibrary) {
        imageView.image = image;
         [picker dismissModalViewControllerAnimated:YES];
    }
    else {
        // Access the uncropped image from info dictionary
        UIImage *image1 = [editingInfo objectForKey:@"UIImagePickerControllerOriginalImage"];
        
        // Save image
        UIImageWriteToSavedPhotosAlbum(image1, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
        imageView.image=image1;
        [picker dismissModalViewControllerAnimated:YES];
        
    }
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)  picker
{
    [picker dismissModalViewControllerAnimated:YES];
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    UIAlertView *alert;
    
    // Unable to save the image  
    if (error)
        alert = [[UIAlertView alloc] initWithTitle:@"Error" 
                                           message:@"Unable to save image to Photo Album." 
                                          delegate:self cancelButtonTitle:@"Ok" 
                                 otherButtonTitles:nil];
    else // All is well
        alert = [[UIAlertView alloc] initWithTitle:@"Success" 
                                           message:@"Image saved to Photo Album." 
                                          delegate:self cancelButtonTitle:@"Ok" 
                                 otherButtonTitles:nil];
    [alert show];
    [alert release];
    
}


//-------------------------------------------------------------------
@end
