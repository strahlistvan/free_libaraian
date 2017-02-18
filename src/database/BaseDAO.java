package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class BaseDAO {

	protected String url = "jdbc:oracle:thin:@localhost:1521:XE";
	protected String username = "free_librarian";
    protected String password = "free_librarian";
    protected Connection connection = null;
	
	public BaseDAO() {
		super();
		init();
	}
	
	public void init()
	{
		try 
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connection= DriverManager.getConnection(url, username, password);
			System.out.println(url+" connection successfull");
		
		}
		catch (ClassNotFoundException e1) 
		{
			e1.printStackTrace();
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
	}
	
	public ResultSet execute(String sql)
	{
		ResultSet rs = null;
		try 
		{
			Statement stmt = connection.createStatement();
			rs = stmt.executeQuery(sql);
			System.out.println("Exectuing: "+sql);
		}
		catch (SQLException ex)
		{
			System.err.println("Error while querying: "+sql);
			ex.printStackTrace();
		}
		return rs;
	}
	
	public void close() 
	{
		try 
		{
			if (this.connection != null && !this.connection.isClosed())	
				this.connection.close();
		}
		catch (SQLException ex) 
		{
			ex.printStackTrace();
		}
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	
}
