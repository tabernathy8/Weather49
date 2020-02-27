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
 * WeatherBean class responsible for pulling data from OpenWeatherMap
 * API and distributing to other classes and pages.
 * 
 * @author Evan Branton and Tanner Abernathy
 * @version 02-25-2020
 */
public class WeatherBean {
    
    //Initialize key field
    private KeyBean keys = new KeyBean("keys.json");
    private String key = keys.getOWMKey();
    
    //Initializing fields
    private OWM owm = new OWM(key);
    private OWMPro owmp = new OWMPro(key);
    private CurrentWeather cwd;
    private OpenWeatherMapManager openWeatherManager = new OpenWeatherMapManager(key);
    private WeatherRequester weatherRequester = openWeatherManager.getWeatherRequester();
    private HourlyForecastRequester forecastRequester = openWeatherManager.getForecastRequester();
    private Weather weatherResponse;
    private HourlyForecast forecastResponse;
    private String location;
    private double high;
    private double low;
    private double current;
    private String country;
    private double locationLat;
    private double locationLng;
    String ex = "";
    
    /**
     * Default constructor
     */
    public WeatherBean()
    {
    }
    
    /**
     * Method for returning city string
     * @return city name
     */
    public String getCity()
    {
        return location;
    }
    
    /**
     * Method for setting city string
     * @param city name of city
     */
    public void setCity(String city)
    {
        location = city;
    }
    
    /**
     * Method for getting high for chosen city
     * @return high temperature
     */
    public double getHigh()
    {
        try{
            high = weatherResponse.getWeatherInfo().getMaximumTemperature();
            return high;
        } catch(Exception e)
        {
            e.getMessage();
        }
        return -512;
    }
    
    /**
     * Method for getting current temperature for chosen city
     * @return current temperature of chosen city
     */
    public double getCurrentTemp()
    {
        current = weatherResponse.getWeatherInfo().getTemperature();
        return current;
    }
    
    /**
     * Method for getting current weather for chosen city
     * @return current weather for chosen city
     */
    public Weather getCurrentWeather()
    {
        return weatherResponse;
    }
    
    /**
     * method for setting current weather information with coordinates
     * @param lat latitude for location
     * @param lng longitude for location
     */
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
    
    /**
     * Method for getting latitude of chosen location
     * @return latitude of chosen location
     */
    public double getLatitude()
    {
        double temp = weatherResponse.getCoordinates().getLatitude();
        return temp; 
        
    }
    
    /**
     * Method for getting longitude of chosen location
     * @return longitude of chosen location
     */
    public double getLongitude()
    {
        return weatherResponse.getCoordinates().getLongitude();
    }
    
    /**
     * Method for getting sunrise time for chosen location
     * @return sunrise time for chosen location
     */
    public Date getSunRiseTime()
    {
       return weatherResponse.getWeatherSystemInfo().getSunriseDate();
    }
    
    /**
     * Method for getting sunset time for chosen location
     * @return sunset time for chosen location
     */
    public Date getSunSetTime()
    {
       return weatherResponse.getWeatherSystemInfo().getSunsetDate();
    }
    
    /**
     * Method for getting low temperature for chosen location
     * @return low temperature for chosen location
     */
    public double getLow()
    {
        low = weatherResponse.getWeatherInfo().getMinimumTemperature();
        return low;
    }
    
    /**
     * Method for getting name of currently chosen location
     * @return city name of chosen location
     */
    public String getZipCity()
    {
        return weatherResponse.getCityName();
    }
    
    /**
     * method for getting snow information for chosen location
     * @return snow information for chosen location
     */
    public Snow getSnow()
    {
        return weatherResponse.getSnow();
    }
    
    /**
     * Method for getting rain information for chosen location
     * @return rain information for chosen location
     */
    public Rain getRain()
    {
        return weatherResponse.getRain();
    }
    
    /**
     * Method for getting wind information for chosen location
     * @return wind information for chosen location
     */
    public Wind getWind()
    {
        return weatherResponse.getWind();
    }
    
    /**
     * Method for setting latitude of chosen location
     * @param lat latitude of chosen location
     */
    public void setLatitude(double lat)
    {
        locationLat = lat;
    }
    
    /**
     * Method for setting longitude of chosen location
     * @param lng longitude of chosen location
     */
    public void setLongitude(double lng)
    {
        locationLng = lng;
    }
    
    /**
     * Method for setting hourly forecast of chosen location with coordinates
     * @param lat latitude of chosen location
     * @param lng longitude of chosen location
     */
    public void setHourlyForecast(double lat, double lng)
    {
        try{
             forecastResponse = forecastRequester
                .setLanguage(Language.ENGLISH)
                .setUnitSystem(Unit.IMPERIAL_SYSTEM)
                .setAccuracy(Accuracy.ACCURATE)
                .getByCoordinates(lat, lng);
        } catch(InvalidAuthTokenException e) {
            ex = e.toString();
        } catch(DataNotFoundException e) {
            ex = e.toString();
        }
    }
    
    /**
     * Method for getting hourly forecast of chosen location
     * @return hourly forecast of chosen location
     */
    public List<HourlyForecast.Forecast> getHourlyForecast()
    {
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

