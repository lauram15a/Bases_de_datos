/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author laura
 */
public class Product {

    public static String insert(String usuario, String contra, int barCode, String name_product, float priceNotVAT, float priceVAT, int stock, int week_discount, String startDate, String endDate ) throws SQLException{
        
        String msg = "";
        
        try {
            Class.forName("org.postgresql.Driver");
            Connection connection = null;
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/CAL3?myCurrentSchema=public", usuario, contra);
            Statement st = connection.createStatement();
            System.out.println("Connected:: ");
            
            msg = msg + "INSERT OK";
            ResultSet rs;
            rs = st.executeQuery("INSERT INTO public.product(\n" +
"	\"barCode\", name_product, \"priceNotVAT\", \"priceVAT\", stock, week_discount, \"startDate\", \"endDate\")\n" +
"	VALUES (" + barCode + ", '" + name_product + "', " + priceNotVAT + ", " + priceVAT + "," + stock + "," + week_discount + ", '" + startDate + "', '" + endDate + "');");
 
            msg = msg + "INSERT OK";
                    
        } catch (Exception e) {
            msg = msg + e.toString();
        } 
        
        return msg;
    }       


    public static String delete_one(String usuario, String contra, int barCode ){
        
        String msg = "";
        
        try {
            Class.forName("org.postgresql.Driver");
            Connection connection = null;
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/CAL3?myCurrentSchema=public", usuario, contra);
            Statement st = connection.createStatement();
            System.out.println("Connected:: ");
            
            ResultSet rs;
            rs = st.executeQuery("DELETE FROM public.product\n" +
"	WHERE \"barCode\"= " + barCode + ";");
            
            msg = "DELETE OK";
                        
        } catch (Exception e) {
            msg = e.toString();
        } 
        
        return msg;
    }


    public static String delete(String usuario, String contra){
        
        String msg = "";
        
        try {
            Class.forName("org.postgresql.Driver");
            Connection connection = null;
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/CAL3?myCurrentSchema=public", usuario, contra);
            Statement st = connection.createStatement();
            System.out.println("Connected:: ");
            
            ResultSet rs;
            msg = msg + "DELETE OK";
            rs = st.executeQuery("DELETE FROM public.product;");
            msg = msg + "DELETE OK";
                        
        } catch (Exception e) {
            msg = e.toString();
        } 
        
        return msg;
    }


    public static String update(String usuario, String contra,  int barCode, String name_product){
        
        String msg = "";
        
        try {
            Class.forName("org.postgresql.Driver");
            Connection connection = null;
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/CAL3?myCurrentSchema=public", usuario, contra);
            Statement st = connection.createStatement();
            System.out.println("Connected:: ");
            
            ResultSet rs;
            rs = st.executeQuery("UPDATE public.product" +
"	SET name_product= '" + name_product + "' \n" +
"	WHERE \"barCode\" = " +barCode + ";");
            
            msg = "UPDATE OK";

                        
        } catch (Exception e) {
            msg = e.toString();
        } 
        
        return msg;
    }
    
    public static String select (String usuario, String contra){
        
        String msg = "";
        
        try {
            Class.forName("org.postgresql.Driver");
            Connection connection = null;
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/CAL3?myCurrentSchema=public", usuario, contra);
            Statement st = connection.createStatement();
            System.out.println("Connected:: ");
            
            ResultSet rs;
            rs = st.executeQuery("SELECT \"barCode\", name_product, \"priceNotVAT\", \"priceVAT\", stock, week_discount, \"startDate\", \"endDate\"\n" +
"	FROM public.product;");
            
            int i = 1;
            
            while (rs.next()){
                
                msg = msg + "\n" + i + "- " + rs.getString(1) + "- " + rs.getString(2) + "- "  + rs.getString(3) + "- " + rs.getString(4) + "- " + rs.getString(5) + "- " + rs.getString(6) + "- " + rs.getString(7);
                i++;
            }
            
	msg = msg + "\nSELECT OK";
                           
        } catch (Exception e) {
            msg = msg + e.toString();
        } 
	return msg;
    }
}


