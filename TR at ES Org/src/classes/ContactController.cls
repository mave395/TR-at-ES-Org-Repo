//This class displays the related contacts of the Account using the AccountId from the query string.

global class ContactController{

    public String contactToBeDeleted {get;set;}
    
    public String getClickedAccount() {
        return null;
    }
    public List<Account> selectAccount;
    
    public String accountName{get;set;}
    
    public List<Contact> accRelatedContacts{get;set;}
    
    public String accId = ApexPages.CurrentPage().getParameters().get('id');
    
    public String accIdPermanent;
    
    public Integer noOfContacts {get;set;}
    
    public List<String> SerchAlpabet{get;set;}
    
    public String SearchVar{get;set;}
    
    public list<contact> showCon{set;get;}
    
    public list<contact> alphabetContacts{set;get;}


            
    //Initialize all the contacts for the particular account (id extracted from query string).
      
    public ContactController() {        
        
        accIdPermanent = accId;
        SerchAlpabet=new List<string>{'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','All'};
        accRelatedContacts = [SELECT Id,Name,Email,Phone FROM Contact where AccountId = : accId ];
        noOfContacts = accRelatedContacts.size();
        SearchVar='All';
        selectAccount = [select name from Account where id = :accId ];     
        accountName = (String)selectAccount[0].name;  
        System.debug('accountName : ======='+accountName );
        
        
        
    }
    
    //Deleting All Contacts being diaplayed on the page.
    
    public PageReference deleteContacts (){
        if(!accRelatedContacts.isEmpty()){
            delete accRelatedContacts;
        }
        return new PageReference('/apex/List_of_All_Accouts'); 
    }
    
    //Deleting single contact for the corresponding button being clicked.
    public void deleteContact(){
        List<Contact> lstContactDelete = [select id from Contact where id = :contactToBeDeleted];
        //delete lstContactDelete;
        accRelatedContacts = [SELECT Id,Name,Email,Phone FROM Contact where AccountId = : accId ];
        noOfContacts = accRelatedContacts.size();
    }
    
    //Populate the Contact list depending on the alphabet clicked for alphabetical search functionality.
    
    public PageReference display() {
        
        showCon = new List<Contact>();
        alphabetContacts = [SELECT Id,Name,Email,Phone FROM Contact where AccountId = : accIdPermanent];
         System.debug('SearchVar======>>>>>>>>'+SearchVar);
        for(Contact c : alphabetContacts)
        {
            if(SearchVar.equals('All'))
                showCon.add(c);
            else 
                if(c.Name.startsWith(SearchVar.toLowerCase())||c.Name.startsWith(SearchVar))
                showCon.add(c);
        }
        System.debug('ShowCon======>>>>>>>>'+ShowCon);
        accRelatedContacts = ShowCon;
        noOfContacts = accRelatedContacts.size();
        return null;
    }
    
    @RemoteAction
    global static String remotelyDeleteContact(ID conId){
                List<Contact> delOneCon = [select id,name from Contact where id = :conId];
                String nameOfTheDeletedContact = delOneCon [0].Name;
                delete delOneCon;
                return nameOfTheDeletedContact; 
    }
}