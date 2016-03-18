//This Class Displays all the Accounts present in the Org and also returns search result for search box.

public class DisplayAccounts {
    public List<Account> accList{set;get;}
    public String accId {set;get;}
    public String searchTerm {get;set;}
    public Integer noOfAccounts {get;set;}
    public String searchError{get;set;}
    public Boolean boolSrchError{get;set;}
    
    
    public DisplayAccounts(){}//Default constructor
    
    //Populating all Accounts of Org.
       
    public DisplayAccounts (ApexPages.StandardController sc){
        System.debug(sc);
        accList = [select Name,Person_Email__c,Phone,Website from Account];
        noOfAccounts = accList.size();
        
    }
    
    
    
    public PageReference getAccountDetails(Integer Accid){
        return new PageReference('');
    }
    
    //Method to redirect the page with the id of the Account being clicked.
    
    public PageReference showContacts(){
        //System.debug('+++++++++++>>>>>>>>'+accId);
        return new PageReference('/apex/AccountReletedContacts?id='+accId);
        
    }
    
    //The records are searched for Name field based on the SearchText entered in the Search Field.
    
    public PageReference search(){
        System.debug(searchTerm);
        if(String.isNotEmpty(searchTerm) && searchTerm.length()>2){
            boolSrchError = False;
            string str = '%'+searchTerm +'%';
            accList = [select Name,Person_Email__c,Phone,Website from Account where Name like : str];
            System.debug('accList ============'+accList );
            noOfAccounts = accList.size();
        }
        else{
                boolSrchError = True;
                searchError='Enter atleast 3 characters for search';
        }
        
        return null;
    }
    
     public PageReference clear(){
         boolSrchError = False;
         searchTerm='';
         accList = [select Name,Person_Email__c,Phone,Website from Account];
         noOfAccounts = accList.size();
         return new PageReference('/apex/List_of_All_Accouts');
     }
    
}