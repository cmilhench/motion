//
//  ViewController.m
//  motion
//
//  Created by Colin Milhench on 10/03/2014.
//  Copyright (c) 2014 Colin Milhench. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    currentMaxAccelX = 0;
    currentMaxAccelY = 0;
    currentMaxAccelZ = 0;
    
    currentMaxRotX = 0;
    currentMaxRotY = 0;
    currentMaxRotZ = 0;
    
    currentMaxPitch = 0;
    currentMaxRoll = 0;
    currentMaxYaw = 0;
    
    refAttitude = nil;
    
    self.motionManager = [[CMMotionManager alloc] init];

    self.motionManager.deviceMotionUpdateInterval = .2;
    [self.motionManager startDeviceMotionUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMDeviceMotion *motion, NSError *error) {
        if(error){
            NSLog(@"%@", error);
        }
        [self outputMotionData:motion];
    }];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)outputMotionData:(CMDeviceMotion*)motion
{
    if (refAttitude == nil) {
        refAttitude = [motion.attitude copy];
    }
    // adjust attitude so we can use yaw
    [motion.attitude multiplyByInverseOfAttitude:refAttitude];
    
    /// Acceleromiter (which way is down?)
    self.accX.text = [NSString stringWithFormat:@" %.2fg", motion.gravity.x];
    if(fabs(motion.gravity.x) > fabs(currentMaxAccelX))
    {
        currentMaxAccelX = motion.gravity.x;
    }
    
    self.accY.text = [NSString stringWithFormat:@" %.2fg", motion.gravity.y];
    if(fabs(motion.gravity.y) > fabs(currentMaxAccelY))
    {
        currentMaxAccelY = motion.gravity.y;
    }
    
    self.accZ.text = [NSString stringWithFormat:@" %.2fg", motion.gravity.z];
    if(fabs(motion.gravity.z) > fabs(currentMaxAccelZ))
    {
        currentMaxAccelZ = motion.gravity.z;
    }
    
    self.maxAccX.text = [NSString stringWithFormat:@" %.2f", currentMaxAccelX];
    self.maxAccY.text = [NSString stringWithFormat:@" %.2f", currentMaxAccelY];
    self.maxAccZ.text = [NSString stringWithFormat:@" %.2f", currentMaxAccelZ];
    
    /// Rotation (How fast are we moving?)
    self.rotX.text = [NSString stringWithFormat:@" %.2fr/s",motion.rotationRate.x];
    if(fabs(motion.rotationRate.x) > fabs(currentMaxRotX))
    {
        currentMaxRotX = motion.rotationRate.x;
    }
    self.rotY.text = [NSString stringWithFormat:@" %.2fr/s",motion.rotationRate.y];
    if(fabs(motion.rotationRate.y) > fabs(currentMaxRotY))
    {
        currentMaxRotY = motion.rotationRate.y;
    }
    self.rotZ.text = [NSString stringWithFormat:@" %.2fr/s",motion.rotationRate.z];
    if(fabs(motion.rotationRate.z) > fabs(currentMaxRotZ))
    {
        currentMaxRotZ = motion.rotationRate.z;
    }
    
    self.maxRotX.text = [NSString stringWithFormat:@" %.2f", currentMaxRotX];
    self.maxRotY.text = [NSString stringWithFormat:@" %.2f", currentMaxRotY];
    self.maxRotZ.text = [NSString stringWithFormat:@" %.2f", currentMaxRotZ];
    
    /// Attitude
    self.pitch.text = [NSString stringWithFormat:@" %.2f", motion.attitude.pitch];
    if(fabs(motion.attitude.pitch) > fabs(currentMaxPitch))
    {
        currentMaxPitch = motion.attitude.pitch;
    }
    self.roll.text = [NSString stringWithFormat:@" %.2f", motion.attitude.roll];
    if(fabs(motion.attitude.roll) > fabs(currentMaxRoll))
    {
        currentMaxRoll = motion.attitude.roll;
    }
    self.yaw.text = [NSString stringWithFormat:@" %.2f", motion.attitude.yaw];
    if(fabs(motion.attitude.yaw) > fabs(currentMaxYaw))
    {
        currentMaxYaw = motion.attitude.yaw;
    }
    
    //self.maxPitch.text = [NSString stringWithFormat:@" %.2f", currentMaxPitch];
    //self.maxRoll.text = [NSString stringWithFormat:@" %.2f", currentMaxRoll];
    //self.maxYaw.text = [NSString stringWithFormat:@" %.2f", currentMaxYaw];
    
}

- (IBAction)resetMaxValues:(id)sender {
    currentMaxAccelX = 0;
    currentMaxAccelY = 0;
    currentMaxAccelZ = 0;
    
    currentMaxRotX = 0;
    currentMaxRotY = 0;
    currentMaxRotZ = 0;
    
    currentMaxPitch = 0;
    currentMaxRoll = 0;
    currentMaxYaw = 0;
    
    refAttitude = nil;
}

@end
