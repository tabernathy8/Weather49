/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.weather49;
import com.github.dvdme.ForecastIOLib.*;
import com.github.einstein29.csv.*;
import java.util.ArrayList;

/**
 *
 * @author Evan
 */
public class AlertsBean {
    ForecastIO forecast = new ForecastIO("9fdadc0a0ffefc5044ddd04a3dc41c81");
    FIOAlerts alert;
    String alertTitle;
    String alertTime;
    String alertExpire;
    String alertDescription;
    
    public void setForecast(double lat, double lng)
    {
        Double d = lat;
        d.toString();
        String latS = d.toString();
        d = lng;
        String lngS = d.toString();
        forecast.getForecast(latS,lngS);
    }
    public void setAlert()
    {
        alert = new FIOAlerts(forecast);
    }
    public FIOAlerts getAlert()
    { 
        return alert;
        
    }
    public String getAlertName(int i)
    {
        return alert.getAlertTitle(i);
    }
    public String getAlertTime(int i)
    {
        return alert.getAlertTime(i);
    }
    public String getAlertExpire(int i)
    {
        return alert.getAlertExpireTime(i);
    }
    public String getAlertDescription(int i)
    {
        return alert.getAlertDescription(i);
    }
}
