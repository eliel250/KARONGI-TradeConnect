/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package config;

import org.springframework.jdbc.datasource.DriverManagerDataSource;


public class ConnectionConf {
    
 public DriverManagerDataSource Connect()   {
     
 DriverManagerDataSource dt= new DriverManagerDataSource();
 dt.setDriverClassName("com.mysql.jdbc.Driver");
 dt.setUrl("jdbc:mysql://localhost:3306/online_db");
 dt.setUsername("root");
 dt.setPassword("");
 return dt;
 
 
 
 
 
 }
    
    
    
    
    
    
    
    
}
