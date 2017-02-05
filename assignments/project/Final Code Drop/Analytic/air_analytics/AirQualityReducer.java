import java.io.IOException;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.io.FloatWritable;
import org.apache.hadoop.mapreduce.Reducer;

public class AirQualityReducer extends Reducer<Text, FloatWritable, Text, FloatWritable> {

	protected Text word_value = new Text();
	
	@Override
	public void reduce(Text key, Iterable<FloatWritable> values, Context context) throws IOException, InterruptedException {

		float sum = 0;
		int counter = 0;
		for(FloatWritable val: values){
			sum = sum + val.get();
			counter++;
		}
		sum = sum/counter;
		context.write(key, new FloatWritable(sum));
	}
	
}
