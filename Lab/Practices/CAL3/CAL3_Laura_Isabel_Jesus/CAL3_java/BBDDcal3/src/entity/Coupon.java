/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author laura
 */
public class Coupon {
    
    public static void insert(String usuario, String contra, int ID, int percentage) {
        
        try {
            Class.forName("org.postgresql.Driver");
            Connection connection = null;
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/CAL3?myCurrentSchema=public", usuario, contra);
            Statement st = connection.createStatement();
            System.out.println("Connected:: ");
            
            ResultSet rs;
            rs = st.executeQuery("INSERT INTO public.coupon(\n" +
"	\"ID\", percentage)\n" +
"	VALUES (" + ID + ", " + percentage + ");");   
            
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        
    }
    
    public static void delete_one(String usuario, String contra, int ID){
        
        try {
            Class.forName("org.postgresql.Driver");
            Connection connection = null;
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/CAL3?myCurrentSchema=public", usuario, contra);
            Statement st = connection.createStatement();
            System.out.println("Connected:: ");
            
            ResultSet rs;
            rs = st.executeQuery("DELETE FROM public.coupon\n" +
"	WHERE \"ID\" = " + ID + ";");
                        
        } catch (Exception e) {
            System.out.println(e.toString());
        }
    }
    
    public static void delete(String usuario, String contra){
        
        try {
            Class.forName("org.postgresql.Driver");
            Connection connection = null;
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/CAL3?myCurrentSchema=public", usuario, contra);
            Statement st = connection.createStatement();
            System.out.println("Connected:: ");
            
            ResultSet rs;
            rs = st.executeQuery("DELETE FROM public.coupon;");
                        
        } catch (Exception e) {
            System.out.println(e.toString());
        }
    }
    
    public static void update(String usuario, String contra, int ID, int percentage){
        
        try {
            Class.forName("org.postgresql.Driver");
            Connection connection = null;
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/CAL3?myCurrentSchema=public", usuario, contra);
            Statement st = connection.createStatement();
            System.out.println("Connected:: ");
            
            ResultSet rs;
            rs = st.executeQuery("UPDATE public.coupon\n" +
"	SET percentage=" + percentage + "\n" +
"	WHERE \"ID\" = " + ID + ";");
                        
        } catch (Exception e) {
            System.out.println(e.toString());
        }
    }
}
