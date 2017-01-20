//
//  ViewController.m
//  QuizApp
//
//  Created by Wilhelm Fors on 17/01/17.
//  Copyright © 2017 Wilhelm Fors. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *Question;
@property (weak, nonatomic) IBOutlet UIButton *alternativeA;
@property (weak, nonatomic) IBOutlet UIButton *alternativeB;
@property (weak, nonatomic) IBOutlet UIButton *alternativeC;
@property (weak, nonatomic) IBOutlet UIButton *alternativeD;
@property (weak, nonatomic) IBOutlet UIButton *nextQuestion;
@property (weak, nonatomic) IBOutlet UITextField *questionCount;
@property (weak, nonatomic) IBOutlet UIButton *playAgain;
@property (weak, nonatomic) IBOutlet UITextView *scoreView;
@property (nonatomic) Model *model;

@end

@implementation ViewController
- (IBAction)AnswerA:(id)sender {
    UIButton *button = (UIButton*)sender;
    
    if([self.model isCorrectAnswer:[button currentTitle]]) {
            [button setTitle:@"Rätt" forState: UIControlStateNormal];
        self.scoreView.text = [NSString stringWithFormat:@"Poäng: %d", [self.model score]];
    } else {
        [button setTitle:@"Fel" forState: UIControlStateNormal];
    }
    [self disableButtons];
    if([self.model finished]) {
        [self showFinishedScreen];
    }

    
    
}
- (IBAction)nextQuestion:(id)sender {
    NSArray *question = [self.model getQuestion];
    [self displayQuestionIndex];
    [self setUpQuestion:question];
    [self undisableButtons];
    }

-(void) setUpQuestion :(NSArray*)question {
    NSArray *scrambledArray = [[NSArray alloc] init];
    self.Question.text = question[0];
    scrambledArray = [self.model scrambleArray:question];
    
    [self.alternativeA setTitle:scrambledArray[1] forState:UIControlStateNormal];
    [self.alternativeB setTitle:scrambledArray[2] forState:UIControlStateNormal];
    [self.alternativeC setTitle:scrambledArray[3] forState:UIControlStateNormal];
    [self.alternativeD setTitle:scrambledArray[4] forState:UIControlStateNormal];
}
-(void) disableButtons {
    self.alternativeA.enabled = NO;
    self.alternativeB.enabled = NO;
    self.alternativeC.enabled = NO;
    self.alternativeD.enabled = NO;
    self.nextQuestion.enabled = YES;
}
-(void) undisableButtons {
    self.alternativeA.enabled = YES;
    self.alternativeB.enabled = YES;
    self.alternativeC.enabled = YES;
    self.alternativeD.enabled = YES;
    self.nextQuestion.enabled = NO;
}
-(void) displayQuestionIndex {
    self.questionCount.text = [NSString stringWithFormat:@"Fråga %d/5", [self.model questionsAsked]];
}
- (IBAction)playAgain:(id)sender {
    [self.model restartGame];
    self.nextQuestion.enabled = YES;
    [self setUpGame];
}
-(void) setUpGame {
    [self disableButtons];
    self.Question.text = @"Tryck på 'Nästa fråga' för att starta";
    [self.playAgain setTitle:@"Spela igen" forState:UIControlStateNormal];
    self.scoreView.text = @"Poäng: 0";
    self.playAgain.hidden = YES;
    self.scoreView.hidden = YES;
    [self displayQuestionIndex];
    self.model = [[Model alloc] init];
    [self.model setUpQuestions];
    [self.alternativeA setTitle:@"-" forState:UIControlStateNormal];
    [self.alternativeB setTitle:@"-" forState:UIControlStateNormal];
    [self.alternativeC setTitle:@"-" forState:UIControlStateNormal];
    [self.alternativeD setTitle:@"-" forState:UIControlStateNormal];

}

-(void) showFinishedScreen {
    self.Question.text = @"Klar!";
    self.nextQuestion.enabled = NO;
    self.playAgain.hidden = NO;
    self.scoreView.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpGame];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
