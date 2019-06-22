package com.alipay.config;

import java.io.FileWriter;
import java.io.IOException;




/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

 // 沙箱应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
 	public static String app_id = "2016091900550321";
 	
 	// 商户私钥，您的PKCS8格式RSA2私钥
     public static String merchant_private_key = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDdqGoKx/bmCPCyAxOGXoHN4GfazxEUWf+NSmRgOXTwQfML15pNq3HcPPD4MR8rBdMyVg1a6vKC42oWyQmxBbLGblNkBA4dYCwxTaQ5gAAIo5TnOPkKU5bp7WG41//92JRYFT56RL+JEp0hGbOzSFT0/xdsWPzZApXbnH0Zp1jJm9DLmQfswGbCxbp88TK+RHmaU8bpqyzovAD/sNGHHlQMk48owSnrae6sYwehC9KA4k3VRs8eejsDhDiLPPYmyhVp8SFh8t2zIG2y95wbpXm4XbnxIEKzk7krcD63mE6l/40PaC6Gg6R7DCve0Dafmny0LRzT7+78uL+G7nVxDNbjAgMBAAECggEALq1tj1Gmy7BsR4BgVzaFrT4pgKmEVj3RlAZrdtwCpSmuLfs8Mkj9VDy9HfbyMlQqsnnunAvIAAo16BBz6wRhLmpDQ1ebRVJgXA2WnMk4uJkCHWMhBqytphtoLc3GycUXECmBG6xojUwPLM5FymZcBa/GVfmzXVuvBS1CJunXx7SU+w+knbvp0ltwGr7KDty89+jwJbX3Pm8bxW9TNk4Oknjltoj1heYeb57O4WKtPBdpLYizk3fkdoo1NKxwJFb5CKHWSMx4DiGE/EWwB34cncQWsNdXUuJoyunfnNRdYl/oCYqE59iiDbl/pZqJgv8A61aq2ZFgF7HmhsEUeniogQKBgQD0ESR4PL7EMF4TI7kGstp4ZbyCXUmko3NVM0iMxcR662Fqy+m00qGwZNxSqCx6eNkCUYJk19YAOMd7S8nSbqW75JRdyPBLgBtU4yxFDarAci0RIjmdCEcV0meMpsvLmmjyIK8pU9/tDuqQypB5Vh68WGFFmQuSlCbn4F1Rj0PcIwKBgQDofsn39xPqF+Gk+IYCRyDZXi4qeXVhiDjYO5JrWEhEAFrRQOAQMNjud1xLMzMs8gsW2qLgNbJ+0rN4IpMyP2ImOH8B/Gu2MUi+jeT4PtE6C9bVt7Hx/uNImSWV80TIOIJvNAzMsIrvto9ICBiBXNbi1eVcd0QeggUC6gnRcDRmQQKBgQCb68esuMH2fB/dgljWGrTPbc88SXSepX0s1RJoPIAFNxKJM7QePOHm2siWVbH0m/enL4NqASlKAvwNnKFWujFPE/xk3dYFpdXQKUFC7DRFtats4ryDwaIIIt7cUEKp0/9vj8nXUSohPAJGdeJOYeJI2P1rhRaLkfI4+HElha0ImQKBgDv/5H1yrRf/m8LoRCU4V/jgvkdF2w4Vip37GblMKjIqaUWRWYG0KXe5I/9gMjfKKyR1vgzgrrTeCWTaf2Q7SUgV0mkfzGhTZbOPiOSryXESdxnmcyzBm8QziaieBEUrmDW8mAUHFoPweB+dvz07SVV2398yBElfQo3S+j+rlkpBAoGAf6El2TYy0Pvpyp/+M475VebsaLfrELE6jM9z5BqPb5mhSt60ryJIuixtsa0xEqBcv7Q+gAf1f1UsVNbwSNx9fOgBAz08jPJnQyGeiBPdQOHm7xhQktA+uThE8KiL8D5CrxOPU9pTReF/eBIrVDgQGm8qYWHvxP/xzrZC33QRFxI=";
 	
 	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
     public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAtiYS8ariBu39kY4vj+IRpADdtpOfvCqM7fCAXjziIzmCbfCeUgcgbhmMPK6fWhXGBPFz3iucLJvsdCShdBMHSsOCbf2JIy1Wd3rkjfLPXnqnhBMw6eDX6ptsdoeRG025+UU+z5HirdQMhTV0NRXHNoDL/K35E/cRbc3RV4176/cjvksfg092FPH4anTSUfHCp8OEWWz5s6RvswuyvZ/XBV+OVoDpuaKeEV45fcRYEroxjfyXOcKcaK1+S769aX7sQMto0LJkpj3omWDaTasxHTlHiI0tuqAj6BHbI3s2eZLTOnFJ2kCyh07qCNRYftQ3ckvq9/gWDwZcUP4EtoTOkwIDAQAB";
   
     
 	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
 	/*public static String app_id = "2018111362123857";
 	
 	// 商户私钥，您的PKCS8格式RSA2私钥
     public static String merchant_private_key = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCtvNS0TilG1rdnaHhXl63elOhfPl+GdbqHMJk5yiBNqX1vr8pQMyYjVoN3EgcHzaGLVf6FW8TJ4s1tq3wt/+G+EOsSFTv0KEAE41KuHr2d8UE3iqRhtbOSWhej45ZrmA3Li3fczp9KPUZJbMznUZFF8w4sYBSZtB4GLmKZ0vu5NOHIuStuQkrx+mCYR9+PVmvOG281incHsg++/5V/6M/bcO6RLJu3zRmdf6ErggDIfbVklOsqfkQP9OZEAaqpTlfpdMD4kkyE3aPbIkKMnDtZdyyx8RItq7Y4dyEXBLt9AJCNOz27XasB+w9jhNjXZJOGbTIJXdOux9HpYuPVDf3fAgMBAAECggEAPjEuYyznkbgjBx1aluBxGRBs7ktBnrxd/S7kas90KNjXUje3UGY+7L93aBRH9/8gKOSrq8lh9HL/3pZYaY8DnCoqO9rmD0ypPhax7iqK7hMCqYMzvNZyZZ1igQRjQDi6F3bhfWVpmAW/N2F/J/8G5edP14q9VRgo90V7fl0MRwuSOgiLhS2gl3kwkfVuoJ/3JtLrYYJhQcrg530d+B6cciRpDSsG/ygLfahkKCVnIT4bgPEn+UASonLoEmj4PmBIsDmWEmfjAnCB6/7Y9Ry6NXiuudiYKsEF46t94pZFmsvvj5dWb7V9YbxGqY9RT+XJpBetGTljdn/qKwlNdB52IQKBgQD23N/nBJJmoc0pVoyAaK720z7NqRDdobGYpwPN9ViWNfywiUNRpNKSMDBsAm8sF7UzJ7QU3djwfW5uE8ovxhTXxBWiU2Vkg4vaYTFSCdJE/09CJ6ACl6490t+BOivr/AdI7hvtEJ0O9igs9ELFEKyhAOyXM+sCzMxk3Sd/pgZskwKBgQC0KxDFgc/0Uf2NCS9XDbPP3q+PvEBNResim4TSFzys3u4eUx4D6CBBnTGBtuo+0MOn1GtpdO7gOY1h02h3+GN1DbuWHKoTUq+gvx22dV7P36VcTha5Yv7Q/wvYGm8A/WZJ5X8DxK44tcYifa8q9lljKI9NLD0e1zUqfq9RLlUFBQKBgFO8PB6KiHZTr9mzx9jOqXqD0SvFizkCXdFf5YR5EmFxUpM3HCSXee2oduRMNxWHvSjq8MSbM7jvcwPXpp9p2ywNESGMlDnx/QBIM4iWWEKbL3FLK5V1id7ipnmZF8jmJjpwufxBxGSMzrfg6r0ZmNTMEXSAYdkDStlzwrAjys4NAoGAHiWOmt3LxB/sAytkRna+favPSIfBYqyuWY4YPWcx+eMbiOtzfEfdDd2VqRTIQVaBRpXemzi7t70pkRLkyh4/1hhEKSwGsVEGnikcealOAg50BuvyFXchGCt0+eYCaPH9qaPDCwhf9pFD5AWPx+qMrnDc+ZbLa1urQ78K6tSL2VkCgYEA6udUzMhCAQE7rMJhtCyPL1A1U3/ET1hXD11rW5jPTjFbnqhi8xnj92IHeiIHlvsAcoGLtjFWDbyy7dUyKMOM0JVPZyI+obIU9IngPC30SM7mbVMl2El71+uT7eDexZnuWenfZU8BXtpoCBLgn7mkQk8eDwjESO4HST3dpK/oazQ=";   
     // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA2RnnQETx1UUyU0GkEYI9WsF2S+PZs7q++1D+7vPtlYdyiKcBXT85qCvX6AgpEPKE7rjZOBNlNtcms6O1lP6HWxy7uAPJ005kRW//vZFKKZRsiTmCi06RCn9WHQ4RVniCh66bYsyC7GD+5DMuQLdvvyWJd0b31EMmu4fW1mFIV3bT/EMk6QwNsw/CWxrclYU7v0ix09DvHCfcRZNH8Dl/PrgoFPDi46MuuJYfhwucIWLx/tgRx6onxG8BsS70DIZpdRvg+tjQEMpbf7oWJYbQ4NIP5yNN7/vSj5vPkb5Wc1tQtB1lMu7OP6mBtkf1dd4g8t2tsDnrNUAwitJHoUubcQIDAQAB";
  */
     
     
    
    // 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://localhost:8090/OnlieBookstore/notify_url.jsp";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://localhost:8090/OnlieBookstore/return_url.jsp";

	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	
	// 支付宝网关
	public static String log_path = "C:\\";
	//AlipayClient alipayClient = new DefaultAlipayClient(URL,APP_ID,APP_PRIVATE_KEY,FORMAT,CHARSET,ALIPAY_PUBLIC_KEY,SIGN_TYPE);

//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
