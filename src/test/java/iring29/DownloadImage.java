package iring29;

import java.io.*;
import java.math.BigDecimal;
import java.net.URL;
import java.sql.*;

public class DownloadImage {

	public static void main(String[] args) throws Exception {

		try (Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xepdb1", "iii_team_dba",
				"iiidba");
				PreparedStatement stmt = conn.prepareStatement("select r_sn, pic_url from restaurant where r_sn = ?")) {
			for (int i = 64; i < 127; i++) {
				stmt.setBigDecimal(1, BigDecimal.valueOf(i));
				// 再度使用try with resource 語法
				try (ResultSet rs = stmt.executeQuery()) {
					if (rs.next()) {
						int r_sn = rs.getInt("r_sn");
						String picture = rs.getString("pic_url");

						URL url = new URL(picture);
						File file = new File("/Users/irene/Desktop/image/" + r_sn + ".jpg");
						try (InputStream inputStream = url.openStream();
								BufferedInputStream bis = new BufferedInputStream(inputStream);
								FileOutputStream fos = new FileOutputStream(file);
								BufferedOutputStream bos = new BufferedOutputStream(fos)) {

							byte[] buffer = new byte[1024];
							int length;
							while ((length = bis.read(buffer)) != -1) {
								bos.write(buffer, 0, length);
							}

						} catch (FileNotFoundException e) {
							e.printStackTrace();
						}
					}
				} // 可以不用catch
				stmt.clearParameters();

				System.out.println("query finished");
			}
			System.out.println("finish");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
