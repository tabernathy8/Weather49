/**
 * @author Evan Branton and Tanner Abernathy
 * @version 02-24-2020
 * 
 */
package com.weather49;
import org.slf4j.*;
import com.google.maps.*;
import com.google.maps.errors.*;
import com.google.maps.internal.ratelimiter.*;
import com.google.maps.model.*;
import com.google.gson.*;
import java.io.*;
import java.util.*;


public class LocationBean {
    
    private String key = this.getKey("keys.json");
    
    
    //GeoApiContext variable for using API key
    GeoApiContext context = new GeoApiContext.Builder()
            .apiKey(key)
                .build();
    String location;
    
    /**
     * 
     * @param address an address from the user
     */
    public LocationBean(String address)
    {
        this.location = address;
    }
    
    public String getKey(String path)
    {
        try {
            JsonElement jelement = new JsonParser().parse(new FileReader(path));
            JsonObject jobject = jelement.getAsJsonObject();
            String result = jobject.get("GeoKey").getAsString();
            return result;
        } catch(Exception e)
        {
            System.out.println("\nException in LocationBean.getKey()\n" + e.toString());
            return null;
        }
    }
    
    /**
     * 
     * @param address an address from the user
     */
    public void setLocation(String address)
    {
        this.location = address;
    }
    
    /**
     * 
     * @return address sent in to object
     */
    public String getAddress()
    {
        return location;
    }
    
    /**
     * getResults method for pulling latitude and longitude from Google Geocoding API
     * @return an array with the latitude and longitude
     * @throws IOException
     */
    public double[] getResults() throws IOException
    {
        try{
            GeocodingResult[] results = GeocodingApi.geocode(context, getAddress()).await();
            double[] latlng = new double[2];
            latlng[0] = results[0].geometry.location.lat;
            latlng[1] = results[0].geometry.location.lng;
            return latlng;
        }catch(ApiException e){
            e.toString();
        }catch(InterruptedException e){
            e.toString();
        }catch(IOException x){
            x.toString();
        }
        return null;
    }
    
    /**
     * getCity method for pulling detailed information on city and state
     * @return A string with the city, state, and country
     * @throws IOException
     */
    public String getCity() throws IOException
    {
        System.out.println("\nCode-Check-1\n");
        try{
            
            System.out.println("\nCode-Check-2\n");
            GeocodingResult[] results = GeocodingApi.geocode(context, getAddress()).await();
            System.out.println("\nCode-Check-3\n");
            double[] latlng = new double[2];
            latlng[0] = results[0].geometry.location.lat;
            latlng[1] = results[0].geometry.location.lng;
            System.out.println("\nCode-Check-4\n");
            
            System.out.println("\n" + latlng[0] + " " + latlng[1] + "\n");
            
            LatLng loc = new LatLng(latlng[0], latlng[1]);
            
            GeocodingResult[] rResults = GeocodingApi.reverseGeocode(context, loc).await();
            
            String add = results[0].geometry.toString();
            
            return add;
            
            
            
            
        }catch(ApiException e){
            System.out.println("\n" + e.toString() + "\n");
            System.out.println("\nApi Exception\n");
        }catch(InterruptedException b){
            System.out.println("\n" + b.toString() + "\n");
        }catch(IOException x){
            System.out.println("\n" + x.toString() + "\n");
        }
        return null;
    }
    
}
