package com.mydata;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Data {
	Connection con=null;;
	public ResultSet rs=null;
	public Data(Connection con) {
		this.con=con;
		
	}
	public ResultSet display() {
		try {
			Statement st=con.createStatement();
			 rs=st.executeQuery("select * from students");
			
		}
		catch(SQLException se) {
			se.printStackTrace();
		}
		return rs;
		
	}

}
