import java.io.BufferedReader;
import java.io.StringReader;

public class WeatherAnalysis {

    public static void main(String[] args) throws Exception {

        // -------------------------------
        // Sample Weather Dataset (CSV format)
        // -------------------------------
        String data =
                "Date,Temperature,DewPoint,WindSpeed\n" +
                "2026-04-01,32.5,18.2,12.3\n" +
                "2026-04-02,34.1,19.0,10.5\n" +
                "2026-04-03,31.8,17.5,14.2\n" +
                "2026-04-04,33.0,18.8,11.0\n" +
                "2026-04-05,35.2,20.1,9.8";

        BufferedReader br = new BufferedReader(new StringReader(data));

        // -------------------------------
        // Initialize variables
        // -------------------------------
        double totalTemp = 0;
        double totalDew = 0;
        double totalWind = 0;
        int count = 0;

        String line;

        // -------------------------------
        // Skip header row
        // -------------------------------
        br.readLine();

        // -------------------------------
        // Process each record
        // -------------------------------
        while ((line = br.readLine()) != null) {
            String[] values = line.split(",");

            double temp = Double.parseDouble(values[1]);
            double dew = Double.parseDouble(values[2]);
            double wind = Double.parseDouble(values[3]);

            totalTemp += temp;
            totalDew += dew;
            totalWind += wind;

            count++;
        }

        // -------------------------------
        // Calculate and print averages
        // -------------------------------
        System.out.println("Average Temperature: " + (totalTemp / count));
        System.out.println("Average Dew Point: " + (totalDew / count));
        System.out.println("Average Wind Speed: " + (totalWind / count));
    }
}
