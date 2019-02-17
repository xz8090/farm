package cn.jxufe.utils;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Locale;

import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonValueProcessor;

public class JsonDateValueProcessor implements JsonValueProcessor {     
    private String format ="yyyy-MM-dd HH:mm:ss";     
    public Object processArrayValue(Object value, JsonConfig config) {     
        return process(value);     
    }         
    public Object processObjectValue(String key, Object value, JsonConfig config) {     
        return process(value);     
    }    
    private Object process(Object value){
        if(value instanceof Date){     
            SimpleDateFormat sdf = new SimpleDateFormat(format,Locale.CHINA);     
            return sdf.format(value);     
        }     
        return value == null ? "" : value.toString();     
    }     
}  