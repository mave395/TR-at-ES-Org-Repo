@isTest
public class TestContactController{
    
    static testMethod void ValidateConstructor(){
        Account dummyAccount = new Account(name='Gmail',Domain__c='gmail.com'); 
        insert dummyAccount;
        
        List<Account> insertedAccount = [select id from Account];
        String testId = insertedAccount[0].id;
        List<Contact> lstDummyContacts = new List<Contact>{  
                                new Contact(lastname='Alia',Email='alia@gmail.com',accountid = testId ),
                                new Contact(lastname='Deepika',Email='deepika@gmail.com',accountid = testId),
                                new Contact(lastname='Kangana',Email='kangana@gmail.com',accountid = testId),
                                new Contact(lastname='Karishma',Email='karishma@gmail.com',accountid = testId),
                                new Contact(lastname='Pooja',Email='pooja@gmail.com',accountid = testId)};
        
       
        
        insert lstDummyContacts;
        
        List<Contact> lstContacts = [select id,accountid,lastname from Contact];
        System.debug('First Insert=======>>>>>>>>'+lstContacts);
        
        ContactController contCtrl = new ContactController();        
        contCtrl.selectAccount = [select id from Account];
        contCtrl.accId =  lstContacts [0].accountid;       
        contCtrl.SerchAlpabet = new List<string>{'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','All'};
           
        
        
        contCtrl.contactToBeDeleted = lstContacts[0].id;
        contCtrl.deleteContact();
        
        //contCtrl.accRelatedContacts = lstContacts;
        contCtrl.deleteContacts();
        
    }
    
    /*
    static testMethod void ValidateAlphaSearch(){  
        ContactController contCtrl = new ContactController();
        contCtrl.SearchVar = 'K';
        contCtrl.display();
    }*/
}
/*
contCtrl.contactToBeDeleted = 
        contCtrl.
*/