/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.weather49;

import com.github.prominence.openweathermap.api.model.Rain;
import com.github.prominence.openweathermap.api.model.Snow;
import com.github.prominence.openweathermap.api.model.Wind;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.github.dvdme.ForecastIOLib.*;

/**
 * Controller for Homepage.
 * @author Evan Branton
 * @version 02-25-2020
 */
public class homeController extends HttpServlet {

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
        HttpSession session = request.getSession();
        WeatherBean wd = new WeatherBean();
        
        String city;
        double high;
        double low;
        double current;
        String action = request.getParameter("action");
        System.out.println(action);
        String invalid = "false";
        city = request.getParameter("city");
        LocationBean lb = new LocationBean(city);
        lb.setLocation(city);
        AlertsBean ab = new AlertsBean();
        session.setAttribute("act", "weather");
        
        if(action.isEmpty())
        {
            if(session.getAttribute("action") == null)
            {
                action = "home";
            }
            else
            {
                action = (String) session.getAttribute("action");
                
            }
            
        }
        if(action.equalsIgnoreCase("alerts"))
        {
            session.setAttribute("action", action);
            getServletContext()
                    .getRequestDispatcher("/alerts.jsp")
                        .forward(request, response);
        }
        if(action.equalsIgnoreCase("Contact Us"))
        {
            session.setAttribute("action", action);
            getServletContext()
                    .getRequestDispatcher("/contact.jsp")
                    .forward(request, response);  
        }
        if(action.equalsIgnoreCase("About Us"))
        {
            session.setAttribute("action", action);
            getServletContext()
                    .getRequestDispatcher("/about.jsp")
                    .forward(request, response);  
        }
        
