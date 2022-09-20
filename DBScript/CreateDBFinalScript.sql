
CREATE TABLE Admins 
(
AdminID bigint
CONSTRAINT Admin_PK PRIMARY KEY (AdminID),
UserID bigint
CONSTRAINT Admin_users_FK FOREIGN KEY (UserID )
REFERENCES Users (UserAccountID) 
)

CREATE TABLE Students
(
StudentID bigint 
CONSTRAINT Students_PK PRIMARY KEY (StudentID),
UserID bigint
CONSTRAINT Admin_FK FOREIGN KEY (UserID )
REFERENCES Users (UserAccountID) 
)

CREATE TABLE StudentGroups
(
 GroupID bigint 
 CONSTRAINT StudentGroups_PK PRIMARY KEY (GroupID),
 GroupTittle nvarchar,
 StudentID bigint 
 CONSTRAINT StudentGroups_FK1 FOREIGN KEY(StudentID)
 REFERENCES Students(StudentID),
 IsAdmin bit,
 Createby bigint 
 CONSTRAINT StudentGroups_FK2  FOREIGN KEY(Createby)
 REFERENCES Users (UserAccountID) 
)

CREATE TABLE Teacher 
(
TeacherID bigint 
CONSTRAINT Teacher_pk PRIMARY KEY (TeacherID),
UserID bigint
CONSTRAINT Teacher_users_FK FOREIGN KEY (UserID )
REFERENCES Users (UserAccountID) 
)

CREATE TABLE TeacherBooks
(
BookID bigint 
CONSTRAINT book_PK PRIMARY KEY (BookID),
BookTitle nvarchar,
AddedOn datetime ,
NoOfPages int,
BookCategory bigint
CONSTRAINT TeachersBooks_FK1 FOREIGN KEY (BookCategory)
REFERENCES Category (CategoryID),
CreatedBy bigint
CONSTRAINT TeachersBooks_FK2 FOREIGN KEY (CreatedBy)
REFERENCES Teacher(TeacherID)
)


CREATE TABLE Category 
(
 CategoryID bigint 
 CONSTRAINT Category_pk PRIMARY KEY (CategoryID)
)

CREATE TABLE Challenge 
(
ChallengeID bigint
CONSTRAINT Challenge_PK PRIMARY KEY (ChallengeID),
ChallengeTittle nvarchar,
ChallengeCreatedBy bigint 
CONSTRAINT Challenge_FK1 FOREIGN KEY (ChallengeCreatedBy)
REFERENCES  Users (UserAccountID),
ChallengeCategory bigint 
CONSTRAINT Challenge_FK2 FOREIGN KEY (ChallengeCategory)
REFERENCES Category (CategoryID),
ChallengeStatus bigint 
CONSTRAINT  Challenge_FK3 FOREIGN KEY (ChallengeStatus)
REFERENCES Status(StateID),
ChallengePrivacyID bigint 
CONSTRAINT  Challenge_FK4 FOREIGN KEY (ChallengePrivacyID)
REFERENCES ChallengePrivacy(ChallengePrivacyID),
Diffcultylevel bigint 
CONSTRAINT  Challenge_FK5 FOREIGN KEY (Diffcultylevel)
REFERENCES Difficulty(ID),
ChallengeImage nvarchar,
CompanyLocation nvarchar,
ChatBlocked bit,
HidetextareainWorkspace bit , 
SendEmailNotifications bit ,
IsPeertoPeer bit , 
SolutionType bigint 
CONSTRAINT  Challenge_FK6 FOREIGN KEY (SolutionType)
REFERENCES Solutiontype(ID),
ChallengeNotes nvarchar,
TemplateID bigint ,
CriteriaID bigint ,
CONSTRAINT  Challenge_FK7 FOREIGN KEY (TemplateID,CriteriaID)
REFERENCES ChallengeEvaloutionTemplate(ChallengeTemplateID,CriteriaID)
)


