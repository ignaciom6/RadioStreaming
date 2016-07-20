//
//  ViewController.m
//  RadioStreaming
//
//  Created by Ignacio on 9/5/16.
//  Copyright © 2016 Ignacio. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import <AVKit/AVKit.h>

@interface ViewController ()

@property (strong, nonatomic) MPMoviePlayerController * player;
@property (strong, nonatomic) IBOutlet UIButton *playButton;
@property (strong, nonatomic) IBOutlet UIButton *stopButton;
@property (assign, nonatomic) BOOL playing;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.playing = NO;
    [self configureButtonsWithStatus:self.playing];
    
    NSString *radioURL = @"http://suenas.net:8090/pobrejohnny";
    
    self.player = [[MPMoviePlayerController alloc] initWithContentURL:[NSURL URLWithString:radioURL]];
    self.player.movieSourceType = MPMovieSourceTypeStreaming;
    self.player.view.hidden = YES;
    [self.view addSubview:self.player.view];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)playRadio:(id)sender
{
    [self.player prepareToPlay];
    [self.player play];
    
    self.playing = YES;
    [self configureButtonsWithStatus:self.playing];
}

- (IBAction)stopRadio:(id)sender
{
    [self.player stop];
    
    self.playing = NO;
    [self configureButtonsWithStatus:self.playing];
}

-(void)configureButtonsWithStatus:(BOOL)status
{
    self.playButton.enabled = !self.playing;
    self.stopButton.enabled = self.playing;
}

@end
