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
public class Returned {

     public static String insert(String usuario, String contra, int barCode_product, int ID_ticket, float amount ) {
        String msg = "";
         try {
            Class.forName("org.postgresql.Driver");
            Connection connection = null;
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/CAL3?myCurrentSchema=public", usuario, contra);
            Statement st = connection.createStatement();
            System.out.println("Connected:: ");
            
            ResultSet rs;
            rs = st.executeQuery("INSERT INTO public.returned(\n" +
"	\"barCode_product\", \"ID_ticket\", amount)\n" +
"	VALUES ( " + barCode_product + ",  " + ID_ticket + ", " + amount + ");");  
            msg = msg + "INSERT OK";
            
        } catch (Exception e) {
            msg = msg + e.toString();
        } 
         return msg;
    }       


    public static String delete_one(String usuario, String contra, int barCode_product ){
        String msg = "";
        try {
            Class.forName("org.postgresql.Driver");
            Connection connection = null;
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/CAL3?myCurrentSchema=public", usuario, contra);
            Statement st = connection.createStatement();
            System.out.println("Connected:: ");
            
            ResultSet rs;
            rs = st.executeQuery("DELETE FROM public.returned \n" +
"	WHERE \"barCode_product\"= " + barCode_product+ ";");
         msg = msg + "DELETE OK";
            
        } catch (Exception e) {
            msg = msg + e.toString();
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
            rs = st.executeQuery("DELETE FROM public.returned;");
         msg = msg + "DELETE OK";
            
        } catch (Exception e) {
            msg = msg + e.toString();
        } 
         return msg;
    }


    public static String update(String usuario, String contra, int barCode_product, int amount){
        String msg = "";
        try {
            Class.forName("org.postgresql.Driver");
            Connection connection = null;
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/CAL3?myCurrentSchema=public", usuario, contra);
            Statement st = connection.createStatement();
            System.out.println("Connected:: ");
            
            ResultSet rs;
            rs = st.executeQuery("UPDATE public.returned" +
"	SET amount=" + amount + "\n" +
"	WHERE \"barCode_product\" = " + barCode_product + ";");
         msg = msg + "UPDATE OK";
            
        } catch (Exception e) {
            msg = msg + e.toString();
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
            rs = st.executeQuery("SELECT \"barCode_product\", \"ID_ticket\", amount\n" +
"	FROM public.returned;");
            
            int i = 1;
            
            while (rs.next()){
                
                msg = msg + "\n" + i + "- " + rs.getString(1) + "- " + rs.getString(2) + "- "  + rs.getString(3);
                i++;
            }
            
	msg = msg + "\nSELECT OK";
                           
        } catch (Exception e) {
            msg = msg + e.toString();
        } 
	return msg;
    }
}
