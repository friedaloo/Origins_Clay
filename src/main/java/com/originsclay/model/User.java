package com.originsclay.model;

public class User {

    private int id;
    private String firstName;
    private String lastName;
    private String email;
    private String phone;
    private String address;
    private String password;  // hashed
    private String role;    // "customer" | "admin"
    private boolean status;     // admin must approve new accounts
    private String username;
    private byte[] image; // Changed to byte[]
    
    public User() {}

    public User(int id, String firstName, String lastName, String username, String email,
            String phone, String address, String password, String role, 
            boolean status, byte[] image) {
    this.id = id;
    this.firstName = firstName;
    this.lastName = lastName;
    this.username = username; 
    this.email = email;
    this.phone = phone;
    this.address = address;
    this.password = password;
    this.role = role;
    this.status = status;
    this.image = image;       
}

    // ---------- Getters & Setters ----------

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getFirstName() { return firstName; }
    public void setFirstName(String firstName) { this.firstName = firstName; }

    public String getLastName() { return lastName; }
    public void setLastName(String lastName) { this.lastName = lastName; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }

    public boolean isstatus() {
    	System.out.println("Status: "+status);
    	return status; }
    public void setApproved(boolean status) { this.status = status; }

    public String getFullName() { return firstName + " " + lastName; }

	public void setstatus(boolean status) {
		this.status = status;
		
	}
	
	public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public byte[] getImage() {
        return image;
    }

    public void setImage(byte[] image) {
        this.image = image;
    }
}
