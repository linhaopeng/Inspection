package net.baojuxinxi.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import org.apache.commons.codec.binary.Base64;


public class Bas64Utile {

	public static void main(String[] args)  
    {  
//	 String strImg = getImageStr("d://x.png");
	  String strImg = "/9j/4QAYRXhpZgAASUkqAAgAAAAAAAAAAAAAAP/sABFEdWNreQABAAQAAABQAAD/4QN6aHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLwA8P3hwYWNrZXQgYmVnaW49Iu+7vyIgaWQ9Ilc1TTBNcENlaGlIenJlU3pOVGN6a2M5ZCI/PiA8eDp4bXBtZXRhIHhtbG5zOng9ImFkb2JlOm5zOm1ldGEvIiB4OnhtcHRrPSJBZG9iZSBYTVAgQ29yZSA1LjMtYzAxMSA2Ni4xNDU2NjEsIDIwMTIvMDIvMDYtMTQ6NTY6MjcgICAgICAgICI+IDxyZGY6UkRGIHhtbG5zOnJkZj0iaHR0cDovL3d3dy53My5vcmcvMTk5OS8wMi8yMi1yZGYtc3ludGF4LW5zIyI+IDxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PSIiIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIiB4bWxuczpzdFJlZj0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlUmVmIyIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bXBNTTpPcmlnaW5hbERvY3VtZW50SUQ9InhtcC5kaWQ6ODg3ZjIyOWEtMTg0MC04MjRjLTg2N2MtZDdmMmVlNmEwODZhIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOjFGQUVEQThGMDY5QjExRTY4NkU4QUE3OEZENDU5RTQzIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOjFGQUVEQThFMDY5QjExRTY4NkU4QUE3OEZENDU5RTQzIiB4bXA6Q3JlYXRvclRvb2w9IkFkb2JlIFBob3Rvc2hvcCBDQyAoV2luZG93cykiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozMDMzY2JiMC1mOGMwLTNmNGUtOWE3NS1iNDQ0NzEzNWY4OGQiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6ODg3ZjIyOWEtMTg0MC04MjRjLTg2N2MtZDdmMmVlNmEwODZhIi8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3Jk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v7Txz73D3J849tt/nWf2o94+w9nb8ievHsw5m/R+7+08c+9w9yfOPbbf51n9qPePsPZ2/Inrz6nizmt1RIa4lsWFK/uy7aiQ0XvmxYvr+BBi7T+iXNC31m4pA8xdj8hRf3y3Z+pGzA7FVhPn0j9zN+6T3G/2tZnkbza+Tchh49jxmRycVxp116XKR6WpFk62z2knpoomW9TI9CcIdI8M/pVyzlFi33E7i1eI1ALWp8oTJyf/ACYjrwDNQ5z433u/U11gVIenByxHkLcMD4APhl2qOjp8aqK6goK2PUU1SwmPXVsVBNtMtI8EpSXwmfiZ9T6jqBOZpgGJ72dZBua+XV2TBSYE5s2pUc1KTvQrxLcgyUX/AEMYe+2NO+oei9dVbjDDJGR8IwfkMyNtubNtattZwynIPkPx8Jjv0dVJkU8p+IS36BSlVLm9Zdk1t9pXQlEStUHp62otW8q21r02MmWpyazk9nI0nr49nhxz8s9pvbkWxVbhZ6XAccHPxcfJibYSExYCICICICICICICICICICICICICICICICICICICICICICICICICICICICICICICICICICICICICICICICICICICICICICICICICICICICICICICICICICICICICICICICICICICICICICICICICICICICICICICICICICJ//9k=";
        System.out.println(strImg);  
        generateImage(strImg,"d://x.jpg");
    }  
    //图片转化成base64字符串  
    public static String getImageStr(String filePath)
    {//将图片文件转化为字节数组字符串，并对其进行Base64编码处理  
        String imgFile = filePath;//待处理的图片  
        InputStream in = null;  
        byte[] data = null;  
        //读取图片字节数组  
        try   
        {  
            in = new FileInputStream(imgFile);          
            data = new byte[in.available()];  
            in.read(data);  
            in.close();  
        }   
        catch (IOException e)   
        {  
            e.printStackTrace();  
        }  
        //对字节数组Base64编码  
        Base64 encoder=new Base64();
        return new String(encoder.encode(data));//返回Base64编码过的字节数组字符串  
    }  
      
    //base64字符串转化成图片  
    public static boolean generateImage(String imgStr,String imgFilePath)  
    {   //对字节数组字符串进行Base64解码并生成图片  
        if (imgStr == null) //图像数据为空  
            return false;  
        Base64 decoder=new Base64();
        try   
        {  
            //Base64解码  
            byte[] b = decoder.decode(imgStr); 
            
            for(int i=0;i<b.length;++i)  
            {  
                if(b[i]<0)  
                {//调整异常数据  
                    b[i]+=256;  
                }  
            }  
            File file = new File(imgFilePath);
            //判断目标文件所在的目录是否存在  
            if(!file.getParentFile().exists()) {  
                //如果目标文件所在的目录不存在，则创建父目录  
                System.out.println("目标文件所在目录不存在，准备创建它！");  
                if(!file.getParentFile().mkdirs()) {  
                    System.out.println("创建目标文件所在目录失败！");  
                    return false;  
                }  
            }  
            OutputStream out = new FileOutputStream(file);//新生成的图片   
            out.write(b);  
            out.flush();  
            out.close();  
            return true;  
        }   
        catch (Exception e)   
        {  
            return false;  
        }  
    }  
    
}
