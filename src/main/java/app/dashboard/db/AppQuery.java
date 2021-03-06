package app.dashboard.db;

public class AppQuery {
    public static final String INSERT_EMPLOYEE = "INSERT INTO public.employee(\n" +
            "password, first_name, last_name, email, phone, salon_id, employee_id)\n" +
            "VALUES ( :password, :firstName, :lastName, :email, :phone, :salonId, (SELECT COALESCE ( max(employee_id),  0)+1 FROM employee))";
    public static final String INSERT_SALON = "INSERT INTO public.salon(\n" +
            "salon_id, latitude, longitude, name)\n" +
            "VALUES ( (SELECT COALESCE ( max(salon_id),  0)+1 FROM salon), :latitude, :longitude, :name)";
}
