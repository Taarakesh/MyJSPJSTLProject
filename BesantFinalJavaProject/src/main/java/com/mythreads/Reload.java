package com.mythreads;
import com.mydata.*;

public class Reload extends Thread{
	Data d;
	public Reload(Data d) {
		this.d=d;
		start();
	}
	public void run() {
		synchronized (d) {
			d.display();
		}
	}

}
