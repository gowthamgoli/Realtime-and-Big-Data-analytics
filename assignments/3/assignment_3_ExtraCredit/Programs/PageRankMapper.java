import java.io.IOException;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;


public class PageRankMapper extends Mapper<LongWritable, Text, Text, Text> {

	protected Text word_key = new Text();
	protected Text word_value = new Text();
	
	@Override
	public void map(LongWritable key, Text value, Context context) throws IOException, InterruptedException {

		String line = value.toString();
		String[] tokens = line.split("\\s+");
		
		int outLinks = tokens.length - 2;
		float pagerank = Float.parseFloat(tokens[tokens.length - 1]);
		
		if (tokens.length > 2){
			for(int i=1; i<tokens.length-1; i++){
				word_key.set(tokens[i]);
				word_value.set(Float.toString(pagerank/outLinks));
				context.write(word_key, word_value);
				
				word_key.set(tokens[0]);
				word_value.set(tokens[i]);
				context.write(word_key, word_value);
			}
		}
			
	}
}
