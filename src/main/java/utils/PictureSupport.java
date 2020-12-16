package utils;

import java.io.IOException;
import java.lang.reflect.Field;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;

import org.springframework.transaction.annotation.Transactional;

public class PictureSupport {

    /**
     * 傳入entity 物件、url屬性名、byte[]屬性名，將圖片解析為byte[]存入 entity.sDestField
     * @param entity        entity 物件
     * @param sOriginField  pictureURL， column type(String)
     * @param sDestField    picture， column type(byte[])
     * @param <T>
     * @throws Exception
     */
    public static <T> void writeToDB(T entity, String sOriginField, String sDestField) throws Exception {
        Class<?> entityClass = entity.getClass();
        String url = "";
        try {
            Field originField = entityClass.getDeclaredField(sOriginField);
            Field destField = entityClass.getDeclaredField(sDestField);
            originField.setAccessible(true);
            destField.setAccessible(true);

            url = String.valueOf(originField.get(entity));

            byte[] bytes = IOUtils.urlToByteArray(url);
            destField.set(entity, bytes);

            System.out.println("添加成功: "+url);
        } catch (Exception e) {
            System.out.println("添加失敗: "+url);
            throw e;
        }
    }
}
