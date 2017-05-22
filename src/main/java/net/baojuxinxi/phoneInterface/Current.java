package net.baojuxinxi.phoneInterface;

import java.net.URLDecoder;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import net.baojuxinxi.utils.ErrorCodeUtill;
import net.baojuxinxi.utils.JsonUtils;

public class Current {
	public static final String CREATETIME = "createTime";
	public static final String CREATEBY = "createBy";
	public static final String UPDATETIME = "updateTime";
	public static final String UPDATEBY = "updateBy";
	private static final String TOKEN="bao";
	public static final SimpleDateFormat df = new SimpleDateFormat(
			"yyyy-MM-dd HH:mm:ss");

	public static boolean key(Object method, Object version, Object timestemp,
			Object sign) {
		if (md5(method.toString() + version + timestemp+TOKEN).equals(sign)) {
			return true;
		} else {
			return false;
		}
	}

	public static void main(String[] args) {
		// System.out.println(md5("test"+"1"+"1"+ConfigUtil.getValue("key")));
		System.out.println(md5("123456"));

		try {
			System.out
					.println(URLDecoder
							.decode("{\"method\":\"1\",\"version\":\"1\",\"timestemp\":\"abc\",\"sign\":\"df1bd0d1e93a0a73a4a032fab7fd8c38\",\"request\":\"[{'userName':'ietdh@163.com','password':'e10adc3949ba59abbe56e057f20f883e'}]\"}",
									"UTF-8"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static String time() {
		return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
	}

	public static Map<String, Object> getMap() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", "200");
		map.put("message", ErrorCodeUtill.map.get("200"));
		map.put("timestemp", Current.time());
		return map;
	}

	@SuppressWarnings("unchecked")
	public static Map<String, Object> getMapParams(Map<String, String[]> params) {
		Map<String, Object> map = new HashMap<String, Object>();
		for (String key : params.keySet()) {
			try {
				System.err.println(key);
				key = URLDecoder.decode(key, "UTF-8");
				System.err.println(key);
				map = JsonUtils.fromJson(key, Map.class);
				System.err.println(map.get("sign"));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return map;
	}

	/*
	 * public static <T extends AbstractUser> AbstractUser user() { AbstractUser
	 * system = new AbstractUser(); system.setUserName("System"); try {
	 * AbstractUser user = (AbstractUser) SecurityUtils.getSubject()
	 * .getPrincipal(); return user == null ? system : user; } catch
	 * (UnavailableSecurityManagerException e) { // log().debug("", e); } return
	 * system; }
	 */

	public static String md5(String plain) {
		String re_md5 = new String();
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(plain.getBytes());
			byte[] b = md.digest();

			StringBuffer buf = new StringBuffer("");
			for (int offset = 0; offset < b.length; offset++) {
				int i = b[offset];
				if (i < 0)
					i += 256;
				if (i < 16)
					buf.append("0");
				buf.append(Integer.toHexString(i));
			}
			re_md5 = buf.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return re_md5;
	}

	/*
	 * public static Map<String, Object> objectToFieldValueMapByAnno( Object
	 * object, Class<?> annoClass) { HashMap fieldValue = new HashMap(); for
	 * (Field field : object.getClass().getDeclaredFields()) { for (Annotation
	 * anno : field.getAnnotations()) { if
	 * (!anno.annotationType().equals(annoClass)) continue; try {
	 * field.setAccessible(true); fieldValue.put(field.getName(),
	 * field.get(object)); return fieldValue; } catch (IllegalArgumentException
	 * e) { throw new RuntimeException(e); } catch (IllegalAccessException e) {
	 * throw new RuntimeException(e); } } }
	 * 
	 * throw new RuntimeException(Error.FIELD_NOT_FOUND(object, annoClass)); }
	 */

	// public static Logger log() {
	// try {
	// return
	// LoggerFactory.getLogger(Class.forName(java.lang.Thread.currentThread().getStackTrace()[2].getClassName()));
	// } catch (ClassNotFoundException e) {
	// }
	// throw new RuntimeException(e);
	// }
}