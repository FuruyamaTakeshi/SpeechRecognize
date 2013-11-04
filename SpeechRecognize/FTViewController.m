//
//  FTViewController.m
//  SpeechRecognize
//
//  Created by 古山 健司 on 2013/11/04.
//  Copyright (c) 2013年 TF. All rights reserved.
//

#import "FTViewController.h"
#import "FTFactory.h"
#import "FTRecognizer.h"
#import "FTRecognizerManager.h"
#import "FTRecognition.h"

@interface FTViewController () <FTRecognizerDelegate, UITextFieldDelegate, UITextViewDelegate>
{
    enum {
        TS_IDLE,
        TS_INITIAL,
        TS_RECORDING,
        TS_PROCESSING,
    } transactionState;
}
@property (weak, nonatomic) IBOutlet UITextField *searchBox;
@property (weak, nonatomic) IBOutlet UITextView *alternativesDisplay;

@property (weak, nonatomic) IBOutlet UIView *vuMeter;
@property (weak, nonatomic) IBOutlet UIButton *recordButton;
@property (weak, nonatomic) IBOutlet UIButton *stopButton;
@property (nonatomic) UIActivityIndicatorView *activityView;
@property (nonatomic) BOOL isRecording;

@property (nonatomic, strong) FTRecognizer *recognizer;
@end

@implementation FTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    FTFactory *factory = [FTFactory factoryWithName:@"recogManager"];
    FTRecognizerManager *mgr = [factory createProductWithName:@"SKManager"];
    
	// Do any additional setup after loading the view, typically from a nib.

    [self.alternativesDisplay resignFirstResponder];
    self.activityView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 128, 128)];
    self.activityView.center = self.view.center;
    self.activityView.color = [UIColor blueColor];
    [self.view addSubview:self.activityView];
    self.isRecording = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark VU Meter

- (void)setVUMeterWidth:(float)width {
    if (width < 0)
        width = 0;
    
    CGRect frame = _vuMeter.frame;
    frame.size.width = width+0;
    _vuMeter.frame = frame;
}

- (void)updateVUMeter {
    FTRecognizer *recog = (FTRecognizer *)self.recognizer.voiceSearch;
    float width = (90+recog.audioLevel)*5/2;
    LOG(@"%f", width);
    [self setVUMeterWidth:width];
    [self performSelector:@selector(updateVUMeter) withObject:nil afterDelay:0.05];
}

- (void)recognizerDidBeginRecording:(id)recognizer
{
    LOG_METHOD
    NSLog(@"Recording started.");
    
    transactionState = TS_RECORDING;
    [_recordButton setTitle:@"Pause" forState:UIControlStateNormal];
    [_recordButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self performSelector:@selector(updateVUMeter) withObject:nil afterDelay:0.05];
}

- (void)recognizerDidFinishRecording:(id)recognizer
{
    LOG_METHOD
    NSLog(@"Recording finished.");
    [_recordButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];

    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(updateVUMeter) object:nil];
    [self setVUMeterWidth:0.];
    transactionState = TS_PROCESSING;
    [_recordButton setTitle:@"Processing..." forState:UIControlStateNormal];
    [self.activityView startAnimating];
}

- (void)recognizer:(id)recognizer didFinishWithResults:(id)results
{
    LOG_METHOD
    NSLog(@"Got results.");
    
//    NSLog(@"Session id [%@].", [SpeechKit sessionID]); // for debugging purpose: printing out the speechkit session id
    [self.activityView stopAnimating];
    FTRecognition *recognition = (FTRecognition *)results;
    long numOfResults = [recognition.results count];
    
    transactionState = TS_IDLE;
    [_recordButton setTitle:@"Record" forState:UIControlStateNormal];
    
    if (numOfResults > 0)
        _searchBox.text = [results firstResult];
    
	if (numOfResults > 1)
		_alternativesDisplay.text = [[recognition.results subarrayWithRange:NSMakeRange(1, numOfResults-1)] componentsJoinedByString:@"\n"];
    
    if (recognition.suggestion) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Suggestion"
                                                        message:recognition.suggestion
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        
    }
    
	self.recognizer = nil;
}

- (void)recognizer:(id)recognizer didFinishWithError:(NSError *)error suggestion:(NSString *)suggestion
{
    LOG(@"Got error.");
//    LOG(@"Session id [%@].", [SpeechKit sessionID]); // for debugging purpose: printing out the speechkit session id
    [self.activityView stopAnimating];
    transactionState = TS_IDLE;
    [_recordButton setTitle:@"Record" forState:UIControlStateNormal];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                    message:[error localizedDescription]
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    
    if (suggestion) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Suggestion"
                                                        message:suggestion
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        
    }
    
	self.recognizer = nil;
}

- (IBAction)recordButtonDidPush:(id)sender
{
    LOG_METHOD
    if (self.activityView.isAnimating) {
        [self.activityView stopAnimating];
    }
    if (transactionState == TS_IDLE) {
        FTFactory *factory = [FTFactory factoryWithName:@"speechRecognizer"];
        FTRecognizer *recognizer = [factory createProductWithName:@"SKSpeech" delegate:self];
        self.recognizer = recognizer;
    } else if (transactionState == TS_RECORDING) {
        [self.recognizer stopRecording];
    }
    self.isRecording = !self.isRecording;
}

- (IBAction)cancelButtonDidPush:(id)sender
{
    LOG_METHOD
    if (transactionState == TS_RECORDING) {
        [self.recognizer cancel];
    }
    
    if (self.activityView.isAnimating) {
        [self.activityView stopAnimating];
    }
    //    self.recognizer = nil;
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
