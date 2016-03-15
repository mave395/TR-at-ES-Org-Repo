trigger ContactTrigger on Contact (before insert) {
    ContactTriggerHandlerOverOptimized conTrgHandle = new ContactTriggerHandlerOverOptimized();
    //ContactTriggerHandlerOptimized conTrgHandle = new ContactTriggerHandlerOptimized();
    //ContactTriggerHandler conTrgHandle = new ContactTriggerHandler();
    List<Contact> trgReturnedContacts = new List<Contact>(Trigger.new);
   
    if(Trigger.isBefore && Trigger.isInsert){        
        conTrgHandle.associateAccountToContact(trgReturnedContacts );
    }
}