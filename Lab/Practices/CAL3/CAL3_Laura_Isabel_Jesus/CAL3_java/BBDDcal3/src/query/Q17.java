/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package query;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author laura
 */
public class Q17 {

    // 17. Show the name of the member that has issued the best opinion (the highest score)

    public static String q17(String usuario, String contra) {
        
        String resultado = "";
        
        try {
            Class.forName("org.postgresql.Driver");
            Connection connection = null;
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/CAL3?myCurrentSchema=public", usuario, contra);
            Statement st = connection.createStatement();
            System.out.println("Connected:: ");
            
            ResultSet rs;
            rs = st.executeQuery("SELECT \"name\", \"score\"\n" +
"FROM \"member\" INNER JOIN opinion \n" +
"ON (\"member\".\"membershipCode\" = opinion.\"membershipCode_member\")\n" +
"WHERE opinion.\"score\" = (SELECT max(opinion.\"score\")\n" +
"				   FROM opinion);");
                        
            while (rs.next()){
                resultado = resultado + "\n" + "Name: " + rs.getString(1) + "   |  Score: " + rs.getString(2);
            }
            
        } catch (Exception e) {
            System.out.println(e.toString());
            
        }
        
        return resultado;
    }
}