        if(action.equalsIgnoreCase("Home") && (invalid.equals("false")))
        {
            if(request.getParameter("city").equalsIgnoreCase("Harambe"))
            {
                getServletContext()
                    .getRequestDispatcher("/harambe.jsp")
                        .forward(request, response);
            }
            session.setAttribute("action", action);
            session.setAttribute("invalid", "true");;
            String a = (String) session.getAttribute("city");
            System.out.println(a);
            double[] latLng = lb.getResults();
            wd.setCurrentWeather(latLng[0],latLng[1]);
            
            ab.setForecast(latLng[0], latLng[1]);
            ab.setAlert();
            FIOAlerts alert = ab.getAlert();
            
            if(wd.getHigh() == -512)
            {
                session.setAttribute("action", action);
                session.setAttribute("invalid", "true");
                session.removeAttribute(city);
                getServletContext()
                    .getRequestDispatcher("/home.jsp")
                    .forward(request, response);
            }
            if(wd.getLow() == -512)
            {
                session.setAttribute("action", action);
                session.setAttribute("invalid", "true");
                session.removeAttribute(city);
                getServletContext()
                    .getRequestDispatcher("/home.jsp")
                    .forward(request, response);
            }
            if(wd.getCurrentTemp() == -512)
            {
                session.setAttribute("action", action);
                session.setAttribute("invalid", "true");
                session.removeAttribute(city);
                getServletContext()
                    .getRequestDispatcher("/home.jsp")
                    .forward(request, response);
            }
            session.setAttribute("abean", ab);
            session.setAttribute("alert", alert);
            session.setAttribute("invalid", "false");
            high = wd.getHigh();
            high = Math.round(high);
            int intHigh = (int) high;
            session.setAttribute("high", intHigh);
            low = wd.getLow();
            low= Math.round(low);
            int intLow = (int) low;
            session.setAttribute("low", intLow);
            current = wd.getCurrentTemp();
            current = Math.round(current);
            int intCur = (int) current;
            session.setAttribute("current", intCur);
            //  String cityName = (wd.getCurrentWeather().getCityName());
            String cityName = (lb.getCityOnly());
            String fullName = (lb.getCity());
            Snow snowInfo = wd.getSnow();
            Rain rainInfo = wd.getRain();
            Wind windInfo = wd.getWind();
            
            session.setAttribute("weather", wd.getCurrentWeather().getWeatherStates().get(0).getWeatherGroup());
            session.setAttribute("weatherDescription", wd.getCurrentWeather().getWeatherStates().get(0).getDescription());
            session.setAttribute("cityName", cityName);
            session.setAttribute("fullName", fullName);
            session.setAttribute("city", request.getParameter("city"));
            session.setAttribute("sunUp", wd.getSunRiseTime());
            session.setAttribute("sunDown", wd.getSunSetTime());
            session.setAttribute("humidity", wd.getCurrentWeather().getHumidityPercentage());
            session.setAttribute("pressure", wd.getCurrentWeather().getPressure());
            session.setAttribute("snow", snowInfo);
            session.setAttribute("rain", rainInfo);
            session.setAttribute("wind", windInfo);
            
            
            
            
            request.setAttribute("Current", wd.getCurrentTemp());
            getServletContext()
                    .getRequestDispatcher("/home.jsp")
                    .forward(request, response);        
        }
        if(action.equalsIgnoreCase("Home") && invalid.equalsIgnoreCase("True"))
        {
            session.setAttribute("action", action);
            session.removeAttribute("city");
            session.removeAttribute("high");
            session.removeAttribute("low");
            session.removeAttribute("current");
            
            getServletContext()
                    .getRequestDispatcher("/home.jsp")
                        .forward(request,response);
        }
        if(action.equalsIgnoreCase("See More"))
        {
            city = request.getParameter("city");
            lb.setLocation(city);
            session.setAttribute("action", action);
            session.setAttribute("invalid", "true");;
            String a = (String) session.getAttribute("city");
            System.out.println(a);
            wd.setCity(city);
            double[] latLng = lb.getResults();
            wd.setCurrentWeather(latLng[0],latLng[1]);
            if(wd.getHigh() == -512)
            {
                session.setAttribute("action", action);
                session.setAttribute("invalid", "true");
                session.removeAttribute(city);
                getServletContext()
                    .getRequestDispatcher("/home.jsp")
                    .forward(request, response);
            }
            if(wd.getLow() == -512)
            {
                session.setAttribute("action", action);
                session.setAttribute("invalid", "true");
                session.removeAttribute(city);
                getServletContext()
                    .getRequestDispatcher("/home.jsp")
                    .forward(request, response);
            }
            if(wd.getCurrentTemp() == -512)
            {
                session.setAttribute("action", action);
                session.setAttribute("invalid", "true");
                session.removeAttribute(city);
                getServletContext()
                    .getRequestDispatcher("/home.jsp")
                    .forward(request, response);
            }
            
            session.setAttribute("invalid", "false");
            high = wd.getHigh();
            high = Math.round(high);
            int intHigh = (int) high;
            session.setAttribute("high", intHigh);
            low = wd.getLow();
            low= Math.round(low);
            int intLow = (int) low;
            session.setAttribute("low", intLow);
            current = wd.getCurrentTemp();
            current = Math.round(current);
            int intCur = (int) current;
            session.setAttribute("current", intCur);
            city = wd.getCurrentWeather().getCityName();;
            Snow snowInfo = wd.getSnow();
            Rain rainInfo = wd.getRain();
            Wind windInfo = wd.getWind();
            ab.setForecast(latLng[0], latLng[1]);
            ab.setAlert();
            FIOAlerts alert = ab.getAlert();
            session.setAttribute("abean", ab);
            session.setAttribute("alert", alert);
            
            session.setAttribute("weather", wd.getCurrentWeather().getWeatherStates().get(0).getWeatherGroup());
            session.setAttribute("weatherDescription", wd.getCurrentWeather().getWeatherStates().get(0).getDescription());
            session.setAttribute("city", city);
            session.setAttribute("sunUp", wd.getSunRiseTime());
            session.setAttribute("sunDown", wd.getSunSetTime());
            session.setAttribute("humidity", wd.getCurrentWeather().getHumidityPercentage());
            session.setAttribute("pressure", wd.getCurrentWeather().getPressure());
            session.setAttribute("snow", snowInfo);
            session.setAttribute("rain", rainInfo);
            session.setAttribute("wind", windInfo);
            String temp = request.getParameter("city").substring(0,1).toUpperCase();
            String temp1 = request.getParameter("city").substring(1);
            session.setAttribute("action", action);
            session.setAttribute("city", temp.concat(temp1));
            getServletContext()
                    .getRequestDispatcher("/details.jsp")
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
