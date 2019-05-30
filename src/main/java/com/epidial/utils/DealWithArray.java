package com.epidial.utils;

import java.lang.reflect.Array;

/**
 * @ CreateDate : Create in 11:31 2019/3/25
 * @ Explain :
 * @ UpdateDate : Update in
 * @ Author : Eestill
 */
public class DealWithArray {

    public static String[] DoChange(String []a){
        String [] d = new String[a.length];
        for (int i = 0 ; i < a.length ; i++){
            d[i] = a[a.length - i - 1];
        }
        return d;
    }

    public static String[][] DoChangeDouble(String [][]a){
        String [][] d = new String[a.length][];
        for (int i = 0 ; i < a.length ; i++){
            d[i] = a[a.length - 1 - i];
        }
        return d;

    }
}
