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
 * AlertBean class responsible for accepting location data and checking for 
 * alerts at that location;  If there are alerts, the class will also allow
 * pulling data about said alerts.
 * 
 * @author Evan Branton
 * @version 02-25-2020
 */
public class AlertsBean {
    
    //Initialize Fields
    ForecastIO forecast = new ForecastIO("9fdadc0a0ffefc5044ddd04a3dc41c81");
    FIOAlerts alert;
    String alertTitle;
    String alertTime;
    String alertExpire;
    String alertDescription;
    
    /**
     * Method for setting the location for alert check.
     * @param lat Double for latitude 
     * @param lng Double for Longitude
     */
    public void setForecast(double lat, double lng)
    {
        //Convert doubles to Double objects
        Double latD = lat;
        Double lngD = lng;
        
        //Load Strings with Double toString methods
        String latS = latD.toString();
        String lngS = lngD.toString();
        
        //pull the forcast using the lat long strings
        forecast.getForecast(latS,lngS);
    }
    
    /**
     * Method for setting the alert using the previous location data
     */
    public void setAlert()
    {
        //Set alert equal to Alert data pulled using location data
        alert = new FIOAlerts(forecast);
    }
    
    /**
     * Method for getting Alert data
     * @return FIOAlerts object with alert data
     */
    public FIOAlerts getAlert()
    { 
        return alert;
    }
    
    /**
     * Method for getting Alert name
     * @param i Alert ID
     * @return Alert title
     */
    public String getAlertName(int i)
    {
        return alert.getAlertTitle(i);
    }
    
    /**
     * Method for getting Alert time
     * @param i Alert ID
     * @return Alert time
     */
    public String getAlertTime(int i)
    {
        return alert.getAlertTime(i);
    }
    
    /**
     * Method for getting Alert expiration time
     * @param i Alert ID
     * @return Alert expiration time
     */
    public String getAlertExpire(int i)
    {
        return alert.getAlertExpireTime(i);
    }
    
    /**
     * Method for getting Alert description
     * @param i Alert ID
     * @return Alert description
     */
    public String getAlertDescription(int i)
    {
        return alert.getAlertDescription(i);
    }
}
