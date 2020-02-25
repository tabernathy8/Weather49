/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.weather49;

import com.github.dvdme.ForecastIOLib.FIOAlerts;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Controller for Radar page
 * @author Evan Branton
 * @version 02-25-2020
 */
public class radarController extends HttpServlet {

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
        WeatherBean wd = new WeatherBean();
        HttpSession session = request.getSession();
        if(request.getParameter("action").equalsIgnoreCase("alerts"))
        {
            getServletContext()
                        .getRequestDispatcher("/alerts.jsp")
                            .forward(request, response);
        }
        session.setAttribute("act", "radar");
        LocationBean lb = new LocationBean(request.getParameter("city"));
        String action = request.getParameter("action");
        
        double[] latLng = lb.getResults();
        wd.setLatitude(latLng[0]);
        wd.setLongitude(latLng[1]);
        wd.setCurrentWeather(latLng[0],latLng[1]);
        if(session.getAttribute("lat") != null)
        {
            String oldCity = (String) session.getAttribute("city");
            double oldLat = (double) session.getAttribute("lat");
            double oldLng = (double) session.getAttribute("lng");
            if(wd.getHigh() == -512)
            {
                session.setAttribute("city",oldCity);
                session.setAttribute("lat", oldLat);
                session.setAttribute("lng", oldLng);
                getServletContext()
                        .getRequestDispatcher("/radar.jsp")
                            .forward(request, response);
            }
        }
        AlertsBean ab = new AlertsBean();
        ab.setForecast(latLng[0], latLng[1]);
        ab.setAlert();
        FIOAlerts alert = ab.getAlert();
        session.setAttribute("abean", ab);
        session.setAttribute("alert", alert);
        session.setAttribute("action", action);
        if(action.equals("Radar"))
        {
            session.setAttribute("city",request.getParameter("city"));
            session.setAttribute("cityName", wd.getCurrentWeather().getCityName());
            session.setAttribute("lat", wd.getLatitude());
            session.setAttribute("lng",wd.getLongitude());
            getServletContext()
                    .getRequestDispatcher("/radar.jsp")
                    .forward(request, response);
            
        }
        else
        {
            getServletContext()
                    .getRequestDispatcher("/home.jsp")
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
