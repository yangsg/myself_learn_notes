package util;

import java.util.HashMap;
import java.util.Map;

public class Validator {
  private Map<String, String> errMsges = new HashMap<String, String>();
  private String value;
  private String errMsgKey;

  public Validator() {}

  public Map<String, String> getErrMsges() {
    return errMsges;
  }

  public boolean checking(String value, String errMsgKey) {
    this.value = value;
    this.errMsgKey = errMsgKey;
    return true;
  }

  public boolean isNotNull() {
    if (value != null) {
      return true;
    }
    errMsges.put(errMsgKey, "is null");
    return false;
  }

  public boolean isNull() {
    if (value == null) {
      return true;
    }
    errMsges.put(errMsgKey, "is not null");
    return false;
  }

  public boolean isNotEmpty() {
    if (!"".equals(value)) {
      return true;
    }
    errMsges.put(errMsgKey, "is empty");
    return false;
  }

  public boolean isEmpty() {
    if ("".equals(value)) {
      return true;
    }
    errMsges.put(errMsgKey, "is not empty");
    return false;
  }

  public boolean isNotWhiteSpace() {
    if (!"".equals(value.trim())) {
      return true;
    }
    errMsges.put(errMsgKey, "is whitespace");
    return false;
  }

  public boolean isWhiteSpace() {
    if ("".equals(value.trim())) {
      return true;
    }
    errMsges.put(errMsgKey, "is not whitespace");
    return false;
  }

  public boolean isInt() {
    try {
      Integer.parseInt(value);
      return true;
    } catch (NumberFormatException e) {
      errMsges.put(errMsgKey, "is not int");
      return false;
    }
  }


  public boolean isLong() {
    try {
      Long.parseLong(value);
      return true;
    } catch (NumberFormatException e) {
      errMsges.put(errMsgKey, "is not long");
      return false;
    }
  }

  public boolean isDouble() {
    try {
      Double.parseDouble(value);
      return true;
    } catch (NumberFormatException e) {
      errMsges.put(errMsgKey, "is not double");
      return false;
    }
  }

  public boolean isChar() {
    if (value.length() == 1) {
      return true;
    }
    errMsges.put(errMsgKey, "is not char");
    return false;
  }

  public static void main(String[] args) {
    Validator vd = new Validator();
    String id = "";
    String name = "";
    {
      boolean isOk = true;
      isOk =
          vd.checking(id, "id_err_msg") && vd.isNotNull() && vd.isNotEmpty()
              && vd.isNotWhiteSpace() && vd.isInt() && isOk;
      isOk =
          vd.checking(name, "name_err_msg") && vd.isNotNull() && vd.isNotEmpty()
              && vd.isNotWhiteSpace() && vd.isInt() && isOk;
      if (isOk == false || vd.getErrMsges().size() != 0) {
        System.out.println(vd.getErrMsges());
      }
    }
  }
}
