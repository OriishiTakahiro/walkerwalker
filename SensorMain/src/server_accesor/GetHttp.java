package server_accesor;

import java.util.ArrayList;
import java.io.IOException;

import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import org.apache.http.client.ClientProtocolException;

import android.net.Uri;
import android.os.AsyncTask;

public class GetHttp extends AsyncTask<String,Void,Response> {

	private String scheme,authority,path; 		//URI(プロトコル,ホスト名,リソース,)
	private ArrayList<String> columns;			//URIのクエリ
	
	//scheme,authority,path,columnsは
	public GetHttp(String scheme,String authority,String path,ArrayList<String> columns) {
		this.scheme = scheme;
		this.authority = authority;
		this.path = path;
		this.columns = columns;
	}
	@Override
	protected void onPreExecute() {}
	@Override
	protected Response doInBackground(String... params){
		Uri.Builder builder = new Uri.Builder();
		builder.scheme(scheme);
		builder.encodedAuthority(authority);
		builder.path(path);
		
		if(columns.size() != 0) {
			for(int i = 0;i < columns.size();i++) {
			builder.appendQueryParameter(columns.get(i),params[i]);
			}
		}
		
		HttpGet method = new HttpGet(builder.build().toString());
		DefaultHttpClient client_get = new DefaultHttpClient();
		String response_message = "";
		
		try {
			response_message = client_get.execute(method,new ResponseHandler<String>() {
			@Override
			public String handleResponse(HttpResponse response) throws ClientProtocolException, IOException {
                return String.valueOf(response.getStatusLine().getStatusCode()) + ":" + EntityUtils.toString(response.getEntity(),"UTF-8");
				}
			});
		}catch(ClientProtocolException e){
			response_message = e.toString();
		}catch(IOException e) {
			response_message = e.toString();
		}catch(RuntimeException e) {
			response_message = e.toString();
		}
		finally {
			client_get.getConnectionManager().shutdown();
		}
		return new Response(!response_message.equals("") ? response_message : "404:{result:failed}");
		}
		@Override
		protected void onPostExecute(Response response){}
}