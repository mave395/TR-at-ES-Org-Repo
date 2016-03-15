trigger TaskCreation on Account (after insert) {
    List<Task> tasks = new List<Task>(); 
    List<Account> lstAccountsTrggNew = Trigger.New;
    
    for(Account eachAccount : lstAccountsTrggNew){
        Task tsk = new Task(Ownerid = eachAccount .OwnerId, Subject='Meeting with '+eachAccount.name,whatid=eachAccount .id);
        tasks.add(tsk); 
    }
    insert tasks;
 }