package com.qualifier;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

/**
 *  @Qualifier ��֧�� placeholder
* */
public class tester {
	@Autowired
	@customQ("test_custom_qualifier")
	private Iteste ssss;
	
	@Autowired
	@anotherCustomQ("test_another_custom_qualifier")//anotherCustomQ��������CustomAutowireConfigurer�����ע����Ч�����ձ��autowire by type
	private Iteste tttt;

	@Autowired
	@customQ("testeeeeQual")
	private Iteste qqqq;
	
	public void call(){
		ssss.test();
		tttt.test();
		qqqq.test();
	}
	
	
}
