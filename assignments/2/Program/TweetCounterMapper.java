import java.io.IOException;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;


public class TweetCounterMapper extends Mapper<LongWritable, Text, Text, IntWritable> {

	protected Text word = new Text();
	private final static IntWritable one = new IntWritable(1);
	private final static IntWritable zero = new IntWritable(0);
	@Override
	public void map(LongWritable key, Text value, Context context) throws IOException, InterruptedException {


		String[] keywords = {"hackathon", "Dec", "Chicago", "Java", "NYC"};
		String line = value.toString();

		for(int i=0; i<keywords.length; i++){
			if(line.toLowerCase().contains(keywords[i].toLowerCase())){
				word.set(keywords[i]);
				context.write(word, one);
			}
			else{
				word.set(keywords[i]);
				context.write(word, zero);
			}
		}
	}
}
