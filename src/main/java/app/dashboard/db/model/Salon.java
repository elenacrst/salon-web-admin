package app.dashboard.db.model;

import javax.persistence.*;

@Entity
@Table(name = "salon")
public class Salon {

    @Id
    @GeneratedValue
    @Column(name = "salon_id")
    private Long salonId;
    @Column(name = "name", nullable = false)
    private String name;
    @Column(name = "latitude", nullable = false)
    private double latitude;
    @Column(name = "longitude", nullable = false)
    private double longitude;

    public Salon(Long salonId, String name, double latitude, double longitude) {
        this.salonId = salonId;
        this.name = name;
        this.latitude = latitude;
        this.longitude = longitude;
    }
    public Salon() {
    }

    public Long getSalonId() {
        return salonId;
    }

    public void setSalonId(Long salonId) {
        this.salonId = salonId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getLatitude() {
        return latitude;
    }

    public void setLatitude(double latitude) {
        this.latitude = latitude;
    }

    public double getLongitude() {
        return longitude;
    }

    public void setLongitude(double longitude) {
        this.longitude = longitude;
    }
}
