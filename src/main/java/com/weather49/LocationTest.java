/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.weather49;

import java.util.*;
import java.io.*;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author Tanner
 */
public class LocationTest {
    
    public static void main(String args[]){
        Scanner scan = new Scanner(System.in);
        System.out.println("Enter a Location:");
        
        String in = scan.nextLine();
        
        LocationBean lb = new LocationBean(in);
        
        try {
            String res = lb.getCity();
            System.out.println("\n\n" + res + "\n\n");
        } catch (IOException ex) {
            Logger.getLogger(LocationTest.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        
    }
}
