package com.epidial.utils;

/**
 * @ CreateDate : Create in 17:22 2019/3/19
 * @ Explain :
 * @ UpdateDate : Update in
 * @ Author : Eestill
 */
public class SplitUrl {
    public static String SplitUrl(String url){
        String []a = url.split("/");
        return a[1];
    }
}
