package njtech.design.flightBerth.utils;

import java.util.List;

public class JsonUtils {
    public static String toJson(List<String> str)
    {
        StringBuilder json = new StringBuilder();
        if (str == null)
        {
            return "null";
        }
        json.append("[");
        for (String item : str)
        {
            json.append("{\"airCompanyName\":\"");
            json.append(item);
            json.append("\"},");
        }

        return json.toString().substring(0, json.toString().lastIndexOf(",")) + "]";
    }
}
