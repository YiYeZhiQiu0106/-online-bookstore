package zhl.util;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;

/**
 * 生成随机验证�?
 * @author Administrator
 */
public class ImageUtil {
	
	private static String[] strs = { "a", "b", "c", "d", "e", "f", "g", "h",
			"i", "j", "k", "m", "n", "p", "q", "r", "s", "t", "u",
			"v", "w", "x", "y", "z",  "2", "3", "4", "5", "6", "7", "8","9" };

	/**
	  * 方法的描述： 随机生成随字符串
	  * @param n 生成字符个数
	  * @return  String 生成的字符串
	 */
	private static String getRundomStr1(int n) {
		// 用Stringbuffer拼接字符�?
		StringBuffer s = new StringBuffer();
		// 循环控制字符个数
		for (int i = 0; i < n; i++) {
			String temp = "";
			// 随机产生下标
			Random r = new Random();
			int a = r.nextInt(strs.length);// 0-34
			if (a < 24) {// 0-23是字�?
				int b = r.nextInt(100);
				if (b % 2 == 0) {
					temp = strs[a].toUpperCase();
					s.append(temp);
				} else {
					s.append(strs[a]);
				}
			} else {
				s.append(strs[a]);
			}
		}
		return s.toString();
	}

	/**
	  * 方法的描述：默认返回4位的字符�?
	  * @return  String
	  *
	 */
	public static String getRundomStr() {
		return getRundomStr1(4);
	}
	
	/**
	  * 方法的描述：生成验证码图片（默认的宽和高�?
	  * @param str 验证码字符串
	  * @param out 输出�?
	  * @throws IOException
	  * void
	 */
	public static void getImage(String str,
			OutputStream out) throws IOException {
		getImage1(115, 37, str,out);
	}
	
	/**
	  * 方法的描述：创建图片
	  * @param width 图片�?
	  * @param height 图片�?
	  * @param str 图片上需要画的字符串
	  * @param out 输出�?
	  * @throws IOException
	  * void
	 */
	public static void getImage1(int width, int height, String str,
			OutputStream out) throws IOException {
		BufferedImage imag = new BufferedImage(width, height,
				BufferedImage.TYPE_INT_RGB);
		Graphics2D g = (Graphics2D) imag.getGraphics();
		// 1画背景图�?
		g.setColor(getRundomRGB(120, 255));
		g.fillRect(0, 0, width, height);

		// 2随机产生多条�?
		g.setColor(getRundomRGB(145, 175));
		Random rd = new Random();
		for (int i = 0; i < 100; i++) {
			if (i % 4 == 0)
				g.setColor(getRundomRGB(120, 220));
			int x = rd.nextInt(width);
			int y = rd.nextInt(height);
			int x1 = rd.nextInt(width / 3);
			int y1 = rd.nextInt(height / 3);
			g.drawLine(x, y, x + x1, y + y1);
		}

		// 3画字符串
		char[] c = str.toCharArray();
		g.setFont(new Font("Serif", Font.BOLD, 24));
		for (int i = 0; i < c.length; i++) {
			g.setColor(getRundomRGB(0, 90));
			if (rd.nextInt(1000) % 2 == 0) {
				//旋转
				g.rotate(.8, width / 10  + (width / 4) * i, height
						+ height / 2 + height/12);
				g.drawString(String.valueOf(c[i]), width / 4 - width / 5-width/7
						+ (width / 4) * i, height - height / 8);
				g.rotate(-.8, width / 10  + (width / 4) * i, height
						+ height / 2+height/12);
			} else {
				g.drawString(String.valueOf(c[i]), width / 4 - width / 6
						+ (width / 4) * i, height - height / 4);
			}
		}
		//====
		for (int i = 0; i < 20; i++) {
			if (i % 2 == 0)
				g.setColor(getRundomRGB(142, 220));
			int x = rd.nextInt(width);
			int y = rd.nextInt(height);
			int x1 = rd.nextInt(width / 3);
			int y1 = rd.nextInt(height / 3);
			g.drawLine(x, y, x + x1, y + y1);
		}
		
		g.dispose();
		ImageIO.write(imag, "png", out);
	}

	// 颜色随机产生�?
	private static Color getRundomRGB(int pr, int pg) {
		if (pr > 255)
			pr = 255;
		if (pg > 255)
			pg = 255;
		Random rd = new Random();
		int r = pr + rd.nextInt(pg - pr);
		int g = pr + rd.nextInt(pg - pr);
		int b = pr + rd.nextInt(pg - pr);
		return new Color(r, g, b);
	}
	
	public static void main(String[] args) throws IOException {
		FileOutputStream out = new FileOutputStream("E:/img/c.png");
		
		String str = ImageUtil.getRundomStr();
		System.out.println(str);
		ImageUtil.getImage(str, out);
	}

}