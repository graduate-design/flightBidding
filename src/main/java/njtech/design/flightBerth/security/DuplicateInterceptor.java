package njtech.design.flightBerth.security;

import com.alibaba.fastjson.JSON;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.google.gson.JsonObject;
import njtech.design.flightBerth.utils.JsonUtils;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class DuplicateInterceptor extends HandlerInterceptorAdapter {

    //不能同时打开两个不同的浏览器提交
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if (handler instanceof HandlerMethod) {
            HandlerMethod handlerMethod = (HandlerMethod) handler;
            Method method = handlerMethod.getMethod();
            DuplicateData annotation = method.getAnnotation(DuplicateData.class);
            if (annotation != null) {
                if(repeatDataValidator(request))//如果重复相同数据
                {    System.out.println("重复提交");
                    return false;}
                else{
                    return true;
                }
            }
            return true;
        } else {
            return super.preHandle(request, response, handler);
        }
    }
    /**
     * 验证同一个url数据是否相同提交  ,相同返回true
     * @param httpServletRequest
     * @return
     */
    public boolean repeatDataValidator(HttpServletRequest httpServletRequest)
    {
        String params= JSON.toJSONString(httpServletRequest.getParameterMap());
        System.out.println("提交参数："+params);
        String url=httpServletRequest.getRequestURI();
        Map<String,String> map=new HashMap<String,String>();
        map.put(url, params);
        String nowUrlParams=map.toString();//

        Object preUrlParams=httpServletRequest.getSession().getAttribute("repeatData");
        if(preUrlParams==null)//如果上一个数据为null,表示还没有访问页面
        {
            httpServletRequest.getSession().setAttribute("repeatData", nowUrlParams);
            return false;
        }
        else//否则，已经访问过页面
        {
            if(preUrlParams.toString().equals(nowUrlParams))//如果上次url+数据和本次url+数据相同，则表示城府添加数据
            {

                return true;
            }
            else//如果上次 url+数据 和本次url加数据不同，则不是重复提交
            {
                httpServletRequest.getSession().setAttribute("repeatData", nowUrlParams);
                return false;
            }

        }
    }



    //返回响应体的Map
    public static Map  getParameterMap(HttpServletRequest request){
        Map<String,String[]> map = new HashMap<String,String[]>();
        Map<String,Object> returnMap = new HashMap<String,Object>();

        map = request.getParameterMap();
        Iterator entries = map.entrySet().iterator();
        Map.Entry entry;
        String name ="";
        String value=null;
        while (entries.hasNext()){
            entry=(Map.Entry)entries.next();
            name = (String) entry.getKey();
            Object objvalue = entry.getValue();
            if(objvalue == null){
                value = null;
            }else if(objvalue instanceof String[]){
                /**条件如果成立，objvalue就是一个数组，需要将它转换成为字符串，并拼接上逗号，并吧末尾的逗号去掉*/
                String[] values = (String[]) objvalue;
                for(int i=0;i<values.length;i++){
                    value = values[i]+",";//这里我拼接的是英文的逗号。
                }
                value = value.substring(0,value.length()-1);//截掉最后一个逗号。
            }else{
                value = objvalue.toString();
            }
            returnMap.put(name , value);
        }
        Iterator it = returnMap.keySet().iterator();
        while (it.hasNext()){
            Object key = it.next();
            if(returnMap.get(key) == null || "".equals (((String)returnMap.get(key)).trim())){
                returnMap.put((String) key, null);
            }
        }
        return returnMap;
    }


}
