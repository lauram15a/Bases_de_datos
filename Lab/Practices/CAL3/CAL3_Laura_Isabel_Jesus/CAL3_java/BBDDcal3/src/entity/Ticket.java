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
public class Ticket {

     public static String insert(String usuario, String contra, String ID, String date, String timeIssuance, boolean coupon_used, float totalPrice,
             float amountAccumulated, String ID_cashier, int membershipCode_member,boolean usesAccumulatedNumber, int quantityUsed ) {
        
         String msg = "";
         try {
            Class.forName("org.postgresql.Driver");
            Connection connection = null;
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/CAL3?myCurrentSchema=public", usuario, contra);
            Statement st = connection.createStatement();
            System.out.println("Connected:: ");
            
            ResultSet rs;
            rs = st.executeQuery("INSERT INTO public.ticket(\n" +
"	\"ID\", date, \"timeIssuance\", coupon_used, \"totalPrice\", \"amountAccumulated\", \"ID_cashier\", \"membershipCode_member\",\n" +
"	\"usesAccumulatedNumber\", \"quantityUsed\")\n" +
"	VALUES (" + ID + ",'" + date + "', '" + timeIssuance + "', " + coupon_used + ", " + totalPrice + ", " + null + ", '" + ID_cashier + "', " + membershipCode_member + ", " + usesAccumulatedNumber + ", " + quantityUsed + ");");         
            msg = msg + "INSERT OK";
         } catch (Exception e) {
            msg = msg + e.toString();
        } 
         return msg;
    }       




    public static String delete_one(String usuario, String contra, String ID){
        String msg = "";
        try {
            Class.forName("org.postgresql.Driver");
            Connection connection = null;
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/CAL3?myCurrentSchema=public", usuario, contra);
            Statement st = connection.createStatement();
            System.out.println("Connected:: ");
            
            ResultSet rs;
            rs = st.executeQuery("DELETE FROM public.ticket WHERE \"ID\"= '" + ID + "';");
                     
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
            rs = st.executeQuery("DELETE FROM public.ticket;");
            
            msg = msg + "DELETE OK";
                        
        } catch (Exception e) {
            msg = msg + e.toString();
        } 
         return msg;
    }


    public static String update(String usuario, String contra, int ID, float totalPrice ){
        String msg = "";
        try {
            Class.forName("org.postgresql.Driver");
            Connection connection = null;
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/CAL3?myCurrentSchema=public", usuario, contra);
            Statement st = connection.createStatement();
            System.out.println("Connected:: ");
            
            ResultSet rs;
            rs = st.executeQuery("UPDATE public.ticket" +
"	SET \"totalPrice\" =" + totalPrice + "\n" +
"	WHERE \"ID\" = " + ID + ";");
            
            msg = msg + "UPDATE OK";
            
            connection.close();
            
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
            rs = st.executeQuery("SELECT \"ID\", date, \"timeIssuance\", coupon_used, \"totalPrice\", \"amountAccumulated\", \"ID_cashier\", "
                    + "\"membershipCode_member\", \"usesAccumulatedNumber\", \"quantityUsed\"\n" 
                    +        "	FROM public.ticket;");
            
            int i = 1;
            
            while (rs.next()){
                
                msg = msg + "\n" + i + "- " + rs.getString(1) + "- " + rs.getString(2) + "- "  + rs.getString(3) + "- " + rs.getString(4) + "- " + rs.getString(5) + "- " + rs.getString(6) + "- " + rs.getString(7) + "- " + rs.getString(8) + "- " + rs.getString(9);
                i++;
            }
            
	msg = msg + "\nSELECT OK";
                           
        } catch (Exception e) {
            msg = msg + e.toString();
        } 
	return msg;
    }
}


