package step2;

/** 
 *�����������ʵ����� 
 */
import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlElements;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Resouce {
	private String picLarge;
	private List<Property> Properties;

	@XmlElement
	public String getPicLarge() {
		return picLarge;
	}

	public void setPicLarge(String picLarge) {
		this.picLarge = picLarge;
	}

	// ������ڽڵ������һ��xmlԪ�ؽڵ㣬������
	@XmlElementWrapper(name = "properties")
	@XmlElement
	public List<Property> getProperties() {
		return Properties;
	}

	public void setProperties(List<Property> properties) {
		Properties = properties;
	}

}
