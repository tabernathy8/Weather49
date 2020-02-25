/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.weather49;
import java.util.*;
import java.io.IOException;
import java.net.*;
import com.github.prominence.openweathermap.api.*;
import com.github.prominence.openweathermap.api.model.*;
import com.github.prominence.openweathermap.api.utils.*;
import com.github.prominence.openweathermap.api.constants.*;
import com.github.prominence.openweathermap.api.exception.*;
import com.github.prominence.openweathermap.api.model.response.*;
import com.github.prominence.openweathermap.api.exception.*;
import net.aksingh.owmjapis.core.*;
import net.aksingh.owmjapis.api.*;
import net.aksingh.owmjapis.model.*;
import net.aksingh.owmjapis.util.*;
import net.aksingh.owmjapis.demo.*;
import net.aksingh.owmjapis.core.OWM;


/**
 *
 * @author Evan
 */
public class WeatherBean {
    OWM owm = new OWM("566c5f6f796270ca04bd8c5031da5847");
    OWMPro owmp = new OWMPro("566c5f6f796270ca04bd8c5031da5847");
    CurrentWeather cwd;
    OpenWeatherMapManager openWeatherManager = new OpenWeatherMapManager("566c5f6f796270ca04bd8c5031da5847");
    WeatherRequester weatherRequester = openWeatherManager.getWeatherRequester();
    HourlyForecastRequester forecastRequester = openWeatherManager.getForecastRequester();
    Weather weatherResponse;
    HourlyForecast forecastResponse;
    String location;
    double high;
    double low;
    double current;
    String country;
    double locationLat;
    double locationLng;
    String ex = "";
    /*List<WeatherData> hwdl;
    List<ForecastData> dwdl;
    CurrentWeather cwd;*/
    
    
    public WeatherBean(){
    }
    public String getCity(){
        return location;
        
    }
    public void setCity(String city){
        location = city;
    }
    public double getHigh(){
        
        try{
            high = weatherResponse.getWeatherInfo().getMaximumTemperature();
            return high;
        } catch(Exception e)
        {
            e.getMessage();
        }
        return -512;
        
    }
    public double getCurrentTemp(){
        current = weatherResponse.getWeatherInfo().getTemperature();
        return current;
    }
    public Weather getCurrentWeather()
    {
        return weatherResponse;
    }
    public void setCurrentWeather(double lat, double lng)
    {
        try{
             weatherResponse = weatherRequester
                .setLanguage(Language.ENGLISH)
                .setUnitSystem(Unit.IMPERIAL_SYSTEM)
                .setAccuracy(Accuracy.ACCURATE)
                .getByCoordinates(lat,lng);
        }
        catch(Exception e){
            e.toString();
        }
    }
    
    public double getLatitude()
    {
        double temp = weatherResponse.getCoordinates().getLatitude();
        return temp; 
        
    }
    public double getLongitude()
    {
        return weatherResponse.getCoordinates().getLongitude();
    }
    public Date getSunRiseTime()
    {
       return weatherResponse.getWeatherSystemInfo().getSunriseDate();
    }
    public Date getSunSetTime()
    {
       return weatherResponse.getWeatherSystemInfo().getSunsetDate();
    }
    public double getLow(){
        low = weatherResponse.getWeatherInfo().getMinimumTemperature();
        return low;
    }
    public String getZipCity(){
        return weatherResponse.getCityName();
    }
    public Snow getSnow(){
        return weatherResponse.getSnow();
    }
    public Rain getRain(){
        return weatherResponse.getRain();
    }
    public Wind getWind()
    {
        return weatherResponse.getWind();
    }
    public void setLatitude(double lat)
    {
        locationLat = lat;
    }
    public void setLongitude(double lng)
    {
        locationLng = lng;
    }
    public void setHourlyForecast(double lat, double lng){
        try{
             forecastResponse = forecastRequester
                .setLanguage(Language.ENGLISH)
                .setUnitSystem(Unit.IMPERIAL_SYSTEM)
                .setAccuracy(Accuracy.ACCURATE)
                .getByCoordinates(lat, lng);
        }
        
        catch(InvalidAuthTokenException e){
            ex = e.toString();
        }
        catch(DataNotFoundException e){
            ex = e.toString();
        }
    }
    public List<HourlyForecast.Forecast> getHourlyForecast(){

        if(!(ex.equals("")))
        {
            return null;
        }
        else
        {
            return forecastResponse.getForecasts();
        }
        

    }
}