CREATE TABLE ChallengeRepository
(
RepositoryID bigint 
CONSTRAINT ChallengeRepository_PK PRIMARY KEY (RepositoryID),
ChallengeID bigint 
CONSTRAINT ChallengeRepository_FK1  FOREIGN KEY (ChallengeID)
REFERENCES Challenge(ChallengeID),
GuideLines nvarchar,
RepositoryAddedby bigint 
CONSTRAINT ChallengeRepository_FK2  FOREIGN KEY (RepositoryAddedby)
REFERENCES Users (UserAccountID) ,
RepositoryAddedOn datetime
)

CREATE TABLE ChallengeRepositoryFiles
(
RepositoryFileID bigint 
CONSTRAINT ChallengeRepositoryFiles_PK PRIMARY KEY (RepositoryFileID),
RepositoryID bigint 
CONSTRAINT ChallengeRepositoryFiles_FK FOREIGN KEY(RepositoryID)
REFERENCES ChallengeRepository(RepositoryID),
RepositoryFiletag nvarchar,
RepositoryFiletitle nvarchar,
RepositoryFileLocation nvarchar
)

CREATE TABLE ChallengeRepositoryTexts
(
RepositoryTextID bigint 
CONSTRAINT  ChallengeRepositoryTexts_PK PRIMARY KEY (RepositoryTextID),
RepositoryID bigint 
CONSTRAINT ChallengeRepositoryTexts_FK FOREIGN KEY(RepositoryID)
REFERENCES ChallengeRepository(RepositoryID),
RepositoryTexttag nvarchar,
RepositoryTextTitle nvarchar,
RepositoryText nvarchar
)

CREATE TABLE ChallengeRepositoryLinks
(
RepositoryLinkID bigint 
CONSTRAINT  ChallengeRepositoryLinks_PK  PRIMARY KEY (RepositoryLinkID ),
RepositoryID bigint 
CONSTRAINT ChallengeRepositorylinks_FK FOREIGN KEY(RepositoryID)
REFERENCES ChallengeRepository(RepositoryID),
Repositorylinktag nvarchar,
RepositoryLinktitle nvarchar,
Repositortylink nvarchar
)

CREATE TABLE ChallengeEvaloutionTemplate
(
ChallengeTemplateID bigint,
CriteriaID bigint 
CONSTRAINT ChallengeEvaloutionTemplate_PK PRIMARY KEY (ChallengeTemplateID,CriteriaID),
Criteria nvarchar,
Weight decimal 
)

CREATE TABLE ChallengePrivacy
(
ChallengePrivacyID bigint 
CONSTRAINT ChallengePrivacy_PK PRIMARY KEY (ChallengePrivacyID),
Explanation nvarchar
)

CREATE TABLE Challengestatus
(
 ID bigint 
 CONSTRAINT  Challengestatus_PK PRIMARY KEY (ID),
 StatusName nvarchar
)

CREATE TABLE Difficulty
(
 ID bigint 
 CONSTRAINT  Difficulty_PK PRIMARY KEY(ID),
 levelExp nvarchar
)

CREATE TABLE ResearchChallenge
(
  ResearchChallengeID bigint 
  CONSTRAINT ResearchChallenge_PK PRIMARY KEY ( ResearchChallengeID),
  ChallengeID bigint 
  CONSTRAINT ResearchChallenge_FK FOREIGN KEY (ChallengeID)
  REFERENCES Challenge (ChallengeID),
  Descritption nvarchar,
  RegistrationStartdate datetime,
  Startdate datetime,
  LastSubmissiondate datetime,
  Evaluationstartdate datetime,
  Lastevaluationdate datetime,
  ChallengePublisheddate datetime
)

