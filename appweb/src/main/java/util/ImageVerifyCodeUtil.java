package util;

import java.awt.Color;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;

import com.github.bingoohuang.patchca.color.ColorFactory;
import com.github.bingoohuang.patchca.custom.ConfigurableCaptchaService;
import com.github.bingoohuang.patchca.filter.predefined.DoubleRippleFilterFactory;
import com.github.bingoohuang.patchca.filter.predefined.WobbleRippleFilterFactory;
import com.github.bingoohuang.patchca.utils.encoder.EncoderHelper;
import com.github.bingoohuang.patchca.word.RandomWordFactory;

public class ImageVerifyCodeUtil {
  private static ConfigurableCaptchaService cs = null;
  private static RandomWordFactory wf = null;
  private static Random r = new Random();
  private static DoubleRippleFilterFactory drff = null;
  private static WobbleRippleFilterFactory wrff = null;
  private static Random random = new Random();
  static {
    cs = new ConfigurableCaptchaService();
    // cf = new SingleColorFactory(new Color(25, 60, 170));
    wf = new RandomWordFactory();
    // crff = new CurvesRippleFilterFactory(cs.getColorFactory());
    drff = new DoubleRippleFilterFactory();
    wrff = new WobbleRippleFilterFactory();
    // dirff = new DiffuseRippleFilterFactory();
    // mrff = new MarbleRippleFilterFactory();
    cs.setWordFactory(wf);
    cs.setWidth(120);
    cs.setHeight(50);

    // cs.setColorFactory(new SingleColorFactory(new Color(25, 60, 170)));
    cs.setColorFactory(new ColorFactory() {
      @Override
      public Color getColor(int x) {
        int[] c = new int[3];
        int i = random.nextInt(c.length);
        for (int fi = 0; fi < c.length; fi++) {
          if (fi == i) {
            c[fi] = random.nextInt(71);
          } else {
            c[fi] = random.nextInt(256);
          }
        }
        return new Color(c[0], c[1], c[2]);
      }
    });
    RandomWordFactory wf = new RandomWordFactory();
    wf.setCharacters("23456789abcdefghigkmnpqrstuvwxyzABCDEFGHIGKLMNPQRSTUVWXYZ");
    wf.setMaxLength(4);
    wf.setMinLength(4);
    cs.setWordFactory(wf);
  }

  public static String sendVerifyCode(HttpServletResponse response) throws IOException {
    response.setContentType("image/png");
    setResponseHeaders(response);
    OutputStream os = response.getOutputStream();
    switch (r.nextInt(2)) {
      case 0:
        cs.setFilterFactory(drff);
        break;
      case 1:
        cs.setFilterFactory(wrff);
        break;
    }
    String captcha = EncoderHelper.getChallangeAndWriteImage(cs, "png", os);
    return captcha;
  }

  protected static void setResponseHeaders(HttpServletResponse response) {
    response.setContentType("image/png");
    response.setHeader("Cache-Control", "no-cache, no-store");
    response.setHeader("Pragma", "no-cache");
    long time = System.currentTimeMillis();
    response.setDateHeader("Last-Modified", time);
    response.setDateHeader("Date", time);
    response.setDateHeader("Expires", time);
  }

}
