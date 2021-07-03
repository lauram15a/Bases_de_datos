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
import javax.swing.JOptionPane;

/**
 *
 * @author laura
 */
public class Cashier {
    
    public static void insert(String usuario, String contra, char ID, char ID_worker) {
        
        try {
            Class.forName("org.postgresql.Driver");
            Connection connection = null;
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/CAL3?myCurrentSchema=public", usuario, contra);
            Statement st = connection.createStatement();
            System.out.println("Connected:: ");
            
            ResultSet rs;
            rs = st.executeQuery("INSERT INTO public.cashier(\n" +
"	\"ID\", \"ID_worker\")\n" +
"	VALUES (" + ID + ", " + ID_worker + ");");   
            
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        
    }
    
    public static void delete_one(String usuario, String contra, char ID){
        
        try {
            Class.forName("org.postgresql.Driver");
            Connection connection = null;
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/CAL3?myCurrentSchema=public", usuario, contra);
            Statement st = connection.createStatement();
            System.out.println("Connected:: ");
            
            ResultSet rs;
            rs = st.executeQuery("DELETE FROM public.cashier\n" +
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
            rs = st.executeQuery("DELETE FROM public.cashier;");
                        
        } catch (Exception e) {
            System.out.println(e.toString());
        }
    }
    
    public static String update(String usuario, String contra, char ID, char newID_worker){
        
        String msg = "";
        try {
            Class.forName("org.postgresql.Driver");
            Connection connection = null;
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/CAL3?myCurrentSchema=public", usuario, contra);
            Statement st = connection.createStatement();
            System.out.println("Connected:: ");
            
            ResultSet rs;
            rs = st.executeQuery("UPDATE public.cashier\n" +
"	SET \"ID_worker\"=" + newID_worker + "\n" +
"	WHERE \"ID\"=" + ID + ";");
            
            msg = "UPDATE OK";
                        
        } catch (Exception e) {
            msg = e.toString();
        }
        
        return msg;
    }
}