CREATE TABLE StaggeredChallenge
(
 StaggeredChallengeID bigint 
 CONSTRAINT StaggeredChallenge_pk PRIMARY KEY (StaggeredChallengeID),
 ChallengeID bigint 
 CONSTRAINT StaggeredChallenge_FK FOREIGN KEY (ChallengeID)
 REFERENCES Challenge (ChallengeID),
 RegistrationStartdate datetime,
 Startdate datetime,
 LastSubmissiondate datetime,
 Evaluationstartdate datetime,
 Lastevaluationdate datetime,
 ChTime time,
 ChallengePublisheddate datetime
)

CREATE TABLE ChallengeSolution
(
 SolutionID bigint 
 CONSTRAINT  ChallengeSolution_PK PRIMARY KEY ( SolutionID),
 ChallengeID bigint 
 CONSTRAINT ResearchChallenge_FK1 FOREIGN KEY (ChallengeID)
 REFERENCES Challenge (ChallengeID),
 StudentID bigint 
 CONSTRAINT ChallengeSolution_FK2 FOREIGN KEY (StudentID)   
 REFERENCES Students(StudentID),
 GroupID bigint 
 CONSTRAINT ChallengeSolution_FK3  FOREIGN KEY(GroupID)
 REFERENCES StudentGroups(GroupID),
 AddedOn datetime,
 Comment nvarchar
)

CREATE TABLE  ChallengeSolutionDetials
(
 ChallengeSolutionDetailsID bigint 
 CONSTRAINT ChallengeSolutionDetials_PK PRIMARY KEY (ChallengeSolutionDetailsID),
 ChallengeSolutionID bigint 
 CONSTRAINT ChallengeSolutionDetials_FK fOREIGN KEY( ChallengeSolutionID)
 REFERENCES ChallengeSolution(SolutionID),
 SectionID int,
 SectionText nvarchar,
 SectionFile nvarchar
)

CREATE TABLE ChallengeSubscribe
(
 Subscribeid bigint 
 CONSTRAINT ChallengeSubscribe_PK PRIMARY KEY (Subscribeid),
 Challengeid bigint 
 CONSTRAINT ChallengeSubscribe_FK1 FOREIGN KEY (ChallengeID)
 REFERENCES Challenge (ChallengeID),
 SubscriberID bigint 
 CONSTRAINT ChallengeSubscribe_FK2 FOREIGN KEY (SubscriberID)   
 REFERENCES Users (UserAccountID) ,
 SubscribeDate datetime
)


CREATE TABLE ChallengeNoteAccess
(
 AccessID bigint 
 CONSTRAINT ChallengeNoteAccess_PK PRIMARY KEY(AccessID),
 ChallengeID bigint 
 CONSTRAINT  ChallengeNoteAccess_FK1 FOREIGN KEY (ChallengeID)
 REFERENCES Challenge (ChallengeID),
 UserID bigint 
 CONSTRAINT ChallengeNoteAccess_FK2 FOREIGN KEY (UserID)   
 REFERENCES Users (UserAccountID),
 AccessVerification bit,
 AccessAuthorizationStartDate datetime,
 AccessAuthorizationEndDate datetime
)
CREATE TABLE Packages
(
  PackageID bigint ,
  ChallengeID bigint
  CONSTRAINT Packages_PK PRIMARY KEY(PackageID,ChallengeID)
  CONSTRAINT Packages_FK1 FOREIGN KEY(ChallengeID)
  REFERENCES Challenge (ChallengeID),
  Createdby bigint 
  CONSTRAINT Packages_FK2 FOREIGN KEY(Createdby)
  REFERENCES Users (UserAccountID),
  CreatedDate datetime,
  Price decimal,
  PackageStatusID bigint 
  CONSTRAINT Packages_FK3 FOREIGN KEY(PackageStatusID)
  REFERENCES packagestatus(ID)
)


CREATE TABLE PackageStatus
(
 ID bigint
 CONSTRAINT PackageStatus_PK PRIMARY KEY(ID),
 Explanation nvarchar
)

