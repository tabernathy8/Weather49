/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.weather49;

import com.github.dvdme.ForecastIOLib.FIOAlerts;
import com.github.prominence.openweathermap.api.model.response.HourlyForecast;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;
import java.sql.*;
import java.util.*;
import java.io.IOException;
import java.net.*;
import com.github.prominence.openweathermap.api.model.*;

/**
 * Controller for Five Day Forecast page.
 * @author Evan Branton
 * @version 02-25-2020
 */
@WebServlet(name = "fiveDayController", urlPatterns = {"/forecast"})
public class fiveDayController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action =request.getParameter("action");
        String city;
        String oldCity;
        WeatherBean wd = new WeatherBean();
        LocationBean lb = new LocationBean(request.getParameter("city"));
        HttpSession session = request.getSession();
        session.setAttribute("act", "fourday");
        AlertsBean ab = new AlertsBean();
        if(request.getParameter("action").equalsIgnoreCase("alerts"))
        {
            getServletContext()
                        .getRequestDispatcher("/alerts.jsp")
                            .forward(request, response);
        }
        if(action.equalsIgnoreCase("4 Day Forecast"))
        {
            oldCity = (String) session.getAttribute("city");
            session.setAttribute("action", action);
            
            double[] latLng = lb.getResults();
            wd.setCurrentWeather(latLng[0], latLng[1]);
            wd.setHourlyForecast(latLng[0],latLng[1]);
            if(wd.ex.equalsIgnoreCase("class com.github.prominence.openweathermap.api.exception.DataNotFoundException"))
            {
                session.setAttribute("city", oldCity);
                getServletContext()
                    .getRequestDispatcher("/5day.jsp")
                    .forward(request, response);    
            }
            List<HourlyForecast.Forecast> ws = wd.getHourlyForecast();
            List<HourlyForecast.Forecast> x = new ArrayList();
            List<HourlyForecast.Forecast> low = new ArrayList();
            ArrayList<Double> highs = new ArrayList<>();
            ArrayList<Float> lowTemps = new ArrayList();
            ArrayList<Float> highTemps = new ArrayList();
            if(ws == null)
            {
                session.setAttribute("city", oldCity);
                getServletContext()
                    .getRequestDispatcher("/5day.jsp")
                    .forward(request, response);
            }
            for(int i = 0; i < ws.size();i++)
            {
                if(ws.get(i).getDt_txt().contains("15:00:00"))
                {   
                    x.add(ws.get(i));
                }
            }
            for(int i = 0; i < ws.size(); i++)
            {
                if(ws.get(i).getDt_txt().contains("6:00:00"))
                {
                    low.add(ws.get(i));
                }
            }
            for(int i = 0; i < x.size(); i++)
            {
                float temp = Math.round(x.get(i).getWeatherInfo().getTemperature());
                highTemps.add(temp);
            }
            for(int i = 0; i < low.size(); i++)
            {
                float temp = Math.round(low.get(i).getWeatherInfo().getTemperature());
                lowTemps.add(temp);
            }
            ab.setForecast(latLng[0], latLng[1]);
            ab.setAlert();
            FIOAlerts alert = ab.getAlert();
            session.setAttribute("abean", ab);
            session.setAttribute("alert", alert);
            session.setAttribute("x", x);
            session.setAttribute("cityName" ,lb.getCityOnly());
            session.setAttribute("city", request.getParameter("city"));
            session.setAttribute("highTemps", highTemps);
            session.setAttribute("lowTemps", lowTemps);
            getServletContext()
                    .getRequestDispatcher("/5day.jsp")
                    .forward(request, response);     
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
