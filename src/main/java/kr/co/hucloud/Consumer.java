package kr.co.hucloud;

import org.springframework.amqp.core.Message;
import org.springframework.amqp.core.MessageListener;


public class Consumer implements MessageListener {

	@Override
	public void onMessage(Message arg0) {
		String text = new String(arg0.getBody());
		System.out.println(text);
	}

}
