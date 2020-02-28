package com.weather49;
import com.google.gson.*;
import org.slf4j.*;
import com.google.maps.*;
import com.google.maps.errors.*;
import com.google.maps.internal.ratelimiter.*;
import com.google.maps.model.*;
import java.io.*;

/**
 * LocationBean class responsible for converting user address input to Lat 
 * Long coordinates for use with OpenWeatherMap.
 * 
 * @author Evan Branton and Tanner Abernathy
 * @version 02-24-2020
 * 
 */
public class LocationBean {
    
    //Initialize key string and pull string from given json file.
    private KeyBean keys = new KeyBean("keys.json");
    private String key = keys.getGeoKey();
    
    
    //GeoApiContext variable for using API key
    GeoApiContext context = new GeoApiContext.Builder()
            .apiKey(key)
                .build();
    //location string containing user address input
    String location;
    LatLng coords;
    
    /**
     * Main constructor for LocationBean class.
     * @param address an address from the user
     */
    public LocationBean(String address)
    {
        this.location = address;
    }
    
    /**
     * Method for setting location with given address input.
     * @param address an address from the user
     */
    public void setLocation(String address)
    {
        //Set location String to address String
        this.location = address;
    }
    
    /**
     * Method for getting address from location String.
     * @return address sent in to object
     */
    public String getAddress()
    {
        //Return location String
        return location;
    }
    
    /**
     * getResults method for pulling latitude and longitude from Google Geocoding API
     * @return an array with the latitude and longitude
     * @throws IOException throws if IOException occurs
     */
    public double[] getResults() throws IOException
    {
        try{
            /* Create new GeocodingResult object named results.  Send in user address input
            *  and accept lat long result into Double array.
            */
            GeocodingResult[] results = GeocodingApi.geocode(context, getAddress()).await();
            double[] latlng = new double[2];
            latlng[0] = results[0].geometry.location.lat;
            latlng[1] = results[0].geometry.location.lng;
            
            
            //Return latlng array
            return latlng;
            
        }catch(ApiException e){
            e.toString();
        }catch(InterruptedException e){
            e.toString();
        }catch(IOException x){
            x.toString();
        }
        
        //Return null if nothing occurs
        return null;
    }
    
    /**
     * Method for pulling detailed information on city and state
     * @return A string with the city, state, and country
     * @throws IOException throws if IOException occurs
     */
    public String getCity() throws IOException
    {
        try{
            /* Create new GeocodingResult object named results.  Send in user address input
            *  and accept lat long result into Double array.
            */
            double[] latlng = getResults();
            
            //Print lat long for debugging
            System.out.println("\n" + latlng[0] + " " + latlng[1] + "\n");
            
            if(latlng[0] == 35.7344538 && latlng[1] == -81.3444573)
            {
                latlng[0] = 35.7476322;
                latlng[1] = -81.33730849999999;
            }
            
            //Create LatLng object named loc and send in lat long from address
            LatLng loc = new LatLng(latlng[0], latlng[1]);
            
            //Create GeocodingResult object named rResults and send in loc object.
            GeocodingResult[] results = GeocodingApi.reverseGeocode(context, loc).await();
            
            String city = results[0].addressComponents[2].longName.toString();
            String state;
            if (results[0].addressComponents.length > 9)
                state = results[0].addressComponents[4].longName.toString() + ", " + results[0].addressComponents[6].shortName.toString();
                
            else
                state = results[0].addressComponents[5].shortName.toString();
            //Return city
            
            return (city + ", " + state);
            
        }catch(ApiException e){
            System.out.println("\n" + e.toString() + "\n");
        }catch(InterruptedException b){
            System.out.println("\n" + b.toString() + "\n");
        }catch(IOException x){
            System.out.println("\n" + x.toString() + "\n");
        }
        
        //Return null if nothing occurs
        return null;
    }
    
    /**
     * Method for only retrieving the city name
     * @return A string with the city name
     * @throws IOException throws if IOException occurs
     */
    public String getCityOnly() throws IOException
    {
        try{
            /* Create new GeocodingResult object named results.  Send in user address input
            *  and accept lat long result into Double array.
            */
            double[] latlng = getResults();
            
            //Print lat long for debugging
            System.out.println("\n" + latlng[0] + " " + latlng[1] + "\n");
            
            if(latlng[0] == 35.7344538 && latlng[1] == -81.3444573)
            {
                latlng[0] = 35.7476322;
                latlng[1] = -81.33730849999999;
            }
            
            //Create LatLng object named loc and send in lat long from address
            LatLng loc = new LatLng(latlng[0], latlng[1]);
            
            //Create GeocodingResult object named rResults and send in loc object.
            GeocodingResult[] results = GeocodingApi.reverseGeocode(context, loc).await();
            
            String city = results[0].addressComponents[2].longName.toString();
            //Return city
            
            return city;
            
        }catch(ApiException e){
            System.out.println("\n" + e.toString() + "\n");
        }catch(InterruptedException b){
            System.out.println("\n" + b.toString() + "\n");
        }catch(IOException x){
            System.out.println("\n" + x.toString() + "\n");
        }
        
        //Return null if nothing occurs
        return null;
    }
    
}
