//
//  ViewController.h
//  motion
//
//  Created by Colin Milhench on 10/03/2014.
//  Copyright (c) 2014 Colin Milhench. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

double currentMaxAccelX;
double currentMaxAccelY;
double currentMaxAccelZ;

double currentMaxRotX;
double currentMaxRotY;
double currentMaxRotZ;

double currentMaxPitch;
double currentMaxRoll;
double currentMaxYaw;

CMAttitude *refAttitude;

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *accX;
@property (strong, nonatomic) IBOutlet UILabel *accY;
@property (strong, nonatomic) IBOutlet UILabel *accZ;

@property (strong, nonatomic) IBOutlet UILabel *maxAccX;
@property (strong, nonatomic) IBOutlet UILabel *maxAccY;
@property (strong, nonatomic) IBOutlet UILabel *maxAccZ;

@property (strong, nonatomic) IBOutlet UILabel *rotX;
@property (strong, nonatomic) IBOutlet UILabel *rotY;
@property (strong, nonatomic) IBOutlet UILabel *rotZ;

@property (strong, nonatomic) IBOutlet UILabel *maxRotX;
@property (strong, nonatomic) IBOutlet UILabel *maxRotY;
@property (strong, nonatomic) IBOutlet UILabel *maxRotZ;

@property (strong, nonatomic) IBOutlet UILabel *pitch;
@property (strong, nonatomic) IBOutlet UILabel *roll;
@property (strong, nonatomic) IBOutlet UILabel *yaw;

- (IBAction)resetMaxValues:(id)sender;

@property (strong, nonatomic) CMMotionManager *motionManager;

@end
