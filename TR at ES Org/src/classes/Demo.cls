public class Demo{
    
    void replaceChar(String charToReplace,String charToBeReplacedWith,List<String> lstStrings){
        for(String eachString : lstStrings){
            eachString.replace(charToReplace,charToBeReplacedWith);
        }        
    }
    
    public void unique(integer[] numbers)
    {
          Integer size = numbers.size();
          Set <Integer> uniqueSet = new Set<Integer>();
          for(Integer i=size-1; i>=0; i--)
          {
              uniqueSet.add(numbers[i]);
          }
          System.debug(uniqueSet);                    
    }
}