@isTest
public class ContactTriggerTest{
    
    
    static testMethod void validateAccountAssociationWithContact() {
        List<Contact> lstContacts = new List<Contact>();
        List<Account> lstAccounts = new List<Account>();
        
        
        Account account1 = new Account(Name='Gmail',Domain__c='gmail.com');
        Account account2 = new Account(Name='Yahoo',Domain__c='yahoo.com');
        lstAccounts.add(account1); 
        lstAccounts.add(account2); 

        Contact contact1 = new Contact(LastName ='Test1',Email='test1@gmail.com');
        Contact contact2 = new Contact(LastName ='Test2',Email='test2@yahoo.com');
        Contact contact3 = new Contact(LastName ='Test3');
        Contact contact4 = new Contact(LastName ='Test4',Email='test4@hotmail.com');
        lstContacts.add(contact1);
        lstContacts.add(contact2);
        lstContacts.add(contact3);
        lstContacts.add(contact4);
        
        Test.startTest();
        insert lstAccounts;
        insert lstContacts;
        Test.stopTest();
    }

}