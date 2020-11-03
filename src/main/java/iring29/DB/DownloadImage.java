package iring29.DB;

import java.io.*;
import java.net.MalformedURLException;
import java.net.URL;

public class DownloadImage {

	public static void main(String[] args) throws MalformedURLException {
		String sql = "select r_sn, picture from restaurant order by 1";
		//URL可以取得網站的內容，利用openStream可以取得InputStream
        URL url = new URL("https://dgo9uctxwg500.cloudfront.net/images/1200x1200/R13297_EZTABLE_0605_26_d64970519e.png");
        File file = new File("/Users/irene/Desktop/image/a.jpg");
        try (InputStream inputStream = url.openStream();
             BufferedInputStream bis = new BufferedInputStream(inputStream);
             FileOutputStream fos = new FileOutputStream(file);
             BufferedOutputStream bos = new BufferedOutputStream(fos)
        ) {

           byte[] buffer = new byte[1024];
           int length;
           while ( (length = bis.read(buffer)) != -1 ){
               bos.write(buffer,0,length);
           }
           
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

	}

}
