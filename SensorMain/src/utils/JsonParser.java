package utils;

import java.util.HashMap;
import java.util.ArrayList;


public class JsonParser {
	//keyとvalueのセット(オブジェクト)が一つの場合のみ利用
	public static HashMap<String,String> parseJson(String json_message) {
		HashMap<String,String> result = new HashMap<String,String>();
		String[] params_set = json_message.replace("{","").replace("}","").split(",");
		for(String set : params_set) {
			String[] split = set.replace(new Character('"').toString(),"").split(":");
			if(split.length == 2) result.put(split[0],split[1]);
		}
		return result;
	}
	//オブジェクトが複数存在する配列構造になっているときに使用
	public static ArrayList<HashMap<String,String>> parseJsonList(String json_message) {
		ArrayList<HashMap<String,String>> result = new ArrayList<HashMap<String,String>>();
		json_message = json_message.replace("[","").replace("]","");
		String[] set_list = json_message.split(",");
		for(String set : set_list) {
			result.add(parseJson(set.replace("{","").replace("}","")));
		}
		return result;
	}
}
