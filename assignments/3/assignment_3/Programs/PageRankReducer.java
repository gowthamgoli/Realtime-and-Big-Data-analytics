import java.io.IOException;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;

public class PageRankReducer extends Reducer<Text, Text, Text, Text> {

	protected Text word_value = new Text();
	
	@Override
	public void reduce(Text key, Iterable<Text> values, Context context) throws IOException, InterruptedException {

		String buffer = "";
		float pagerank = 0;
		
		for(Text val: values){
			String v = val.toString();
			if (isNode(v)){
				buffer = buffer + " " + v ;
			}
			else if (isFloat(v)){
				pagerank = pagerank + Float.parseFloat(v);
			}
		}
		
		buffer = buffer + " " + Float.toString(pagerank);
		word_value.set(buffer);
		context.write(key, word_value);
	}
	
	public boolean isNode(String name) {
	    char[] chars = name.toCharArray();

	    for (char c : chars) {
	        if(!Character.isLetter(c)) {
	            return false;
	        }
	    }
	    return true;
	}
	
	public boolean isFloat(String str) {
        try {
            Float.parseFloat(str);
            return true;
        } catch (NumberFormatException e) {
            return false;
        }
    }
}
