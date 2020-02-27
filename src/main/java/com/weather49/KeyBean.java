/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.weather49;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.*;
import java.io.*;

/**
 * KeyBean class responsible for reading secure API keys from user 
 * provided keys.json file.
 * @author Tanner Abernathy
 * @version 02-25-2020
 */
public class KeyBean {
    
    //Initialize keys JsonObject field to store the keys.json data
    JsonObject keys;
    
    /**
     * Main Constructor for KeyBean
     * @param path path to json file containing API keys
     */
    public KeyBean(String path)
    {
        //Build keys object from json file sent in as path
        keys = new JsonParser().parse(new InputStreamReader(getClass().getClassLoader().getResourceAsStream(path))).getAsJsonObject();
    }
    
    /**
     * Method for getting Google Geocoding API key
     * @return Google Geocoding API key
     */
    public String getGeoKey()
    {
        //Pull String result from GeoKey in JSON file
        String result = keys.get("GeoKey").getAsString();

        //Return result
        return result;
    }
    
    /**
     * Method for getting OpenWeatherMap API key
     * @return OpenWeatherMap API key
     */
    public String getOWMKey()
    {
        //Pull String result from GeoKey in JSON file
        String result = keys.get("OWMKey").getAsString();

        //Return result
        return result;
    }
}
