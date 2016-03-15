public virtual class BaseClass {
    
    static Integer myStaticVariable = 0;
    
    public virtual void draw() {
        System.debug('Drawing in base');
    }
    
    public void incrementStaticVar()
    {
        myStaticVariable ++;
        System.debug(myStaticVariable );

    }
    
}