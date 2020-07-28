package Login;

public class ClientDAO {
	private String client_id;
	private String client_name;
    private String phone_number;
    private String client_password;
    private String salt_password;
    private String country;
    private String address;
    private String email;

    public String getClient_id() {
        return client_id;
    }
    public void setClient_id(String client_id) {
        this.client_id = client_id;
    }
    public String getClient_name() {
        return client_name;
    }
    public void setClient_name(String client_name) {
        this.client_name = client_name;
    }
    public String getPhone_number() {
        return phone_number;
    }
    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }
    public String getClient_password() {
        return client_password;
    }
    public void setClient_password(String client_password) {
        this.client_password = client_password;
    }
    public String getSalt_password() {
        return salt_password;
    }
    public void setSalt_password(String salt_password) {
        this.salt_password = salt_password;
    }
    public String getCountry() {
        return country;
    }
    public void setCountry(String country) {
        this.country = country;
    }
    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }


}
