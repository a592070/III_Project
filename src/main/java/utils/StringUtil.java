package utils;

public class StringUtil {
    public static boolean isEmpty(String str){
        if(str==null) return true;
        str = str.trim().toLowerCase();
        return "null".equals(str) || "".equals(str) || "n/a".equals(str);
    }
}
