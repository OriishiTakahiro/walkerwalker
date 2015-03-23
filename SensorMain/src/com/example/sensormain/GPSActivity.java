package com.example.sensormain;

import wrapper.WrapAccesor;
import entity.UserData;

import java.util.ArrayList;

import android.app.Activity;
import android.content.Context;
import android.location.Criteria;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.LinearLayout;
import android.widget.TextView;

public class GPSActivity extends Activity implements LocationListener,OnClickListener {
	
	private ArrayList<TextView> questlist = null;
	private boolean is_initialize = true;
	
	private double latitude,longitude;
    /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_gps);
        
        setQuestList();
                
        // LocationManagerを取得
        LocationManager mLocationManager =
        (LocationManager) getSystemService(Context.LOCATION_SERVICE);

        // Criteriaオブジェクトを生成
        Criteria criteria = new Criteria();

        // Accuracyを指定(低精度)
        criteria.setAccuracy(Criteria.ACCURACY_COARSE);

        // PowerRequirementを指定(低消費電力)
        criteria.setPowerRequirement(Criteria.POWER_LOW);

        // ロケーションプロバイダの取得
        String provider = mLocationManager.getBestProvider(criteria, true);

        // 取得したロケーションプロバイダを表示
        //TextView tv_provider = (TextView) findViewById(R.id.Provider);
        //tv_provider.setText("Provider: "+provider);

        // LocationListenerを登録
        mLocationManager.requestLocationUpdates(provider, 0, 0, this);

        findViewById(R.id.send).setOnClickListener(this);
    }
    @Override
    public void onLocationChanged(Location location) {
    	
    	latitude = location.getLatitude();
    	longitude = location.getLongitude();
    	    	
        // 緯度の表示
        TextView tv_lat = (TextView) findViewById(R.id.Latitude);
        tv_lat.setText("Latitude:"+location.getLatitude());

        // 経度の表示
        TextView tv_lng = (TextView) findViewById(R.id.Longitude);
        tv_lng.setText("Longitude:"+location.getLongitude());
        
        if(is_initialize) {
        	is_initialize = false;
        	ArrayList<String>  columns = new ArrayList<String>();
        	columns.add("userhash");
        	WrapAccesor.GetGpsquestList listgetter = new WrapAccesor.GetGpsquestList(columns,questlist);
        	listgetter.execute(UserData.USERHASH);
        }

    }

    @Override
    public void onProviderDisabled(String provider) {
        // TODO Auto-generated method stub

    }

    @Override
    public void onProviderEnabled(String provider) {
        // TODO Auto-generated method stub

    }

    @Override
    public void onStatusChanged(String provider, int status, Bundle extras) {
        // TODO Auto-generated method stub

    }
    @Override
    public void onClick(View v) {
    	switch(v.getId()) {
            case R.id.send:
                ArrayList<String> columns = new ArrayList<String>();
                columns.add("id");
                columns.add("userhash");
                columns.add("latitude");
                columns.add("longitude");
                    
                int quest_id = 1; 
                    
                WrapAccesor.PostLocation post_location = new WrapAccesor.PostLocation(columns,(TextView)findViewById(R.id.disp_result));
                post_location.execute(String.valueOf(quest_id),UserData.USERHASH,String.valueOf(latitude),String.valueOf(longitude));

            	break;
    	}
    }
    private void setQuestList() {
    	questlist = new ArrayList<TextView>();
        questlist.add((TextView)findViewById(R.id.raw1));
        questlist.add((TextView)findViewById(R.id.raw2));
        questlist.add((TextView)findViewById(R.id.raw3));
        questlist.add((TextView)findViewById(R.id.raw4));
        questlist.add((TextView)findViewById(R.id.raw5));
    }
    
}
