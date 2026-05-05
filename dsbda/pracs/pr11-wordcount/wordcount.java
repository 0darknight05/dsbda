import java.util.HashMap;
import java.util.Map;

public class Main {
    public static void main(String[] args) {

        // -------------------------------
        // Input Data
        // -------------------------------
        String input = "Hello welcome to big data and big data analytics";

        // -------------------------------
        // Map Phase
        // -------------------------------
        String[] words = input.split("\\s+");
        HashMap<String, Integer> map = new HashMap<>();

        for (String word : words) {
            word = word.toLowerCase();
            map.put(word, map.getOrDefault(word, 0) + 1);
        }

        // -------------------------------
        // Reduce Phase (Output)
        // -------------------------------
        System.out.println("Word Count:");

        for (Map.Entry<String, Integer> entry : map.entrySet()) {
            System.out.println(entry.getKey() + " -> " + entry.getValue());
        }
    }
}
