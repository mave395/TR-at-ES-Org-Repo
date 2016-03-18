@isTest
public class TestDisplayAccounts{

    static testMethod void ValidateDisplayAccountsControllerPositive(){
    
     List<Account>TestDataAccounts = new List<Account> {  new Account( Name='Gmail',Domain__c='gmail.com'),
                                                          new Account( Name='Yahoo',Domain__c='yahoo.com')
                                                       };
    
    insert TestDataAccounts;
    ApexPages.StandardController sc;   
    DisplayAccounts dispAccs2 = new DisplayAccounts(sc);
    
    DisplayAccounts dispAccs = new DisplayAccounts();
    
    List<Account> lstAcc = [select id from Account where name = 'Gmail'];
    dispAccs.accId = lstAcc[0].id;
    
    
    dispAccs.searchTerm = 'a' ; 
    dispAccs.noOfAccounts = 2; 
    dispAccs.searchError = 'Problem';
    dispAccs.boolSrchError = False;
    PageReference pgRef;
       
    pgRef = dispAccs.search();
    
    System.assertEquals(dispAccs.boolSrchError ,True);    
    
    pgRef = dispAccs.getAccountDetails(1);
    pgRef = dispAccs.showContacts();
    
    pgRef = dispAccs.clear();
   
    }
    static testMethod void ValidateDisplayAccountsControllerNegative(){
        DisplayAccounts dispAccs = new DisplayAccounts();
        dispAccs.searchTerm = 'har' ;
        dispAccs.boolSrchError = True;
        PageReference pgRef;
        
        pgRef = dispAccs.search();
        System.assertEquals(dispAccs.boolSrchError ,False);
    }
}