CREATE TABLE  PackagePurchase
(
 PurchaseID bigint ,
 PackageID bigint ,
 ChallengeID bigint,
 PurchaseDate datetime,
 BuyerID bigint 
 CONSTRAINT PackagePurchase_FK2 FOREIGN KEY ( BuyerID)
 REFERENCES Users (UserAccountID),
 CreditCardnumber int,
 CVVCode int,
 CardHolderName nvarchar,
 TransactionID bigint 
 CONSTRAINT PackagePurchase_FK3  FOREIGN KEY( TransactionID)
 REFERENCES UTransaction(TransactionID),
 CONSTRAINT PackagePurchase_PK PRIMARY KEY  (PurchaseID, PackageID,ChallengeID),
 CONSTRAINT PackagePurchase_FK1 FOREIGN KEY (PackageID,ChallengeID)
 REFERENCES Packages(PackageID,ChallengeID)
)



CREATE TABLE UTransaction
(
 TransactionID bigint 
 CONSTRAINT UTransaction_PK PRIMARY KEY(TransactionID),
 UserID bigint 
 CONSTRAINT  UTransaction_FK1  FOREIGN KEY( UserID)
 REFERENCES Users (UserAccountID),
 Amount decimal,
 Transactiondate datetime,
 TransactionTypeID bigint 
 CONSTRAINT  UTransaction_FK2 FOREIGN KEY(TransactionTypeID)
 REFERENCES  TransactionType(ID)
)

CREATE TABLE TransactionType
(
 ID bigint 
 CONSTRAINT TransactionType_PK PRIMARY KEY(ID),
 Explanation nvarchar
)

CREATE TABLE  UserWallet 
(
 WalletID bigint 
 CONSTRAINT UserWallet_PK PRIMARY KEY(WalletID),
 UserID bigint 
 CONSTRAINT UserWallet_FK1 FOREIGN KEY(UserID)
 REFERENCES Users (UserAccountID),
 WalletTransactionID bigint 
 CONSTRAINT UserWallet_FK2 FOREIGN KEY( WalletTransactionID)
 REFERENCES UTransaction(TransactionID),
 Addeddate datetime,
 CurrentAmount decimal,
 AddedAmount decimal,
 Coins decimal
)

CREATE TABLE Evaluator 
(
 EvaluatorID bigint 
 CONSTRAINT Evaluator_PK PRIMARY KEY(EvaluatorID),
 FirstName nvarchar,
 LastName nvarchar,
 Email nvarchar,
 AddedBy bigint 
 CONSTRAINT Evaluator_FK FOREIGN KEY(AddedBy)
 REFERENCES Users (UserAccountID)
)

CREATE TABLE ChallengeSoluationEvaluation 
(
 EvaluationID bigint,
 ChallengeID bigint 
 CONSTRAINT ChallengeSoluationEvaluation_FK1  FOREIGN KEY(ChallengeID)
 REFERENCES Challenge(ChallengeID),
 SoluationID bigint 
 CONSTRAINT ChallengeSoluationEvaluation_FK2  FOREIGN KEY(SoluationID)
 REFERENCES ChallengeSolution(SolutionID),
 Evaluateby bigint 
 CONSTRAINT ChallengeSoluationEvaluation_FK3  FOREIGN KEY( Evaluateby)
 REFERENCES Evaluator(EvaluatorID)
 CONSTRAINT ChallengeSoluationEvaluation_PK PRIMARY KEY(EvaluationID,ChallengeID, SoluationID,Evaluateby),
 TemplateID bigint ,
 OverallGrade decimal,
 OverallComment nvarchar,
 CriteriaID bigint ,
 Grade decimal,
 Comment nvarchar
)
CREATE TABLE Status
(
StateID bigint 
Constraint status_pk primary key (StateID ),
Explanation nvarchar
)

CREATE TABLE Solutiontype
(
  ID bigint 
  CONSTRAINT Solutiontype_PK PRIMARY KEY (ID),
  Explanation nvarchar 
)
