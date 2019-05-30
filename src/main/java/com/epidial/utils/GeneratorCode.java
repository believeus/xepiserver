package com.epidial.utils;

import java.util.Random;

/**
 * @ CreateDate : Create in 11:20 2019/3/7
 * @ Explain :  用于生成验证码
 * @ UpdateDate : Update in
 * @ Author : Eestill
 */
public class GeneratorCode {


    //生成4位随机验证码
    public static String getValidationCode_4(){
        String code = String.valueOf((new Random().nextInt(8999) + 1000));
        return code;
    }

    //生成6位随机验证码
    public static String getValidationCode_6(){
        String str = "";
        char[] ch = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K',
                'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'};
        Random random = new Random();
        for (int i = 0; i <6; i++){
            char num = ch[random.nextInt(ch.length)];
            str += num;
        }
        return str;
    }

    //根据时间生成15位订单号
    public static long getOrderCode(long time){
        //String prefix = String.valueOf(System.currentTimeMillis());
//        System.out.println(prefix.length());
//        System.out.println(prefix);
        String OrderPrefix = String.valueOf(time);
        String OrderSuffix = String.valueOf(new Random().nextInt(89) + 10);
//        System.out.println(suffix.length());
//        System.out.println(suffix);
        long orderid = Long.valueOf(OrderPrefix + OrderSuffix);
//        System.out.println(orderid);
        return orderid;
    }
}
