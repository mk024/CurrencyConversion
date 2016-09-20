//
//  ViewController.m
//  CurrencyConversion
//
//  Created by Michael K on 8/8/16.
//  Copyright © 2016 Waxy Watermelon. All rights reserved.
//

#import "ViewController.h"
#import "CurrencyRequest/CRCurrencyRequest.h"
#import "CurrencyRequest/CRCurrencyResults.h"

@interface ViewController () <CRCurrencyRequestDelegate>

@property (nonatomic) CRCurrencyRequest *req;
@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property (weak, nonatomic) IBOutlet UIButton *convertButton;
@property (weak, nonatomic) IBOutlet UILabel *currencyA;
@property (weak, nonatomic) IBOutlet UILabel *currencyB;
@property (weak, nonatomic) IBOutlet UILabel *currencyC;

@end

@implementation ViewController

- (IBAction)buttonTapped:(id)sender {
    self.convertButton.enabled = NO;
    
    self.req = [[CRCurrencyRequest alloc] init];
    self.req.delegate = self;
    [self.req start];
}

- (void)currencyRequest:(CRCurrencyRequest *)req
    retrievedCurrencies:(CRCurrencyResults *)currencies;{
    self.convertButton.enabled = YES;
    
    
    
    double inputValue = [self.inputField.text floatValue];
    
    double euroValue = inputValue * currencies.EUR;
    
    NSString *finalEuro = [NSString stringWithFormat:@"%.2f", euroValue];
    
    self.currencyA.text = finalEuro;
    
    
    
    
    double yenValue = inputValue * currencies.JPY;
    
    NSString *finalYen = [NSString stringWithFormat:@"%.2f", yenValue];
    
    self.currencyB.text = finalYen;
    
    
    
    
    double poundValue = inputValue * currencies.GBP;
    
    NSString *finalPound = [NSString stringWithFormat:@"%.2f", poundValue];
    
    self.currencyC.text = finalPound;
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
