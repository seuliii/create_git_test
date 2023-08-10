<%@ page import="java.text.SimpleDateFormat,
                 java.util.Date,
                 javax.crypto.Cipher,
                 javax.crypto.spec.SecretKeySpec"%><%!
/**
 * 
 * @author Administrator
 *
 */
public class IFSSO {
	
	/**
	 * 
	 */
	public IFSSO(){}
	 
	/**
	 * 16bit key 생성
	 * @param key
	 * @return
	 * @throws Exception
	 */
	public static String setKey(String key) throws Exception {
		key = key +key;

		int len= key.length();
	    if(len >= 16 ){
	    	key = key.substring(0,16);
	    }else{
	      for(int i=0;i < 16- len; i++){
	    	  key = key + i;
	      }
	    }  

	      return key;
	}
	
	/**
	 * 
	 * @param s
	 * @param key
	 * @return
	 * @throws Exception
	 */
	public static String encrypt(String s, String key) throws Exception {  

         String encrypted = null;  

         try {  

        	 key = setKey(key);        	 
             SecretKeySpec skeySpec = new SecretKeySpec(key.getBytes(), "AES");                 
             Cipher cipher = Cipher.getInstance("AES");  
             cipher.init(Cipher.ENCRYPT_MODE, skeySpec);                  
             encrypted = byteArrayToHex(cipher.doFinal(s.getBytes()));  
             return encrypted;  
         } catch (Exception e) {  
            throw e;  
         }  
     }  

	/**
	 * 
	 * @param s
	 * @param key
	 * @return
	 * @throws Exception
	 */
	public static String decrypt(String s, String key) throws Exception {  
         String decrypted = null;  
         try {  

        	 key = setKey(key);    
        	 
             SecretKeySpec skeySpec = new SecretKeySpec(key.getBytes(), "AES");  
             Cipher cipher = Cipher.getInstance("AES");  
             cipher.init(Cipher.DECRYPT_MODE, skeySpec);  
             decrypted = new String(cipher.doFinal(hexToByteArray(s)));  
             return decrypted;  
         } catch (Exception e) {  
             throw e;  
         }  
     }          

	public static byte[] hexToByteArray(String s) {  
         byte[] retValue = null;  
         if (s != null && s.length() != 0) {  
             retValue = new byte[s.length() / 2];  
             for (int i = 0; i < retValue.length; i++) {  
                 retValue[i] = (byte) Integer.parseInt(s.substring(2 * i, 2 * i + 2), 16);  
             }  
         }  
         return retValue;  
     }          

	/**
	 * 
	 * @param buf
	 * @return
	 */
	public static String byteArrayToHex(byte buf[]) {  
         StringBuffer strbuf = new StringBuffer(buf.length * 2);  
         for (int i = 0; i < buf.length; i++) {  
             if (((int) buf[i] & 0xff) < 0x10) {  
                 strbuf.append("0");  
             }  
             strbuf.append(Long.toString((int) buf[i] & 0xff, 16));  
         }              
         return strbuf.toString();  
     }  
	
	/**
	 * 대칭키 생성
	 * @return
	 */
	public static String getKey() {  
		String  nowDate = new SimpleDateFormat("yyyyMMdd").format(new Date());
		return nowDate;
	}
	
}
%>