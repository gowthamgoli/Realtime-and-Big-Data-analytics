import java.util.ArrayList;
import java.util.List;

import twitter4j.Status;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.conf.ConfigurationBuilder;

public class TweetLister {
	public static void main(String[] args){
		ConfigurationBuilder cb = new ConfigurationBuilder();
		
		cb.setDebugEnabled(true);
		cb.setOAuthConsumerKey("gz6v1DnFU03Kb5v5TJDM7FIN6");
        cb.setOAuthConsumerSecret("UfqCjtIV0ISAPkdGoTBO7pci5tt96Jc0lG0IGZGLRb9ZbOlcYi");
        cb.setOAuthAccessToken("701990962457927681-sNhY0uRMEOJKBmz8C6Dzmj8EAd32QQk");
        cb.setOAuthAccessTokenSecret("1lWeEGsSrdVNw7WX9krqhSxd6gfR38BsOzoelDNrZStBQ");
	
        TwitterFactory tf = new TwitterFactory(cb.build());
        twitter4j.Twitter twitter = tf.getInstance();
        List<Status> status = new ArrayList<Status>();
		try {
			status = twitter.getHomeTimeline();
		} catch (TwitterException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        for(Status st: status){
        	System.out.println(st.getUser().getName()+"---------"+st.getText());
        }
	}
}
