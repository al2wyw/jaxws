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
	@XmlElements({
	// @XmlElement(name = "property", type = Property.class),
	// @XmlElement(name = "adInfo", type =
	// AdInfo.class)һ�����Ͽ��Է��ö��xmlԪ�����ƺͶ������͡���xml�����໥�����ļ���Ԫ�أ��ް�����ϵ
	})
	public List<Property> getProperties() {
		return Properties;
	}

	public void setProperties(List<Property> properties) {
		Properties = properties;
	}

	public static void main(String[] args) {
		Property property = new Property();
		property.setElementName("elementName");
		property.setEntityField("entityField");
		property.setSequence("sequence");
		property.setStyleId(11111);

		Property property1 = new Property();
		property1.setElementName("elementName111");
		property1.setEntityField("entityField111");
		property1.setSequence("sequence1111");
		property1.setStyleId(22222);

		List<Property> list = new ArrayList<Property>();
		list.add(property);
		list.add(property1);

		Resouce resouce = new Resouce();
		resouce.setPicLarge("picLarge");
		resouce.setProperties(list);

		JAXB2Tester.bean2Xml(resouce);

	}

}
