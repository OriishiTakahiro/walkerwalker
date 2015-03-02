package wrapper;

import java.util.ArrayList;
import java.util.HashMap;

import android.app.Activity;
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
			super(scheme,authority,"api/post/post_step",columns);
			activity = receiver;
		}
		@Override
		protected void onPostExecute(Response response){
			HashMap<String,String> result_hash = JsonParser.parseJson(response.getMessage());
			Toast.makeText(activity, result_hash.get("result") + ":" + result_hash.get("message"), Toast.LENGTH_LONG).show();
			
		}
	}
	
	public static class PostLocation extends PostHttp {
		private TextView result_view;
		public PostLocation(ArrayList<String> columns,TextView component) {
			super(scheme,authority,"api/post/post_location",columns);
			result_view = component;
		}
		@Override
		protected void onPostExecute(Response response){
			HashMap<String,String> result_hash = JsonParser.parseJson(response.getMessage());
 			result_view.setText(result_hash.get("result") + result_hash.get("message"));
		}
	}
	
	public static class PostQRcode extends PostHttp {
		private Activity activity;
		public PostQRcode(ArrayList<String> columns,Activity receiver) {
			super(scheme,authority,"api/post/post_qrcode",columns);
			activity = receiver;
		}
		@Override
		protected void onPostExecute(Response response) {
			HashMap<String,String> result_hash = JsonParser.parseJson(response.getMessage());
			Toast.makeText(activity,result_hash.get("result"),Toast.LENGTH_LONG).show();
		}
	}
}
