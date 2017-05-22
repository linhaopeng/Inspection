package net.baojuxinxi.utils;

import java.awt.Graphics;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

/**
 * 图片压缩工具
 * @author xin-bing
 *
 */
public class ScaleImageUtils {
	
	private int width;
	private int height;
	private int originalWidth;//原宽
	private int originalHeight;//原高
	private boolean isScaled = false;//是否压缩成功
//	private ScalePolicy scalePolicy;
//	public static enum ScalePolicy{
//		/**
//		 * 按图片的大小进行判定压缩比率判定
//		 */
//		SIZE,
//		/**
//		 * 按图片的宽*高进行压缩比率判定
//		 */
//		WIDTH_HEIGHT;
//	}
	private ScaleImageUtils(){		
	}
	
	public static ScaleImageUtils getInstance(){
		ScaleImageUtils scale = new ScaleImageUtils();
		return scale;
	}
	
	/**
	 * 本方法会判断原图的宽高
	 * 如果原图的宽>高，那么压缩策略是将原图的width压缩至maxWidth_height，并将原图的height进行等比例压缩
	 * 如果原图的高>宽，那么压缩策略是将原图的height压缩至maxWidth_height,并将原图的width进行等比例压缩
	 * 如果原图的宽、高都小于maxWidth_height，那么就不压缩保存到目标文件
	 * @param sourceFile
	 * @param targetSource
	 * @param maxWidth_height
	 */
	public void scale(String sourceFile,String targetSource,int maxWidth_height){
		BufferedImage sourceImage;
		try {
			File file = new File(sourceFile);
			System.out.println(file.length());
			sourceImage = ImageIO.read(file);
			this.originalWidth = sourceImage.getWidth();
			this.originalHeight = sourceImage.getHeight();
			if(this.originalWidth <= maxWidth_height && this.originalHeight <= maxWidth_height){
				this.width = this.originalWidth;
				this.height = this.originalHeight;
			} else {
				if(this.originalWidth>=this.originalHeight){
					this.width = maxWidth_height;
					Double temp = 1.0*this.originalHeight*maxWidth_height/originalWidth;
					this.height = temp.intValue();
				}else {
					this.height = maxWidth_height;
					Double temp = 1.0*this.originalWidth*maxWidth_height/this.originalHeight;
					this.width = temp.intValue();
				}
			}
			Image image = sourceImage.getScaledInstance(this.width,this.height,Image.SCALE_FAST);
			BufferedImage toImage = new BufferedImage(this.width,this.height,BufferedImage.TYPE_INT_RGB);
			
			Graphics g = toImage.getGraphics();
		    g.drawImage(image, 0, 0, null); // 绘制缩小后的图
		    g.dispose();
		    File toFile = new File(targetSource);
		    if(!toFile.getParentFile().exists()){
		    	System.out.println("父路径不存在！ScaleUtils准备创建路径："+targetSource);
		    	if(!toFile.getParentFile().mkdirs()){
		    		System.out.println("ScaleUtils创建父路径失败!");
		    	}
		    }
			ImageIO.write(toImage, "jpg", new File(targetSource));
			this.isScaled = true;
		} catch (IOException e1) {
			this.isScaled = false;
			this.width = this.originalWidth;
			this.height = this.originalHeight;
			e1.printStackTrace();
		}
	}
	
	/**
	 * 默认的压缩方法，按照图片的宽*高的大小进行压缩，暂时没有去处理宽高相差较大的那种图片的情况
	 * @param sourceFile
	 * @param targetSource
	 */
	public void scale(String sourceFile,String targetSource){
		BufferedImage sourceImage;
		try {
			File file = new File(sourceFile);
			System.out.println(file.length());
			sourceImage = ImageIO.read(file);
			this.originalWidth = sourceImage.getWidth();
			this.originalHeight = sourceImage.getHeight();
			decideScale();
			
			Image image = sourceImage.getScaledInstance(this.width,this.height,Image.SCALE_FAST);
			BufferedImage toImage = new BufferedImage(this.width,this.height,BufferedImage.TYPE_INT_RGB);
			
			Graphics g = toImage.getGraphics();
		    g.drawImage(image, 0, 0, null); // 绘制缩小后的图
		    g.dispose();
		    File toFile = new File(targetSource);
		    if(!toFile.getParentFile().exists()){
		    	System.out.println("父路径不存在！ScaleUtils准备创建路径："+targetSource);
		    	if(!toFile.getParentFile().mkdirs()){
		    		System.out.println("ScaleUtils创建父路径失败!");
		    	}
		    }
			ImageIO.write(toImage, "jpg", new File(targetSource));
			this.isScaled = true;
		} catch (IOException e1) {
			this.isScaled = false;
			this.width = this.originalWidth;
			this.height = this.originalHeight;
			e1.printStackTrace();
		}
	}

	
	private void decideScale(){
		int product = this.originalWidth*this.originalHeight;
		double scale = 1;//最简单的判断下，已经经过一道压缩的图片如果不改变图片大小的话，那么起不到压缩的作用
		if(product < 3000){
			scale = 1;
		}else if(product<100000){
			scale = 0.8;
		} else if(product<250000){
			scale = 0.7;
		} else if(product<640000){
			scale = 0.6;
		} else if(product<1000000){
			scale = 0.5;
		} else if(product<1690000){
			scale = 0.3;
		} else if(product<2250000){
			scale = 0.2;
		} else{
			scale = 0.1;
		}
		this.width = new Double(originalWidth*scale).intValue();
		this.height = new Double(originalHeight*scale).intValue();
	}
	

	public int getWidth() {
		return width;
	}

	public int getHeight() {
		return height;
	}

	public boolean isScaled() {
		return isScaled;
	}
	
	public int getOriginalWidth() {
		return originalWidth;
	}

	public int getOriginalHeight() {
		return originalHeight;
	}

	public static void main(String[] args) throws Exception{
		long begin = System.currentTimeMillis();
		ScaleImageUtils scale = ScaleImageUtils.getInstance();
		scale.scale("D://fuck.jpg","D://"+"fuck1.jpg");
		System.out.println(System.currentTimeMillis()-begin);
	}
}
