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
public class Evaluates {
    
    public static String insert(String usuario, String contra, String ID_worker, String ID_worker1, int grade ) {
	String msg = "";
        try {
            Class.forName("org.postgresql.Driver");
            Connection connection = null;
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/CAL3?myCurrentSchema=public", usuario, contra);
            Statement st = connection.createStatement();
            System.out.println("Connected:: ");
            
            ResultSet rs;
            rs = st.executeQuery("INSERT INTO public.muchos_worker_tiene_muchos_worker(\n" +
"	\"ID_worker\", \"ID_worker1\", grade)\n" +
"	VALUES ('" + ID_worker + "', '" + ID_worker1 + "'," + grade + ");");
	msg = msg + "INSERT OK";
                   
        } catch (Exception e) {
            msg = msg + e.toString();
        } 
	return msg;
    }      

    public static String delete_one(String usuario, String contra, String ID_worker){
        String msg = "";
        try {
            Class.forName("org.postgresql.Driver");
            Connection connection = null;
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/CAL3?myCurrentSchema=public", usuario, contra);
            Statement st = connection.createStatement();
            System.out.println("Connected:: ");
            
            ResultSet rs;
            rs = st.executeQuery("DELETE FROM public.muchos_worker_tiene_muchos_worker\n" +
"	WHERE \"ID_worker\" = '" +ID_worker + "';");
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
            rs = st.executeQuery("DELETE FROM public.muchos_worker_tiene_muchos_worker;");
	msg = msg + "DELETE OK";
                   
        } catch (Exception e) {
            msg = msg + e.toString();
        } 
	return msg;
    }

    public static String update(String usuario, String contra, String ID_worker,  int grade ){
	String msg = "";
        
        try {
            Class.forName("org.postgresql.Driver");
            Connection connection = null;
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/CAL3?myCurrentSchema=public", usuario, contra);
            Statement st = connection.createStatement();
            System.out.println("Connected:: ");
            
            ResultSet rs;
            rs = st.executeQuery("UPDATE public.muchos_worker_tiene_muchos_worker\n" +
"	SET grade=" + grade + "\n" +
"	WHERE \"ID_worker\" = '" + ID_worker + "';");
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
            rs = st.executeQuery("SELECT \"ID_worker\", \"ID_worker1\", grade\n" +
"	FROM public.muchos_worker_tiene_muchos_worker;");
            
            int i = 1;
            
            while (rs.next()){
                
                msg = msg + "\n" + i + "- " + "Worker evaluador: " + rs.getString(1) + "  |  Worker evaluado: " + rs.getString(2) + "  |  Grade: " + rs.getString(3);
                //System.out.println("\n" + i + "- " + "Worker evaluador: " + rs.getString(1) + "  |  Worker evaluado: " + rs.getString(2) + "  |  Grade: " + rs.getString(3));
                i++;
            }
            
	msg = msg + "\nSELECT OK";
                           
        } catch (Exception e) {
            msg = msg + e.toString();
        } 
	return msg;
    }

    
}
