package com.team7.jsp;

/**
 * This class stores the account credentials necessary for MySQL. 
 * @author Terry Hong, Alexis Chan, Richard Tumaneng
 */

public class MySQLAccount {
	// Account Credentials.
 	private String db;
    private String user;
    private String password;
    
    public MySQLAccount(String db, String user, String password) {
    	this.db = db;
    	this.user = user;
    	this.password = password;
    }

    /* Basic getter and setter methods below */
	public String getDb() {
		return db;
	}

	public void setDb(String db) {
		this.db = db;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
