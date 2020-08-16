package Login;

import java.sql.Date;

public class RoomDAO {
    private int room_number;
    private String room_class;
    private String room_view;
    private int room_fee;
    private int max_number;
    private int bed_number;
    private boolean is_smoke;
    private Date checkin_date;
    private Date checkout_date;
    private int total_fee;

    public int getRoom_number() {
        return room_number;
    }
    public void setRoom_number(int room_number) {
        this.room_number = room_number;
    }
    public String getRoom_class() {
        return room_class;
    }
    public void setRoom_class(String room_class) {
        this.room_class = room_class;
    }
    public String getRoom_view() {
        return room_view;
    }
    public void setRoom_view(String room_view) {
        this.room_view = room_view;
    }
    public int getRoom_fee() {
        return room_fee;
    }
    public void setRoom_fee(int room_fee) {
        this.room_fee = room_fee;
    }
    public int getMax_number() {
        return max_number;
    }
    public void setMax_number(int max_number) {
        this.max_number = max_number;
    }
    public int getBed_number() {
        return bed_number;
    }
    public void setBed_number(int bed_number) {
        this.bed_number = bed_number;
    }
    public boolean isIs_smoke() {
        return is_smoke;
    }
    public void setIs_smoke(boolean is_smoke) {
        this.is_smoke = is_smoke;
    }
    public Date getCheckin_date() {
        return checkin_date;
    }
    public void setCheckin_date(Date checkin_date) {
        this.checkin_date = checkin_date;
    }
    public Date getCheckout_date() {
        return checkout_date;
    }
    public void setCheckout_date(Date checkout_date) {
        this.checkout_date = checkout_date;
    }
    public int getTotal_fee() {
        return total_fee;
    }
    public void setTotal_fee(int total_fee) {
        this.total_fee = total_fee;
    }


}
