//
//  FCViewController.m
//  FantasyCricketLogin
//
//  Created by Pushparaj Zala on 2/15/14.
//  Copyright (c) 2014 Pushparaj Zala. All rights reserved.
//

#import "FC_FBLoginViewController.h"

@interface FC_FBLoginViewController ()
@property (weak, nonatomic) IBOutlet UIButton *fbLoginButton;
@property (weak, nonatomic) IBOutlet UIButton *fetchButton;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activity;
@property (weak, nonatomic) IBOutlet UIButton *logoutButton;
@property (weak, nonatomic) IBOutlet UIButton *storeButton;

@end

@implementation FC_FBLoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self buttonChange];
    [OBLLog setFacebookDebug:YES];
//    [self.activity stopAnimating];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)fbLogin:(id)sender
{
    [self.activity startAnimating];
    self.fetchButton.hidden = YES;
    [OBLFacebookLogin loginWithFBReadPermissions:@[EMAIL,BIRTH_DAY]
                            andCompletionHandler:^(NSError *error){
                                if (!error)
                                {
                                    [OBLFacebookQuery fetchUserProfileWithCompletionHandler:^(OBLFacebookUser *result, NSError *error)
                                     {
                                         if (!error)
                                         {
                                             NSLog(@"my id: %@",result.socialMediaId);
                                             NSLog(@"my name: %@",result.firstName);
                                             [self buttonChange];
                                             [self fetchDetails];
                                         }
                                         else
                                         {
                                             NSLog(@"%@",error.description);
                                         }
                                         [self.activity stopAnimating];
                                     }];
                                }
                                else
                                {
                                    [self alert:@"Error in login"];
                                    NSLog(@"error: %@",error.description);
                                }
                            }
     ];


}
- (IBAction)logout:(id)sender
{
    [OBLFacebookLogin logout];
    self.fbLoginButton.enabled = YES;
    self.fbLoginButton.hidden = NO;
    self.fetchButton.hidden = YES;
    self.logoutButton.hidden = YES;
}

- (void)fetchDetails
{
    [self.activity startAnimating];
    [OBLFacebookQuery fetchUserProfileWithCompletionHandler:^(OBLFacebookUser *result, NSError *error)
     {
         FC_User *user = [[FC_User alloc] init];
//       [user setUserId:(NSUInteger)result.socialMediaId];
         [user setFacebookId:result.socialMediaId];
         [user setRealName:result.name];
         [user setEmail:result.email];
         [user setGooglePlusId:nil];
         [user setApiKey:nil];
         [user setGender:result.gender];
         [user setBirthdate:result.birthdate];
         [user setCreateAt:nil];
         [user setImageUrl:result.socialMediaId];
         NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://graph.facebook.com/%@/picture?type=square",result.socialMediaId]]];
         UIImage *profilePic = [UIImage imageWithData:imageData];

         [user setImage:imageData];
         [user setGooglePlusId:nil];


         NSLog(@"fb id: %@",result.socialMediaId);
         NSLog(@"email: %@",result.email);
         NSLog(@"real name: %@",result.name);
         NSLog(@"gender: %@",result.gender);
         NSLog(@"birth Date: %@",result.birthdate);
         UIImageView * imageView = [[UIImageView alloc] initWithFrame:
                                    CGRectMake((self.view.bounds.size.width/2-profilePic.size.width/2), 120, profilePic.size.height, profilePic.size.width)];
         
         [imageView setImage:profilePic];
         
         [self.view addSubview: imageView];

         [self alert:@"Fetch sucessful..."];
         [self.activity stopAnimating];
     }];
}


- (IBAction)fetch:(id)sender
{
    [self fetchDetails];
}


- (IBAction)store:(id)sender
{
    FC_User *user = [[FC_User alloc] init];
    //[user setUserId:(NSUInteger)result.socialMediaId];
    NSLog(@"stored Id: %@",[user facebookId]);
    NSLog(@"stored RealName: %@",[user realName]);
    NSLog(@"stored email: %@",[user email]);
    NSLog(@"stored gender: %@",[user gender]);
    NSLog(@"stored Birthdate: %@",[user birthdate]);
    NSLog(@"stored createAt: %@",[user createAt]);
    NSLog(@"stored image: %@",[user image]);
    //UIImage *profilePic = [UIImage imageWithData:[user image]];
    NSLog(@"stored imageUrl: %@",[user imageUrl]);

}

- (void)buttonChange
{
    //check if user is already logged in or not
    if ([OBLFacebookLogin isLogin])
    {
        self.fbLoginButton.enabled = NO;
        self.fbLoginButton.hidden = YES;
        self.fetchButton.hidden = NO;
        self.logoutButton.hidden = NO;
    }
    else
    {
        self.fbLoginButton.enabled = YES;
        self.fbLoginButton.hidden = NO;
        self.fetchButton.hidden = YES;
        self.logoutButton.hidden = YES;
    }
}


- (void)alert:(NSString*)msg
{
    [[[UIAlertView alloc]initWithTitle:@"Status" message:msg delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil] show];
}


@end
