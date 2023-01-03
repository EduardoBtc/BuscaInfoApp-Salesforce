public with sharing class StringUtils {
    
    public static String removeSpecialCharacters(String str) {
        return str.replaceAll('[^a-zA-Z0-9]', '');
    }
}