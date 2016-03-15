public class BasicApexProgramming {
    
    public static Integer inputNumber;
    public static String  inputString1,inputString2;
    public static List<String> inputStrings = new List<String>() ;
    
    public BasicApexProgramming()
    {
    }
    public BasicApexProgramming(Integer ipNum){
        inputNumber = ipNum;
        System.debug('This is a parameterized constructor');
    }
    
    
    public void checkPrime (Integer inputNum) {
          
          Integer c = 0,i;
          
          for (i= 1 ; i <= inputNum ; i++) {
              if (math.mod(inputNum,i) == 0)    //math.mod(inputNum,i);
              c++;
          }
          
          if (c == 2) {
            System.debug(inputNum + ' is a Prime number');
          }
          else {
            System.debug(inputNum + ' is not a Prime number');
          }
    }
    
    public void checkPalindrome(String inputStr1,String inputStr2){
        
        //String revString = inputString.reverse();
        
        Integer isPalindrome = inputStr1.compareTo(inputStr2);
        if (isPalindrome == 0)
        System.debug('Strings are palindrome ');
        else
        System.debug('Strings are not palindrome ');
    }
    
    public void lengthOfString(String inputStr1){
        
        Integer[] chars = inputStr1.getChars();
        System.debug('Length is =======>>>>'+chars.size());     
        
        /*
            Integer i=0;
            for (Integer i : chars) {
                i++;
            }
        */
    }
    
}