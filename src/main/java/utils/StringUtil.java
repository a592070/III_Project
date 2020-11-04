package utils;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class StringUtil {
    public static boolean isEmpty(String str){
        if(str==null) return true;
        str = str.trim().toLowerCase();
        return "null".equals(str) || "".equals(str) || "n/a".equals(str);
    }
    public static String urlEncode(String str, String charset) throws UnsupportedEncodingException {
        StringBuilder stringBuilder = new StringBuilder();
        char[] chars = str.toCharArray();
        for (char c : chars) {
            if(!(c==':' || c=='!' || c=='#' || c=='&' || c=='/' || c=='?' || c=='=')) {
                String encode = URLEncoder.encode(String.valueOf(c), charset);
                stringBuilder.append(encode);
            }else{
                stringBuilder.append(c);
            }
        }
        return stringBuilder.toString();
    }
}
