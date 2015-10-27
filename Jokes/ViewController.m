//
//  ViewController.m
//  Jokes
//
//  Created by Admin on 29.10.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *back;
@property (weak, nonatomic) IBOutlet UIButton *next;
@end

@implementation ViewController

NSArray* jokes;
int count;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.label.numberOfLines = 0;
    jokes =  @[@"I am a nobody, nobody is perfect,\r\n therefore I am perfect.",
               @"How do you make holy water?\r\n You boil the hell out of it.",
               @"I once farted in an elevator,\r\n it was wrong on so many levels.",
               @"What do you call a bear with no teeth?\r\n -- A gummy bear!",
               @"His mom never saw the irony in calling him\r\n a son-of-a-bitch."];
    count = 0;
    [self updateJoke];
    [self updateButtonsState];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void) updateButtonsState
{
    [self.back setEnabled:YES];
    [self.next setEnabled:YES];
    if(count == 0)
    {
        [self.back setEnabled:NO];
    }
    if(count == jokes.count - 1){
        [self.next setEnabled:NO];
    }
}

- (void) updateJoke
{
    NSString* joke = [jokes objectAtIndex: count];
    self.label.text = joke;
}

- (IBAction)onBack:(id)sender {
    if(count > 0)
    {
        count--;
    }
    [self updateJoke];
    [self updateButtonsState];
}
- (IBAction)onNext:(id)sender {
    if(count < jokes.count - 1)
    {
        count++;
    }
    [self updateJoke];
    [self updateButtonsState];
}

@end
