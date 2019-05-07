package com.example.demo;


import org.apache.tomcat.util.codec.binary.Base64;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @ CreateDate : Create in 15:53 2019/2/26
 * @ Explain :
 * @ UpdateDate : Update in
 */
public class Test {

    @org.junit.Test
    public void TestCode(){
        String uuid = "HKG201905051114";
        String Enuuid = encodeStr(uuid);
        System.out.println("加密后id为：" + Enuuid);
        String Deuuid = decodeStr(Enuuid);
        System.out.println("解密后id为：" + Deuuid);
    }

    public static String encodeStr(String plainText){
        byte[] b=plainText.getBytes();
        Base64 base64=new Base64();
        b=base64.encode(b);
        String s=new String(b);
        return s;
    }

    /**
     *
     * 创建日期2011-4-25上午10:15:11
     * 修改日期
     * 作者：dh     *TODO 使用Base64加密
     *return
     */
    public static String decodeStr(String encodeStr){
        byte[] b=encodeStr.getBytes();
        Base64 base64=new Base64();
        b=base64.decode(b);
        String s=new String(b);
        return s;
    }

//    static class DESUtil{
//        private static final String KEY_ALGORITHM = "DES";
//        private static final String DEFAULT_CIPHER_ALGORITHM = "DES/ECB/PKCS5Padding";//默认的加密算法
//
//        /**
//         * DES 加密操作
//         *
//         * @param content 待加密内容
//         * @param key 加密密钥
//         * @return 返回Base64转码后的加密数据
//         */
//        public static String encrypt(String content, String key) {
//            try {
//                Cipher cipher = Cipher.getInstance(DEFAULT_CIPHER_ALGORITHM);// 创建密码器
//
//                byte[] byteContent = content.getBytes("utf-8");
//
//                cipher.init(Cipher.ENCRYPT_MODE, getSecretKey(key));// 初始化为加密模式的密码器
//
//                byte[] result = cipher.doFinal(byteContent);// 加密
//
//                return Base64.encodeBase64String(result);//通过Base64转码返回
//            } catch (Exception ex) {
//                Logger.getLogger(DESUtil.class.getName()).log(Level.SEVERE, null, ex);
//            }
//
//            return null;
//        }
//
//        /**
//         * DES 解密操作
//         *
//         * @param content
//         * @param key
//         * @return
//         */
//        public static String decrypt(String content, String key) {
//
//            try {
//                //实例化
//                Cipher cipher = Cipher.getInstance(DEFAULT_CIPHER_ALGORITHM);
//
//                //使用密钥初始化，设置为解密模式
//                cipher.init(Cipher.DECRYPT_MODE, getSecretKey(key));
//
//                //执行操作
//                byte[] result = cipher.doFinal(Base64.decodeBase64(content));
//
//                return new String(result, "utf-8");
//            } catch (Exception ex) {
//                Logger.getLogger(DESUtil.class.getName()).log(Level.SEVERE, null, ex);
//            }
//
//            return null;
//        }
//
//        /**
//         * 生成加密秘钥
//         *
//         * @return
//         */
//        private static SecretKeySpec getSecretKey(final String key) {
//            //返回生成指定算法密钥生成器的 KeyGenerator 对象
//            KeyGenerator kg = null;
//
//            try {
//                kg = KeyGenerator.getInstance(KEY_ALGORITHM);
//
//                //DES 要求密钥长度为 56
//                kg.init(56, new SecureRandom(key.getBytes()));
//
//                //生成一个密钥
//                SecretKey secretKey = kg.generateKey();
//
//                return new SecretKeySpec(secretKey.getEncoded(), KEY_ALGORITHM);// 转换为DES专用密钥
//            } catch (NoSuchAlgorithmException ex) {
//                Logger.getLogger(DESUtil.class.getName()).log(Level.SEVERE, null, ex);
//            }
//
//            return null;
//        }
//
//
//    }
//
//    @org.junit.Test
//    public void add(){
//        //String uuid = "HKGEPI2019418143047";
//        //String content = "hello,您好";
//        String content = "HKGEPI2019418143047";
//        //String content = "eestill@163.com";
//        //String key = "sde@5f98H*^hsff%dfs$r344&df8543*er";
//        String key = "it@hkgepitherapeutics.com";
//        System.out.println("content:" + content);
//        String s1 = DESUtil.encrypt(content, key);
//        System.out.println("s1:" + s1);
//        System.out.println("s2:"+ DESUtil.decrypt(s1, key));
//
//    }


//    @Value("${spring.mail.username}")
//    private String postName;
//
//    @Autowired
//    private JavaMailSender mailSender; //框架自带的
//
//    @org.junit.Test
//    public void Mail(){
//
//        System.out.println("------------");
//        System.out.println(postName);
//        SimpleMailMessage message = new SimpleMailMessage();
//        message.setFrom(postName);
//        message.setTo("eestill@163.com");
//        message.setSubject("主题：简单邮件");
//        message.setText("测试邮件内容");
//
//        mailSender.send(message);
//    }
//    @org.junit.Test
//    public void Createuuid(){
//        String uuid = "";
//
//        Calendar date = Calendar.getInstance();
//        uuid = "HKEPI" + date.get(Calendar.YEAR) + date.get((Calendar.MONTH) + 1 ) + date.get(Calendar.DAY_OF_MONTH) + date.get(Calendar.HOUR_OF_DAY) + date.get(Calendar.MINUTE) + date.get(Calendar.SECOND) + Math.round(Math.random() * 10000);
//        System.out.println(uuid);
//    }
//
//    @org.junit.Test
//    public void Date(){
//        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
//        long time = 1551283200185L;
//        //将数据库中传递来的数据从时间戳转换成规整格式的String类型的时间
//        String date = simpleDateFormat.format(time);
//
//        System.out.println(date);
//        Date GetDate = null;
//
//        //将时间规整过的时间转换成date类型
//        try {
//            GetDate = simpleDateFormat.parse(date);
//        } catch (ParseException e) {
//            e.printStackTrace();
//        }
//
//        System.out.println(GetDate);
//
////        Date date = new Date();
////        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
////        String time = simpleDateFormat.format(date);
////        System.out.println(time);
//        //System.out.println(simpleDateFormat.parse(time));
//
////        Calendar calendar = Calendar.getInstance();
////        int y = calendar.get(Calendar.YEAR);
////        int m = calendar.get(Calendar.MONTH) + 1;
////        int d = calendar.get(Calendar.DAY_OF_MONTH);
////        String time = y + "-" + m + "-" + d;
////        System.out.println(time);
////        calendar.setTime(y,m,d);
//
////        Calendar calendar = Calendar.getInstance();
////        int h = calendar.get(Calendar.HOUR_OF_DAY);
////        int mi = calendar.get(Calendar.MINUTE);
////        int s = calendar.get(Calendar.SECOND);
////
////        long time = System.currentTimeMillis();
////
////        long day = time - ((h * 60 * 60 * 1000) + (mi * 60 * 1000) + (s * 1000));
////
////        System.out.println(day);
//
//
//
//    }
//
//    @org.junit.Test
//    public void GetWeek(){
//        Calendar c=Calendar.getInstance();
//        int i = c.get(Calendar.WEEK_OF_YEAR);
//        System.out.println(i);
//    }
//
//    @org.junit.Test
//    public void TestDouble(){
//        Double time = 1556.0;
//        System.out.println(time);
//        Integer Inttime = time.intValue();
//        System.out.println(Inttime);
//    }
//
//    @org.junit.Test
//    public void Uuid(){
//        UserCreate userCreate = new UserCreate();
//        System.out.println(userCreate.getUuid());
//    }
//
//    @org.junit.Test
//    public void Code(){
//        GeneratorCode generatorCode = new GeneratorCode();
//        System.out.println(generatorCode.getValidationCode_4());
//
//        System.out.println(generatorCode.getValidationCode_6());
//    }
//
//    @org.junit.Test
//    public void Json(){
//        String json = "    {\"uuid\": \"123\",\n" +
//                "    \"wares\": [\n" +
//                "        {\n" +
//                "            \"wares_id\": \"123\",\n" +
//                "            \"wares_count\": \"123123\"\n" +
//                "        },\n" +
//                "        {\n" +
//                "            \"wares_id\": \"12223\",\n" +
//                "            \"wares_count\": \"33321321\"\n" +
//                "        },\n" +
//                "        {\n" +
//                "            \"wares_id\": \"3332\",\n" +
//                "            \"wares_count\": \"23213112\"\n" +
//                "        }\n" +
//                "    ]}";
//
//        JSONObject jsonObject = JSON.parseObject(json);
//        try {
//            System.out.println("uuid : " + jsonObject.getString("uuid"));
//
//            System.out.println("list:");
//            JSONArray data = jsonObject.getJSONArray("wares");
//            //List<Cart> list = JSONObject.parseArray(data.toJSONString() , Cart.class);
//            //System.out.println(list);
//            JSONArray seconddataArray = jsonObject.getJSONArray("wares");
////            for (int x = 0; x < seconddataArray.size(); x++)
////            {
////
////                JSONObject seconddata = (JSONObject) seconddataArray.get(x);
////                //System.out.println(seconddata.toJSONString());
////                System.out.println(seconddata.get("wares_id"));
////                System.out.println(seconddata.get("wares_count"));
////            }
//            for (int x = 0; x < seconddataArray.size(); x++)
//            {
//                Wares wares = new Wares();
//                JSONObject seconddata = (JSONObject) seconddataArray.get(x);
//                //System.out.println(seconddata.get("wares_id"));
//                wares.setWares_id(Integer.parseInt(seconddata.get("wares_id").toString()));
//                System.out.println("wares_id :" + wares.getWares_id());
//                //System.out.println(seconddata.get("wares_count"));
//                wares.setWares_count(Integer.parseInt(seconddata.get("wares_count").toString()));
//                System.out.println("wares_count:" + wares.getWares_count());
//            }
//        } catch (JSONException e) {
//            e.printStackTrace();
//        }
//
//    }
//
//    @org.junit.Test
//    public void Time(){
//        System.out.println(System.currentTimeMillis());
//    }
//
//    @org.junit.Test
//    public void OrderCode(){
//        String prefix = String.valueOf(System.currentTimeMillis());
//        System.out.println(prefix.length());
//        System.out.println(prefix);
//        String suffix = String.valueOf(new Random().nextInt(89) + 10);
//        System.out.println(suffix.length());
//        System.out.println(suffix);
//        long orderid = Long.valueOf(prefix + suffix);
//        System.out.println(orderid);
//    }
//
//    @org.junit.Test
//    public void matcher(){
//        String data = "1|2|0.5|4|5|6|7|8|9";
//
////        Matcher matcher = Pattern.compile("(?<=\\{[0-9]).+(?=})").matcher(data);
////        while(matcher.find()){
////            System.out.println(matcher.group());
////        }
//
//        String[] a = data.split("\\|");
//        System.out.println("开始的a数组为：");
//        System.out.println(Arrays.toString(a));
//
//        a[3] = "8";
//        System.out.println(Arrays.toString(a));
//    }
//
//    @org.junit.Test
//    public void Verification_Code(){
//        String str = "";
//        char[] ch = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K',
//                'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'};
//        Random random = new Random();
//        for (int i = 0; i <6; i++){
//            char num = ch[random.nextInt(ch.length)];
//            str += num;
//        }
//        System.out.println(str);
//    }
//
////    @org.junit.Test
////    public void Repeater(){
////        while (true){
////            Verification_Code();
////            try {
////                Thread.sleep(500);
////            } catch (InterruptedException e) {
////                e.printStackTrace();
////            }
////        }
////    }
//
//    @org.junit.Test
//    public void TestUpper(){
//        String str = "47axxS";
//        System.out.println(str);
//
//        System.out.println(str.toUpperCase());
//    }
//
//    @org.junit.Test
//    public void TestMap(){
//        Map<String , Object> map = new HashMap<String , Object>();
//        map.put("toto" , "123123");
//
//        System.out.println(map.get("toto").toString());
//    }
//
//
//    @org.junit.Test
//    public void Split(){
//        String url = "/App/login";
//        String [] a = url.split("/");
//
//        System.out.println(Arrays.toString(a));
//        System.out.println(a[1]);
//    }
//
//    @org.junit.Test
//    public void Simp(){
//        long a = 1553097600;
//
//        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy");
//        System.out.println(simpleDateFormat.format(a * 1000));
//    }
//
//    @org.junit.Test
//    public void Function(){
//        String str = "4|1|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0";
//        String str1 = "4|1|1|0|0|0|0|0|0|0|0|0|3|2|2|2|2,3,3|2";
//        List list = new LinkedList();
//        list.add(str);
//        list.add(str1);
//        String [][] data = new String[18][list.size()];
//        //String [] a = new String[18];
//        //a = str.split("\\|");
//        //System.out.println(Arrays.toString(a));
//        for (int i = 0 ; i < list.size() ; i++){
//            String [] a = list.get(i).toString().split("\\|");
//            for (int j = 0 ; j < a.length ; j++){
//                //System.out.println(a[j]);
//                data[j][i] = a[j];
//            }
////            System.out.println(list.get(i));
////            String [] a = list.get(i).toString().split("\\|");
////            System.out.println(Arrays.toString(a));
//        }
//
////        System.out.println(Arrays.toString(data));
//        for (int m = 0 ; m < 18 ; m++){
////            System.out.printf("数组" + m + ": [");
////            for (int n = 0 ; n < 2 ; n++){
////                System.out.printf(data[m][n] + ",");
////            }
////            System.out.println("]");
//
//            System.out.println(Arrays.toString(data[m]));
//        }
//    }
//
//    @org.junit.Test
//    public void bianli(){
//        long num = 13215361156l;
//
//        for (int i = 0; i < 100 ; i++ ){
//            System.out.println(num++);
//        }
//    }
//
//    @org.junit.Test
//    public void SubString(){
//        String url = "/order/index";
//        System.out.println(url.substring(1));
//    }
}

