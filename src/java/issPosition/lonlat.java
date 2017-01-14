package issPosition;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;

import java.util.Scanner;

public class lonlat {

    private double longitude;
    private double latitude;
    private final String url = "http://api.open-notify.org/iss-now.json";

    public double getLatitude() {
        Gson gson = new GsonBuilder().create();
        try (InputStream stream = new URL(url).openStream()) {
            Scanner sc = new Scanner(stream);
            String responseBody = sc.useDelimiter("\\A").next();
            JsonObject jsonObject = gson.fromJson(responseBody, JsonObject.class);
            JsonObject iss_position = jsonObject.getAsJsonObject("iss_position");
            latitude = iss_position.get("latitude").getAsDouble();
            System.out.println(latitude + " " + longitude);
            stream.close();
        } catch (IOException e) {
        }
        return latitude;
    }

    public double getLongitude() {
        Gson gson = new GsonBuilder().create();
        try (InputStream stream = new URL(url).openStream()) {
            Scanner sc = new Scanner(stream);
            String responseBody = sc.useDelimiter("\\A").next();
            JsonObject jsonObject = gson.fromJson(responseBody, JsonObject.class);
            JsonObject iss_position = jsonObject.getAsJsonObject("iss_position");
            longitude = iss_position.get("longitude").getAsDouble();
            System.out.println(latitude + " " + longitude);
            
            stream.close();
        } catch (IOException e) {
        }
        return longitude;
    }

}
