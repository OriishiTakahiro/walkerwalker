package wrapper;

import java.util.ArrayList;
import java.util.HashMap;

import android.app.Activity;
import android.util.Log;
import android.widget.TextView;
import android.widget.Toast;
import server_accesor.PostHttp;
import server_accesor.GetHttp;
import server_accesor.Response;
import utils.JsonParser;

public class WrapAccesor {
	
	private static String scheme = "http",authority = "219.94.232.92:3000";
	
	public static class PostStep extends PostHttp {
		private Activity activity;
		public PostStep(ArrayList<String> columns,Activity receiver) {
			super(scheme,authority,"/walker/sensor/steps/post_step",columns);
			activity = receiver;
		}
		@Override
		protected void onPostExecute(Response response){
			HashMap<String,String> result_hash = JsonParser.parseJson(response.getMessage());
			Toast.makeText(activity, result_hash.get("result"), Toast.LENGTH_LONG).show();
		}
	}
	
	public static class PostLocation extends PostHttp {
		private TextView result_view;
		public PostLocation(ArrayList<String> columns,TextView component) {
			super(scheme,authority,"/walker/sensor/gpsquests/post_location",columns);
			result_view = component;
		}
		@Override
		protected void onPostExecute(Response response){
			HashMap<String,String> result_hash = JsonParser.parseJson(response.getMessage());
 			result_view.setText(result_hash.get("result"));
		}
	}
	
	public static class PostQRcode extends PostHttp {
		private Activity activity;
		public PostQRcode(ArrayList<String> columns,Activity receiver) {
			super(scheme,authority,"/walker/sensor/qrcodes/post_qrcode",columns);
			activity = receiver;
		}
		@Override
		protected void onPostExecute(Response response) {
			HashMap<String,String> result_hash = JsonParser.parseJson(response.getMessage());
			Toast.makeText(activity,result_hash.get("result"),Toast.LENGTH_LONG).show();
		}
	}
	public static class GetGpsquestList extends GetHttp {
		private ArrayList<TextView> view_list;
		public GetGpsquestList(ArrayList<String> columns,ArrayList<TextView> view_list) {
			super(scheme,authority,"/walker/sensor/gpsquests/get_questlist",columns);
			this.view_list = view_list;
		}
		@Override
		protected void onPostExecute(Response response) {
			Log.d("test",response.getMessage());
            HashMap<String,String> result_hash = JsonParser.parseJson(response.getMessage());
            Log.d("test",result_hash.toString());
			if(result_hash.get("result").equals("succeed")) {
				result_hash.remove("result");
				int i = 0;
				for(String key : result_hash.keySet()) {
					view_list.get(i).setText((i+1) + ":" + key + "\n - " + result_hash.get(key));
					i++;
				}
			}
		}
	}
}
