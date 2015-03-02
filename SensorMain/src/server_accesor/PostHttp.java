package server_accesor;

import java.io.IOException;
import java.util.ArrayList;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.NameValuePair;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import android.net.Uri;
import android.os.AsyncTask;
import android.util.Log;

public class PostHttp extends AsyncTask<String,Void,Response> {

	private String scheme,authority,path;
	private ArrayList<String> columns;

	public PostHttp(String scheme,String authority,String path,ArrayList<String> columns){
		this.scheme = scheme;
		this.authority = authority;
		this.path = path;
		this.columns = columns;
	}

	//doInBackground()の前に行う処理
	@Override
	protected void onPreExecute(){}
	//別スレッド処理
	@Override
	protected Response doInBackground(String... params) {
		//post先URIを作成
		Uri.Builder builder = new Uri.Builder();
		builder.scheme(scheme);
		builder.encodedAuthority(authority);
		builder.path(path);
		
		DefaultHttpClient client = new DefaultHttpClient();
		//HttpPostにpost先URIを指定する
		HttpPost method = new HttpPost(builder.build().toString());
		ArrayList<NameValuePair> param_set = new ArrayList<NameValuePair>();
		
		//各パラメータを設定する
		for(int i = 0;i < columns.size();i++){
			param_set.add(new BasicNameValuePair(columns.get(i),params[i]));
		}
		
		String response_message = "";
		
		try{
			//リクエストパラメータとそのエンコード方式を設定
			method.setEntity(new UrlEncodedFormEntity(param_set,"utf-8"));
			//通信の実行後、レスポンスを文字列として入手
			response_message = client.execute(method,new ResponseHandler<String>() {
				//handleResponseにはIOExceptionの例外処理が必要となる(レスポンスをInputTreamで入手するため)
				@Override
				public String handleResponse(HttpResponse response) throws IOException {
					return String.valueOf(response.getStatusLine().getStatusCode()) + ":" + EntityUtils.toString(response.getEntity(),"UTF-8");
				}
			});
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			//クライアントを落とす(これをしないとメモリリークになるかも)
			client.getConnectionManager().shutdown();
		}
		return new Response(!response_message.equals("") ? response_message : "404:{result:failed}");
	}
	//継承後オーバーライドして利用する(doInBackground()の後に実行)
	@Override
	protected void onPostExecute(Response response){}
}